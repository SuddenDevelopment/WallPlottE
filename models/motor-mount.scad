$fn=50;

module servo(h1){
    translate([0,0,0])cylinder(r=2.5,h=h1);
    translate([0,11,0])cylinder(r=2.5,h=h1);
    translate([49,0,0])cylinder(r=2.5,h=h1);
    translate([49,11,0])cylinder(r=2.5,h=h1);
    translate([0,0,h1/2])cylinder(r=4,h=h1/2,$fn=6);
    translate([0,11,h1/2])cylinder(r=4,h=h1/2,$fn=6);
    translate([49,0,h1/2])cylinder(r=4,h=h1/2,$fn=6);
    translate([49,11,h1/2])cylinder(r=4,h=h1/2,$fn=6);
    translate([4,-4.5,0])cube([41,20,h1]);
}
module body(){
    hull(){
    translate([3,30,0]){
        translate([0,0,0])cylinder(r=5,h=5);
        translate([0,11,0])cylinder(r=5,h=5);
        translate([49,0,0])cylinder(r=5,h=5);
        translate([49,11,0])cylinder(r=5,h=5);
        translate([4,-8.5,0])cube([46,25,5]);
    }
    translate([12,8,0])cylinder(r=9,h=5);
    translate([55-12,8,0])cylinder(r=9,h=5);
}
}
mirror([1,0,0]){
difference(){
    //body
    body();
    //bearings
    translate([10,3,0])cylinder(r=4,h=5);
    translate([57-12,3,0])cylinder(r=4,h=5);
    translate([10,3,2.5])cylinder(r=7.5,h=5,$fn=6);
    translate([57-12,3,2.5])cylinder(r=7.5,h=5,$fn=6);
    //servo holes
    translate([3,30,0])servo(5);
    //translate([27.5,15.5,0])cylinder(r=9,h=5);
}
difference(){
    translate([17,34,5])cylinder(r=15,h=20);
    translate([17,34,5])cylinder(r=13.1,h=25);
    translate([0,25.5,0])cube([100,100,100]);
}
translate([16,12.5,0])cube([2,7.5,25]);
}