$fn=200;
module track(){
intersection(){
difference(){
    //primary puck
    cylinder(r=100,h=24,$fn=100);
    //center hole for tools
    translate([0,0,5])cylinder(r=92,h=24);
    cylinder(r=85,h=24);
    
    //4mm holes for mounting things
    for (i =[0,45,90,135,180,-45,-90,-135]){
        rotate([0,0,i]){
            translate([90,0,0])cylinder(r=2,h=25);
        }
    }
    for (i =[0,45,90,135,180,-45,-90,-135]){
        rotate([0,0,i]){
            translate([90,0,3])cylinder(r=7/2,h=10,$fn=6);
        }
    }
    //inside track
    translate([0,0,12])cylinder(r=97,h=10);
}
translate([0,0,0])cube([200,200,25]);
}
}

track();

