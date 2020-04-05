// magnetic pegs to hold speaker grills

include <BOSL-1.0.1/constants.scad>
use <BOSL-1.0.1/transforms.scad>
use <BOSL-1.0.1/shapes.scad>



width=25;
height=15;
hole_height=3;
hole_diameter=6;

screw_diameter=5;
wall=3;


difference() {
cuboid([width,width,height], chamfer=2.5, edges=EDGE_TOP_FR+EDGE_TOP_RT+EDGE_TOP_LF+EDGE_TOP_BK+EDGE_FR_RT+EDGE_FR_LF+EDGE_BK_RT+EDGE_BK_LF, $fn=24);

up(height/2-hole_height/2) cyl(l=hole_height, r=hole_diameter/2, $fn=24);
}


difference(){
    hull(){
        forward(width/2+5) down(height/2-5/2) cyl(l=5, r=screw_diameter/2+wall, chamfer2=1,$fn=24);
        back(width/2+5) down(height/2-5/2) cyl(l=5, r=screw_diameter/2+wall, chamfer2=1, $fn=24);
    }

    union(){
        forward(width/2+5) down(height/2-5/2) cyl(l=5, r=screw_diameter/2,$fn=24);
        back(width/2+5) down(height/2-5/2) cyl(l=5, r=screw_diameter/2, $fn=24);
    }

}
