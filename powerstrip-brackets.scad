// Mount for power strip on 2020 extrusion

use <OpenSCAD_connectors/corner_bracket.scad>

$fn=24;



module bracket(){
    
width=45;
thickness=4;
    
size=20; //2020
    
hole_size=2.6;
    
gap=60; //difference between space between 2020 and length of power strip

extra=10; //overlap of bracket and powerstrip
    
hole_distance=25; //distance between powerstrip mounting holes
powerstrip_lip=10; //mounting lip for powerstrip width    

module holes() {
        translate([10,10,-5]) cylinder(10,2.6,2.6);
        translate([10,10+hole_distance,-5]) cylinder(10,2.6,2.6);

        translate([15,10,10+4]) rotate([90,0,90]) cylinder(10,2.6,2.6);
        translate([15,10+hole_distance,10+4]) rotate([90,0,90]) cylinder(10,2.6,2.6);   

        hull() {
        translate([gap/2+size/2+thickness+extra,10,-5]) cylinder(10,2.6,2.6);
        translate([gap/2+size/2+thickness+extra-10,10,-5]) cylinder(10,2.6,2.6);
        }

        hull() {
        translate([gap/2+size/2+thickness+extra,10+hole_distance,-5]) cylinder(10,2.6,2.6);
        translate([gap/2+size/2+thickness+extra-10,10+hole_distance,-5]) cylinder(10,2.6,2.6);
        }
}



difference(){    

    union(){
            union(){
                translate([size,0,0]) cube([thickness,width,size+thickness]);
                cube([gap/2+size+thickness+extra,width,thickness]);    
            }            

            difference(){
                translate([24,0,4]) cube([5,width,5]);
                translate([24+5,0,4+5]) rotate([-90,0,0]) cylinder(width,5,5);
            } 
    }

    //holes
    holes();

}
//difference(){
// corner_bracket(3, 0, 1);
// translate([-10,-10,15]) cube([40,40,40]);
//} 
 }
 


 
rotate([-90,0,0]) bracket();


 
rotate([-90,0,0]) translate([140,0,0]) mirror([1,0,0]) bracket();
 

// use <OpenSCAD_connectors/tjoint.scad>
// tjoint([4,2], [3,1]);

// use <OpenSCAD_connectors/connector.scad>
// connector([2,2]);