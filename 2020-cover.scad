$fn=36;

linear_extrude(10) {
   square([20,4]);
    
   translate([10-6.2/2,4]) square([6.2,1.8]);


   difference(){

       difference(){
       translate([10,8]) circle(d=8);

       translate([10,8]) circle(d=6);
       }
       
   translate([0,9]) square([20,20]);
       
   }
}