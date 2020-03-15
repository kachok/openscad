use <dotSCAD-2.2/src/voronoi2d.scad>;
use <dotSCAD-2.2/src/hollow_out.scad>;

xs = rands(0, 80, 120);
ys = rands(0, 20, 120);

points = [for(i = [0:len(xs) - 1]) [xs[i], ys[i]]];

linear_extrude(1){
difference() {
    square([80, 20]);
    voronoi2d(points);
}
hollow_out(shell_thickness = 1) square([80, 20]);
};