// Mount for server rack rails on 2020 extrusion

use <OpenSCAD_connectors/corner_bracket.scad>

$fn=24;

module bracket(){

difference(){    

union(){
difference(){

union(){
cube([6,30,15]);
translate([2,2,0]) cube([4,28,45]);
cube([50,30,4]);    
}

translate([-5,17,24+15]) 
    rotate([0,90,0])
        cylinder(20,2.6,2.6);
}

difference(){
 translate([6,0,4]) cube([10,30,10]);
 translate([6+10,0,4+10]) rotate([-90,0,0]) cylinder(30,10,10);
} 
}
union(){
translate([20,10,0]) cylinder(10,2.6,2.6);
translate([40,10,0]) cylinder(10,2.6,2.6);
}
}
//difference(){
// corner_bracket(3, 0, 1);
// translate([-10,-10,15]) cube([40,40,40]);
//} 
 }
 
rotate([-90,0,0]) bracket();

 //translate([10,-20,0]) corner_bracket(3, 0, 1);

 
rotate([-90,0,0]) translate([105,0,0]) mirror([1,0,0]) bracket();
 

// use <OpenSCAD_connectors/tjoint.scad>
// tjoint([4,2], [3,1]);

// use <OpenSCAD_connectors/connector.scad>
// connector([2,2]);