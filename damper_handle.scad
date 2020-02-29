// damper control handle/hardware for HVAC
// https://www.mcmaster.com/damper-control-handles


difference(){
//ring around damper bolt
difference(){
cylinder(10,10,10);
translate ([0,0,-5]) cylinder(20,4,4);
}

//holes for fixing bolts
union(){ 
translate([0,0,5])
  rotate([90,0,0])
    cylinder(10,2,2);
 
translate([-10,0,5])
  rotate([0,90,0])
    cylinder(20,2,2);
}
}

//handle with hole in it
difference(){
translate([-5,5,2.5]) cube([10,40,5]);
translate([0,40,0]) cylinder(10,2,2);
}