use <dotSCAD-2.2.1/src/voronoi2d.scad>;
use <dotSCAD-2.2.1/src/hollow_out.scad>;

module plate(x,y,density,overflow, thickness, height, border){



xs = rands(0, x*(1+2*overflow), x*(1+2*overflow)*density);
ys = rands(0, y*(1+2*overflow), y*(1+2*overflow)*density);

points = [for(i = [0:len(xs)-1]) [xs[i], ys[i]]];


linear_extrude(height){
difference() {
    square([x, y]);
    translate([-x*overflow,-y*overflow,0]) voronoi2d(points, spacing=thickness);
    
}
    
hollow_out(shell_thickness = border) square([x, y]);
};

};


plate(80, 300, 1, 0.1, 3, 3, 4);
plate(80, 300, 4, 0.1, 1, 2, 4);


//sample

//plate(60, 30, 1, 0.1, 3, 3, 4);
//plate(90, 45, 4, 0.1, 1, 2, 4);