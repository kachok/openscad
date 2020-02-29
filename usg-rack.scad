// Rack for Ubiquity Security Gateway

difference(){
difference(){

union(){
//faceplate
cube([200,45,3]);
    
//USG support    
translate([(200-135)/2-3,15/2-3,0]) cube([135+6,30+6,30]);
}

// USG face/hole
translate([(200-135)/2,15/2,-2]) cube([135,30,60]);
}


//holes
union(){
translate([13,6,-1]) cylinder(10,2.5,2.5);

translate([13,45-6,-1]) cylinder(10,2.5,2.5);

translate([200-13,6,-1]) cylinder(10,2.5,2.5);

translate([200-13,45-6,-1]) cylinder(10,2.5,2.5);
}
}