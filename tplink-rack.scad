// Rack for TP-Link 8 ports Gigabit Ethernet Hub

one_u=44.45;

rack_width=200;
rack_height=1*one_u;


//(158 × 101 × 25 mm)
device_width=158; //?
device_height=25; //?
device_depth=101; //? this is only used to make a hole

support_depth=30;



difference(){
difference(){

union(){
//faceplate
cube([rack_width,rack_height,3]);
    
//device support    
translate([(rack_width-device_width)/2-3,15/2-3,0]) cube([device_width+6,support_depth+6,support_depth]);
}

//device face/hole
translate([(rack_width-device_width)/2,15/2,-2]) cube([device_width,support_depth,device_depth]);
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