include <dotSCAD-2.1/src/rounded_square.scad>;

// Rack for FIOS router/wifi

module rack(){
one_u=44.45;

rack_width=120;
rack_height=6*one_u;

walls_thickness=3;

//(158 × 101 × 25 mm)
device_width=60+1; //?
device_height=230+1; //?
device_depth=120; //? this is only used to make a hole

support_depth=85;

offset=0; // shift device on the plate a bit

difference(){
difference(){

difference(){
union(){
//faceplate
cube([rack_width,rack_height,walls_thickness]);
    
//device support    
translate([(rack_width-device_width)/2-walls_thickness+offset,rack_height/2-(device_height/2+walls_thickness),0]) 
    cube([device_width+2*walls_thickness,device_height+2*walls_thickness,support_depth]);
}

// device number
//translate([30,37.5,-2]) 
//mirror([0,1,0])
//linear_extrude(height = 10)
//   resize([16,20]) 
//   import (file = "/Users/dkachaev/Dropbox/raspberrypi_logo.dxf", scale=0.1);
}

//device face/hole
//translate([(rack_width-device_width)/2+offset,device_height/2,-2]) 
translate([(rack_width-device_width)/2+offset,rack_height/2-(device_height/2),-2]) 
    cube([device_width,device_height,device_depth]);
}


$fn=36;

//holes (2 holes, hole 2 only in 1U)
union(){
translate([13,one_u/2,-1]) cylinder(10,2.5,2.5);

translate([rack_width-13,one_u/2,-1]) cylinder(10,2.5,2.5);

translate([13,one_u/2+5*one_u,-1]) cylinder(10,2.5,2.5);

translate([rack_width-13,one_u/2+5*one_u,-1]) cylinder(10,2.5,2.5);

}


}
}

rotate([180,0,0]) rack();