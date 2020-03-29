//// Rack for Ubiquity Security Gateway
//
//difference(){
//difference(){
//
//union(){
////faceplate
//cube([200,44.5,3]);
//    
////USG support    
//translate([(200-135)/2-3,15/2-3,0]) cube([135+6,30+6,30]);
//}
//
//// USG face/hole
//translate([(200-135)/2,15/2,-2]) cube([135,30,60]);
//}
//
//
//$fn=36;
//
//////holes (4 holes, 1 and 3 in 1U)
////union(){
////translate([13,6,-1]) cylinder(10,2.5,2.5);
////
////translate([13,45-6,-1]) cylinder(10,2.5,2.5);
////
////translate([200-13,6,-1]) cylinder(10,2.5,2.5);
////
////translate([200-13,45-6,-1]) cylinder(10,2.5,2.5);
////}
//
//
////holes (2 holes, hole 2 only in 1U)
//union(){
//translate([13,45/2,-1]) cylinder(10,2.5,2.5);
//
//translate([200-13,45/2,-1]) cylinder(10,2.5,2.5);
//}
//
//
//
//}



// Rack for Ubiquity Security Gateway

one_u=44.45;

rack_width=240;
rack_height=1*one_u;


//(158 × 101 × 25 mm)
device_width=135+1; //?
device_height=30+1; //?
device_depth=101; //? this is only used to make a hole

support_depth=30;

offset=16; // shift device on the plate a bit



difference(){
difference(){

difference(){
union(){
//faceplate
cube([rack_width,rack_height,3]);
    
//device support    
translate([(rack_width-device_width)/2-3+offset,15/2-3,0]) cube([device_width+6,support_depth+6,support_depth]);
}

// unifi logo
color("black") translate([0,62,-10]) linear_extrude(15) mirror([0,1,0]) scale([0.35,0.35,0.35]) import (file = "vectors/unifi-wifi-logo.dxf");

}

//device face/hole
translate([(rack_width-device_width)/2+offset,15/2,-2]) cube([device_width,support_depth,device_depth]);
}


$fn=36;

////holes (4 holes, 1 and 3 in 1U)
//union(){
//translate([13,6,-1]) cylinder(10,2.5,2.5);
//
//translate([13,45-6,-1]) cylinder(10,2.5,2.5);
//
//translate([200-13,6,-1]) cylinder(10,2.5,2.5);
//
//translate([200-13,45-6,-1]) cylinder(10,2.5,2.5);
//}


//holes (2 holes, hole 2 only in 1U)
union(){
translate([13,rack_height/2,-1]) cylinder(10,2.5,2.5);

translate([rack_width-13,rack_height/2,-1]) cylinder(10,2.5,2.5);
}



}