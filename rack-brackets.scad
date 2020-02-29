// Mount for server rack rails on 2020 extrusion

use <OpenSCAD_connectors/corner_bracket.scad>

module bracket(){
difference(){

union(){
cube([2,20,15]);
translate([2,2,0]) cube([2,28,45]);
}

translate([-5,17,24+15]) 
    rotate([0,90,0])
        cylinder(10,3,3);
}

difference(){
 corner_bracket(2, 0, 1);
 translate([-10,-10,15]) cube([40,40,40]);
} 
 }
 
 bracket();
 
translate([85,0,0]) mirror([1,0,0]) bracket();
 

// use <OpenSCAD_connectors/tjoint.scad>
// tjoint([4,2], [3,1]);

// use <OpenSCAD_connectors/connector.scad>
// connector([2,2]);