$fn=36;

module cover(length){
    //marging of error
    err=0.1;
    //extrusion slide width
    extr_width=6.2+err;

    //extrusion wall thickness
    extr_wall=1.8;

    //depth of gap into extrusion ~
    extr_depth=extr_wall*2;

    linear_extrude(length) {
       square([20,4]);
        
       translate([10-extr_width/2,4]) square([extr_width,extr_wall]);


       translate([10-extr_width/2,4+extr_wall]) square([1.5,extr_depth]);
       translate([10+extr_width/2-1.5,4+extr_wall]) square([1.5,extr_depth]);
           
       
    }
}


//top left
translate([0,20,0]) rotate([90,0,180]) cover(110);
translate([0,0,0]) rotate([90,0,90]) cover(80);
translate([-20,0,0]) cube([20,20,4]);

//under handle
cover(80);

//bottom left
//translate([0,20,0]) rotate([90,0,180]) cover(110);
//translate([0,0,0]) rotate([90,0,90]) cover(80);
//translate([-20,0,0]) cube([20,20,4]);
