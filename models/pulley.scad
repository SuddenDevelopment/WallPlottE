// max radius for pulley = 16
// 3mm balls, 3.5mm apart
$fn=50;
module pulley(){
difference(){
    union(){
        cylinder(r1=14,r2=13,h=2);
        cylinder(r=12.8,h=5);
    }
    
    cylinder(r=2,h=15);
    translate([-4,-4,2])cube([8,8,3]);
    for(i=[0,15,30,45,60,75,90,105,120,135,150,165,180,-15,-30,-45,-60,-75,-90,-105,-120,-135,-150,-165]){
        rotate([0,0,i])translate([13,0,2])cylinder(r=1.5,h=5);
    }
}
}

module cap(){
    cylinder(r1=14,r2=13,h=2);
    translate([-4,-4,2])cube([8,8,2.5]);
}

cap();