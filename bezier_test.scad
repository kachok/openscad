include <BOSL-1.0.1/constants.scad>
use <BOSL-1.0.1/beziers.scad>

height=40;
length=100;

wall=3;

path=[[0,0],
[length/2,0],
[length/2,height],
[length,height]];

path2=[[0,0+wall],
[length/2,0+wall],
[length/2,height+wall],
[length,height+wall]];

$fn=48;

function reverse(list) = [for (i = [len(list)-1:-1:0]) list[i]];

a=bezier_polyline(path,48);
b=reverse(bezier_polyline(path2,48));

c=concat(a,b);

echo(c);

linear_extrude(40) {
    polygon(points=c);
}
