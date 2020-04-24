// Rack for bunch of Raspberry Pi-s
one_u=44.45;

rack_width=240;
rack_height=3*one_u;

walls_thickness=3;


//(158 × 101 × 25 mm)
device_width=158+1; //?
device_height=25+1; //?
device_depth=101; //? this is only used to make a hole

support_depth=30;

offset=16; // shift device on the plate a bit


difference(){

difference(){
union(){
//faceplate
cube([rack_width,rack_height,walls_thickness]);
    
//device support    
translate([(rack_width-device_width)/2-walls_thickness+offset,rack_height/2-(device_height/2+walls_thickness),0]) 
    cube([device_width+2*walls_thickness,device_height+2*walls_thickness,support_depth]);
}

// pi logo
translate([25,100,0]) 
linear_extrude(height = 10)
   resize([16,20]) 
   import (file = "/Users/dkachaev/Dropbox/raspberrypi_logo.dxf", scale=0.1);
}






$fn=36;


//holes (2 holes, hole 2 only in 1/3U)
union(){
    translate([13,one_u/2,-1]) cylinder(10,2.5,2.5);

    translate([rack_width-13,one_u/2,-1]) cylinder(10,2.5,2.5);


    translate([13,rack_height-one_u/2,-1]) cylinder(10,2.5,2.5);

    translate([rack_width-13,rack_height-one_u/2,-1]) cylinder(10,2.5,2.5);

}
}



