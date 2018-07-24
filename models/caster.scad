//for https://www.amazon.com/gp/product/B07BM1XRZQ
$fn=50;
difference(){
    union(){
    cylinder(r=8,h=7.5);
    translate([10,0,0])cylinder(r=6,h=2.5);
    }
    cylinder(r=12.7/2,h=7.5);
    translate([12,0,0])cylinder(r=1.75,h=3);
}