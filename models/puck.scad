$fn=20;
difference(){
    //primary puck
    cylinder(r=100,h=5,$fn=100);
    //center hole for tools
    cylinder(r=38,h=5);
    //4mm holes for mounting things
    for (i =[0,45,90,135,180,-45,-90,-135]){
        rotate([0,0,i]){
            translate([50,0,0])cylinder(r=2,h=5);
            translate([90,0,0])cylinder(r=2,h=5);
        }
    }
}