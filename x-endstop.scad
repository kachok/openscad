// x axis endstop for Solidoodle 2 using lawsy carriage

difference(){
    
union(){
  translate([0,0,0])
    cube([5,30,10]);
    
 
  translate([0,0,0])
    cube([20,3,10]);
    
  translate([0,25,0])
    cube([10,5,10]);
};

  translate([15,7,5])
    rotate([90,0,0])
    cylinder(10,2,2);
  }  