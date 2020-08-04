// Handle for rack blade for Pi 4

include <BOSL-1.0.1/constants.scad>
use <BOSL-1.0.1/transforms.scad>
use <BOSL-1.0.1/shapes.scad>
use <BOSL-1.0.1/masks.scad>
use <BOSL-1.0.1/beziers.scad>

//pi4 dimensions [85, 56, 1.25]
//pi4 holes [[3.5, 3.5], [61.5, 3.5], [3.5, 52.5], [61.5, 52.5]]
pi4_dimensions=[85, 56, 1.25];
pi4_holes=[[3.5, 3.5], [61.5, 3.5], [3.5, 52.5], [61.5, 52.5]];

blade_depth=90;
blade_height=100-1;

overlap=10;

pi_depth=85;
pi_height=56;

$fn=26;

r=7.5/2; //radius of plate edges aka half thickness of plate edges

r_bolt=1; //radius for bolts for faceplate/handle

extra=100;

include <BOSL-1.0.1/constants.scad>
use <BOSL-1.0.1/beziers.scad>

height=10;
length=(blade_height+overlap)/4;

wall=3;

function reverse(list) = [for (i = [len(list)-1:-1:0]) list[i]];

module curve(){
    path=[[0,0],
    [length/2,0],
    [length/2,height],
    [length,height]];

    path2=[[0,0+wall],
    [length/2,0+wall],
    [length/2,height+wall],
    [length,height+wall]];

    $fn=48;


    a=bezier_polyline(path,48);
    b=reverse(bezier_polyline(path2,48));

    c=concat(a,b);

    echo(c);

    left(-1.5) rot([0,0,90]) linear_extrude(40) {
        polygon(points=c);
    }
    
    left(11.5) back(27) cube([wall,8,40]);
    left(1.5) back(-5) cube([wall,5,40]);
}


module handle(){
    difference() {
        union() {
            //backing plate
            cuboid([3, blade_height+overlap,r*2]);
            back(20) down(r) curve();
        }
        

        
        union() {
            //holes for faceplate/handle bolts
            fwd(blade_height/4) rot([0,90,0]) cyl(blade_depth+extra, r_bolt,r_bolt);
            back(blade_height/4) rot([0,90,0]) cyl(blade_depth+extra, r_bolt,r_bolt);
            fwd(blade_height/8*3) rot([0,90,0]) cyl(blade_depth+extra, r_bolt,r_bolt);
            back(blade_height/8*3) rot([0,90,0]) cyl(blade_depth+extra, r_bolt,r_bolt);            
        }
    }
}


left(75) color("green") handle();

//	Parameters
//		board: the version of the raspberry pi to generate holes for
//		height: the height of the standoffs in mm
module piStandoffs (height) {
	hd = 2.5; // M2 bolt? (pi hole is 2.7mm diameter)
    wall=3.3/2; //standoff wall thickness
    
	
	//mounting holes
	for(holePos = pi4_holes) {
		translate([holePos[0], holePos[1], -height])
            cylinder(height, d=hd+wall, false);
	}
}


module piStandoffsHoles (height) {
	hd = 2.5; // M2 bolt? (pi hole is 2.7mm diameter)
    wall=3.3/2; //standoff wall thickness
    
	
	//mounting holes
	for(holePos = pi4_holes) {
		translate([holePos[0], holePos[1], -height])
            down(extra/2) #cylinder(extra, d=hd);
	}
}

module blade(){
difference() {
    union() {
        //main plate
        cuboid([blade_depth,blade_height-r*2,r*2]);

        //edges
        fwd(blade_height/2-r)
        rot([0,90,0])
        cyl(blade_depth, r,r);

        back(blade_height/2-r)
        rot([0,90,0])
        cyl(blade_depth, r,r);

        //standoff
        translate ([pi_depth-blade_depth/2,pi_height-blade_height/2+2*r,0]) 
            up(7.5/2+2.5/2) 
            rot([0,0,180])  
            piStandoffs(height=2.5/2);
    }
    
    union(){

        //standoff holes
        translate ([pi_depth-blade_depth/2,pi_height-blade_height/2+2*r,0]) 
            up(7.5/2+2.5/2) 
            rot([0,0,180])  
            piStandoffsHoles(height=2.5/2);

        //big hole behind pi
        right(7.5)
            cuboid([58-10,blade_height-15,extra], fillet=3.5);
        
        //holes for faceplate/handle bolts
        fwd(blade_height/4) rot([0,90,0]) cyl(blade_depth+extra, r_bolt,r_bolt);
        back(blade_height/4) rot([0,90,0]) cyl(blade_depth+extra, r_bolt,r_bolt);
        fwd(blade_height/8*3) rot([0,90,0]) cyl(blade_depth+extra, r_bolt,r_bolt);
        back(blade_height/8*3) rot([0,90,0]) cyl(blade_depth+extra, r_bolt,r_bolt);

        //holes grid
        for (j = [0: 8]){
           for (i = [0: 8]){
                if (i!=0 && i!=5) {
                    //left(j*(58/6)) fwd(blade_height/2-11-(49/5)*i) right(36.5) cyl(blade_depth+extra, 3.5,3.5);       
                } 
            }  
        }        
        
        //small hole behind pi
        left(33)
            cuboid([58/6*1+3.5*2-4,blade_height-15,extra], fillet=3.5);

        //small hole/cutout in the back
        right(48)
            cuboid([58/6*1+3.5*2-4,blade_height-15,extra], fillet=3.5);

        //bumps
        bump_offset=4;
        right(blade_depth/2-r*2)  fwd(blade_height/2) cyl(blade_depth+extra, r,r); 
        right(blade_depth/2-r*2) back(blade_height/2) cyl(blade_depth+extra, r,r); 

        //fillet on blade edges in the back
        right(blade_depth/2) fwd(blade_height/2) #fillet_mask_z(l=extra, r=r);
        right(blade_depth/2) back(blade_height/2) #fillet_mask_z(l=extra, r=r);

    }
}



   //back(20) right(38) cyl(blade_depth+extra, 3.5,3.5);        
   //right(36.5) cyl(blade_depth+extra, 3.5,3.5);        


}

