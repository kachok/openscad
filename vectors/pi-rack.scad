include <dotSCAD-2.1/src/rounded_square.scad>;

difference(){
linear_extrude(height = 3)
rounded_square(size = [165,30], corner_r = 2);

translate([15,4,0]) 
linear_extrude(height = 10)
   resize([16,20]) 
   import (file = "/Users/dkachaev/Dropbox/raspberrypi_logo.dxf", scale=0.1);
}