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

module standoffs() {
            zrot(180) translate([-85/2, -56/2, 7.5]) piStandoffs(  "4B", height=4);
    
    
   
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


    union() {
        difference() {
            //blade plate
            sliding_plate(blade_depth,blade_height);

            hole();

        }

        //pi standoffs
        left(blade_depth/2-85/2) fwd(blade_height/2-56/2-5) standoffs();
    }







