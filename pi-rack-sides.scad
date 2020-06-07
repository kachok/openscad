include <dotSCAD-2.1/src/rounded_square.scad>;

// Modular rack for Raspberry Pi blade system (sides)

one_u=44.45;

rack_width=240;
rack_height=3*one_u;

walls_thickness=3;

//(158 × 101 × 25 mm)
device_width=175; //?
device_height=100; //?
device_depth=50; //? this is only used to make a hole

support_depth=85;
    
offset=7; // shift device on the plate a bit

$fn=24;

left_bracket_width=(rack_width-device_width)/2+offset;
right_bracket_width=(rack_width-device_width)/2-offset;

module left_bracket()
{
    difference(){
        cube([left_bracket_width,rack_height,walls_thickness]);
        union(){
            translate([13,one_u/2,-1]) cylinder(10,2.5,2.5);
            translate([13,one_u/2+2*one_u,-1]) cylinder(10,2.5,2.5);
            
            // device number
            translate([16,10+rack_height/2,-2]) 
            mirror([0,1,0])
            linear_extrude(height = 10)
               resize([16,20]) 
               import (file = "vectors/raspberrypi_logo.dxf", scale=0.1);
            

        }
    }
    translate([left_bracket_width-walls_thickness*2,0,0]) difference() { 
        difference() {
            cube([walls_thickness*2,rack_height,device_depth]);
            translate([-10, 20,10]) cube([walls_thickness+20,rack_height-40,device_depth]);
        }

        union() {
            
            translate([-10,rack_height-10, 10]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, 20]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, 30]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, 40]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, device_depth-10]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, device_depth-20]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, device_depth-30]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, device_depth-40]) rotate([0,90,0]) cylinder(50,1.5,1.5);


            translate([-10,10, 10]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, 20]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, 30]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, 40]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, device_depth-10]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, device_depth-20]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, device_depth-30]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, device_depth-40]) rotate([0,90,0]) cylinder(50,1.5,1.5);

        }
    }
    
}

module right_bracket()
{
    difference(){
        cube([right_bracket_width,rack_height,walls_thickness]);
        union(){
            translate([13,one_u/2,-1]) cylinder(10,2.5,2.5);
            translate([13,one_u/2+2*one_u,-1]) cylinder(10,2.5,2.5);
        }
    }
    translate([right_bracket_width-walls_thickness*2,0,0]) difference() {
        difference() {
            cube([walls_thickness*2,rack_height,device_depth]);
            translate([-10, 20,10]) cube([walls_thickness+20,rack_height-40,device_depth]);
        }
        union() {
            
            translate([-10,rack_height-10, 10]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, 20]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, 30]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, 40]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, device_depth-10]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, device_depth-20]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, device_depth-30]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,rack_height-10, device_depth-40]) rotate([0,90,0]) cylinder(50,1.5,1.5);


            translate([-10,10, 10]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, 20]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, 30]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, 40]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, device_depth-10]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, device_depth-20]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, device_depth-30]) rotate([0,90,0]) cylinder(50,1.5,1.5);
            translate([-10,10, device_depth-40]) rotate([0,90,0]) cylinder(50,1.5,1.5);

        }
    }

}

color("green") translate([0,0,0]) left_bracket();

color("green") translate([100,0,0]) right_bracket();