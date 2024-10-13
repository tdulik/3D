$fn=100;
hole_dia=10.5;
function parabola(w, h, t) = 
    [ for (x = [0 : 1 : w]) [x, h*x*x/(w*w)-t], [w,h], [0,h] ];
translate([0,0,8]) rotate([180,0,0])
    rotate_extrude()
        translate([hole_dia/2,0,0]) polygon(parabola(23,8, 2));
