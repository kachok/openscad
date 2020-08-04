// Rack for FIOS network device

one_u=44.45;

rack_width=120;
rack_height=6*one_u;

walls_thickness=3;


//(158 × 101 × 25 mm)
device_width=60+1; //?
device_height=180+1; //?
device_depth=101; //? this is only used to make a hole

support_depth=30;

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
//text_size=16;
//color("black") translate ([32,one_u/2+text_size/2,-10]) linear_extrude(15) mirror([0,1,0]) text("1",font="Verdana:Bold", size=text_size);
}

//device face/hole
//translate([(rack_width-device_width)/2+offset,device_height/2,-2]) 
translate([(rack_width-device_width)/2+offset,rack_height/2-(device_height/2),-2]) 
    cube([device_width,device_height,device_depth]);
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