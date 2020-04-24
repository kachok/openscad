
include <BOSL-1.0.1/constants.scad>
use <BOSL-1.0.1/transforms.scad>
use <BOSL-1.0.1/shapes.scad>

f=1.5+0.025; //diameter of fiber

$fn=36;

difference(){
cuboid([3*f+3,3*f+3,5], fillet=2,edges=EDGE_BK_RT+EDGE_BK_LF+EDGE_FR_LF+EDGE_FR_RT);
cuboid([3*f,3*f,10], fillet=1.5/2);
}


module holes(w){

cyl(l=10, r=f/2);
right(w) cyl(l=10, r=f/2);
left(w) cyl(l=10, r=f/2);
    
}

module feeder(w){

difference(){
cuboid([w*4,w*4,2], fillet=2,edges=EDGE_BK_RT+EDGE_BK_LF+EDGE_FR_LF+EDGE_FR_RT);

union(){

holes(5);

fwd(w) holes(5);
    
back(w) holes(5);

}

}    
}



right(20) feeder(10);
left(20) feeder(5);

