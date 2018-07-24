// Expo Marker model

expo_end_diameter = 18.5;
expo_end_radius = expo_end_diameter/2;
expo_tip_holder_diameter = 8.68;
expo_tip_holder_radius = expo_tip_holder_diameter/2;
expo_tip_holder_length = 16.54;
expo_start_diameter = 17;
expo_start_radius = expo_start_diameter /2;
expo_length = 88.5;
expo_transition_length = 8.38;
expo_body_length = 95.2;
expo_total_body_length = 111.5;
expo_chisel_length = 6.7;
expo_chisel_width = 3.9;
expo_chisel_start = 5.45;
expo_chisel_height = 6.27;
expo_spacing = expo_end_radius+4;

// 1. Markers need to turn to be positioned in the puck

//marker_colors = ["black", "red", "green", "blue", "gray"];


/*
for( i=[0:4] ) {
    rotate([0,0,360/5*i+360/5/2]) if( i<4 ) translate([expo_spacing,expo_spacing,10+marker_z[i]])expo_marker(marker_colors[i]);
}
*/


module expo_marker(color_name = "black") {
    translate([0,0,expo_total_body_length]) 
        rotate([0,180,0]) {
        color("white")union() {
            rotate_extrude( $fn = 200)
            polygon([[0,0],[expo_end_radius,0], [expo_start_radius,expo_length], [expo_tip_holder_radius, expo_body_length], [expo_tip_holder_radius, expo_total_body_length],[0, expo_total_body_length]]);
            translate([0,0,expo_length-.5])sphere(r=expo_start_radius, $fn=100);
        }
        translate([0,0,expo_total_body_length+expo_chisel_length/2])expo_chisel_tip(color_name);
        }
}

module expo_chisel_tip(color_name = "black") {
    color(color_name)
    difference() {
        cube([expo_chisel_height, expo_chisel_width, expo_chisel_length], center=true);
        translate([0,0,5])rotate([0,30,0])cube([expo_chisel_height+7, expo_chisel_width+.1, expo_chisel_length], center=true);
    }
}