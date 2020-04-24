$fn=36;
height=0.375*25.4;
outer=0.5*25.4;
inner=0.25*25.4;

difference() {
cylinder(height,outer,outer);

cylinder(height,inner,inner);

}