// Rack blade for Pi 4

include <BOSL-1.0.1/constants.scad>
use <BOSL-1.0.1/transforms.scad>
use <BOSL-1.0.1/shapes.scad>

//pi4 dimensions [85, 56, 1.25]
//pi4 holes [[3.5, 3.5], [61.5, 3.5], [3.5, 52.5], [61.5, 52.5]]
use <PiHoles/PiHoles.scad>

blade_depth=90;
blade_height=100;

$fn=26;

module sliding_plate(depth, height) {
    r=7.5/2; //radius of plate edges aka half thickness of plate edges
    difference(){
        cuboid([depth,height,r*2], fillet=r, edges=EDGE_TOP_FR+EDGE_BOT_FR+ EDGE_TOP_BK+EDGE_BOT_BK, $fn=24);
        //translate([0,0,r]) cuboid([depth,height-r*2,r*2]);
    }

}




module hole() {
    d=84;
    h=54;
    m=15;
    
    shift=3;
    
    translate([shift-(blade_depth-d)/2, -(blade_height-h)/2+5, 4]) cuboid([d-m,h-m,40],fillet=5);

    translate([shift-(blade_depth-d)/2, -(blade_height-h)/2+48, 4]) cuboid([d-m,h-m-10,40],fillet=5);

   for (i = [1: 9]){
        for (j = [1: 10]){
            translate([-(blade_depth)/2+i*10-5, -(blade_height)/2+j*10-4, -10]) 
            cyl(l=40, r=3);
        }
    }  

}

module blade(){
    union() {
        difference() {
            //blade plate
            sliding_plate(blade_depth,blade_height);

            //hole();

        }

    }
}


one_u=44.45;

rack_width=240;
rack_height=3*one_u;

walls_thickness=3;

//(158 × 101 × 25 mm)
slot_width=7.5; //?
blade_width=30;
device_height=100; //?
blade_depth=90;

support_depth=85;
    
offset=15; // shift device on the plate a bit

$fn=24;


fwd(rack_height/2-16) right(blade_depth/2-10) cylinder(15,7.5/2,7.5/2);
   
difference(){ 

    cuboid([blade_depth, rack_height, blade_width]);

    union(){
        cuboid([blade_depth+5, device_height-7.5, blade_width+5]);
        up(8) blade();
        
        right(10) fwd(rack_height/2) down(5) cuboid([blade_depth-5+20, 30, blade_width]);
        
        right(10) fwd(rack_height/2) down(15) cuboid([blade_depth-5+20, 36, blade_width]);

        right(55) fwd(rack_height/2) down(-5) cuboid([blade_depth-5+20, 30, blade_width]);



        right(5)
        union() {
            translate([-10,-rack_height/2+10, 0]) rotate([0,0,0]) cylinder(50,1.5,1.5);
            translate([-20,-rack_height/2+10, 0]) rotate([0,0,0]) cylinder(50,1.5,1.5);
            translate([-30,-rack_height/2+10, 0]) rotate([0,0,0]) cylinder(50,1.5,1.5);
            translate([-40,-rack_height/2+10, 0]) rotate([0,0,0]) cylinder(50,1.5,1.5);
        }        

    back(rack_height/2) cuboid([blade_depth, rack_height, blade_width]);



    }
}



