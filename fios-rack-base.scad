// Components of rack for FIOS network device

include <BOSL-1.0.1/constants.scad>
use <BOSL-1.0.1/transforms.scad>
use <BOSL-1.0.1/shapes.scad>
use <BOSL-1.0.1/masks.scad>

one_u=44.45;

rack_width=120;
rack_height=6*one_u;
echo(rack_height);

walls_thickness=3;
rails_width=20;


//(158 × 101 × 25 mm)
device_width=60+1; //?
device_height=180+1; //?
device_depth=101; //? this is only used to make a hole

support_depth=30;

offset=0; // shift device on the plate a bit

$fn=26;

r=7.5/2; //radius of plate edges aka half thickness of plate edges

r_bolt=1; //radius for bolts for faceplate/handle

extra=100;

difference(){
    union(){
        //main plate
        cuboid([rack_width,(rack_height-device_height)/2,walls_thickness]);
        
        //support for device
        back((rack_height-device_height)/2/2-walls_thickness/2) 
        down(support_depth/2+walls_thickness/2)
            cuboid([device_width,walls_thickness,support_depth]);
        

        //support for device
        back((rack_height-device_height)/2/2-walls_thickness/2) 
        down(support_depth/2+walls_thickness/2)
            cuboid([rack_width-rails_width*2,walls_thickness,support_depth]);


        //bars for strength
        left(20) down(10) back(10)
        rot([90,90,0]) right_triangle([20, walls_thickness, 20], center=true);

        right(20) down(10) back(10)
        rot([90,90,0]) right_triangle([20, walls_thickness, 20], center=true);
        
    }

    union(){
        //holes (2 holes, hole 2 only in 1U)
        translate([-(rack_width)/2+13,(one_u/2)/2,0]) cyl(extra,2.5,2.5);
        translate([(rack_width)/2-13,(one_u/2)/2,0]) cyl(extra,2.5,2.5);
        
        
        //holes for connecting bolts
        connecting_bolt=1.5;

        translate([-(rack_width-rails_width*2)/2+5,(one_u/2)/2,-10]) 
            rot([90,0,0]) cyl(extra,connecting_bolt,connecting_bolt);

        translate([(rack_width-rails_width*2)/2-5,(one_u/2)/2,-10]) 
            rot([90,0,0]) cyl(extra,connecting_bolt,connecting_bolt);


        translate([-(rack_width-rails_width*2)/2+5,(one_u/2)/2,-25]) 
            rot([90,0,0]) cyl(extra,connecting_bolt,connecting_bolt);

        translate([(rack_width-rails_width*2)/2-5,(one_u/2)/2,-25]) 
            rot([90,0,0]) cyl(extra,connecting_bolt,connecting_bolt);
        
    }


}

