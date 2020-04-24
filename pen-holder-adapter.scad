// Rack blade for Pi 4

include <BOSL-1.0.1/constants.scad>
use <BOSL-1.0.1/transforms.scad>
use <BOSL-1.0.1/shapes.scad>

difference(){
cuboid([60,45,3], fillet=1);

$fn=36;

union() {
// old holes
back(9) cyl(l=10, r=1.25);
fwd(9) left(26) cyl(l=10, r=1.25);
fwd(9) right(26) cyl(l=10, r=1.25);

up(1.5) back(9) cyl(l=3, d1=4, d2=5);    
up(1.5) fwd(9) left(26)  cyl(l=3, d1=4, d2=5);    
up(1.5) fwd(9) right(26) cyl(l=3, d1=4, d2=5);    
   

//new holes
//29.5

back(18) left(29.5/2) cyl(l=10, r=1.25);
back(18) right(29.5/2) cyl(l=10, r=1.25);
fwd(36-18) left(29.5/2) cyl(l=10, r=1.25);
fwd(36-18) right(29.5/2) cyl(l=10, r=1.25);


//cutouts
 
fwd(5) cuboid([45,17.5,10], fillet=2);
 
    
}



}

