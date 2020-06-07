// Rack blade for Pi 4

include <BOSL-1.0.1/constants.scad>
use <BOSL-1.0.1/transforms.scad>
use <BOSL-1.0.1/shapes.scad>

//pi4 dimensions [85, 56, 1.25]
//pi4 holes [[3.5, 3.5], [61.5, 3.5], [3.5, 52.5], [61.5, 52.5]]
use <PiHoles/PiHoles.scad>

blade_height=100;

$fn=24;



one_u=44.45;

rack_width=240;
rack_height=3*one_u;

walls_thickness=3;

//(158 × 101 × 25 mm)
slot_width=7.5; //?
blade_width=35;
device_height=100; //?
blade_depth=90;

support_depth=85;

holes_r=1.5;
    
offset=15; // shift device on the plate a bit

extra=100;

//block_height=(rack_height-device_height)/2;
block_height=20;

difference(){
        
    //block with slide and bump
    union(){
        difference() {
            //block
            cuboid([blade_width,blade_depth,block_height]);

            //slide
            down(block_height/2) left(blade_width/2-slot_width*4/6) rot([90,0,0]) 
                cyl(blade_depth+extra,slot_width/2,slot_width/2);
        }

        //bump on slide
        bump_offset=4;
        down(block_height/2-(slot_width+bump_offset)/2) back(blade_depth/2-slot_width) rot([0,90,0]) 
            cyl(blade_width,slot_width/2,slot_width/2);
    }

    union(){
        //holes
        for (i = [1: 4]){
            fwd(blade_depth/2-i*10) rot([0,90,0]) cyl(blade_width+extra,holes_r,holes_r);
        } 

        //carve out inside block
        up(slot_width/2) 
            cuboid([blade_width-walls_thickness,blade_depth-walls_thickness,block_height-walls_thickness]);

        //carve out inside block (around slide)
        right((blade_width-walls_thickness)/4)
        back(walls_thickness/2)
            cuboid([(blade_width-walls_thickness)/2,blade_depth,block_height-walls_thickness]);



        //carve out back and sides
        up(slot_width/2) 
        back(blade_depth/2+5)
            cuboid([blade_width+extra,blade_depth,block_height-walls_thickness]);
        
    }
}