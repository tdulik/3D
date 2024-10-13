/** Really quick fix of broken ski pole basket, comments later 
*/

//generate points for the parabollic shape of the basket body
function parabola(w, h, t) = [
for (x = [0 : 1 : w]) [x, h*x*x/(w*w)],     
for (x = [w : -1 : 0]) [x, h*x*x/(w*w)-t]     
];

function parabolaPlna(w, h, t) = [
for (x = [0 : 1 : w]) [x, h*x*x/(w*w)-t],     
[w,h],
[0,h],
];
//generate points for the parabollic shape polygon of each rib
function p_rib_points(w, h) = [
for (x = [0 : 1 : w]) [x, h*x*x/(w*w)],     
[0,h]];

//parabolic basket body - it's a kind of magic :-)
translate([0,0,8]) rotate([180,0,0]) 
    rotate_extrude() translate([5,0,0]) polygon(parabola(23,8, 2));
//one parabolic rib:

//one rib with parabolic shape
module p_rib() { 
    rotate([-90,0,90]) 
    linear_extrude(height = 3.5, center=true) polygon(p_rib_points(20,8));
}
//two ribs in one line
module rib2x() {
translate([0,8,8]) p_rib();
translate([0,-8,8]) rotate([0,0,180]) p_rib();
}

$fn=100;
//all ribs
rib2x();
angl=20;
for (x = [angl: angl : 180-angl]) {
    rotate([0,0,x])rib2x();
}
//and the cylinder for fixing this on the ski pole
translate([0,0,4]) 
    difference() {
        cylinder(h=8, d=29, center=true);
        cylinder(h=15, d=10.5, center=true);    
    }
