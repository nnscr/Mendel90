//
// Mendel90
//
// GNU GPL v2
// nop.head@gmail.com
// hydraraptor.blogspot.com
//
include <conf/config.scad>

function pcb_spacer_height() = part_base_thickness - pcb_thickness;

pcb_screw_length = frame_screw_length;

module pcb_controller_spacer(controller, screw = M3_cap_screw, thickness=pcb_spacer_height(), expand=4) {
    if (controller == Arduino2560) {
        thb = thickness / 3;
        ths = thickness / 3 * 2;
        difference() {
            union() {
                // base plate
                translate([-expand, -expand, 0])
                    cube([controller_width(controller)+expand*2, controller_length(controller)+expand*2, thb]);
                
                // spacers
                translate([0, 0, thb]) controller_screw_positions(controller)
                        cylinder(r=screw_radius(screw)*2, h=ths, center=true);
            }
            
            // holes
            translate([0, 0, 1])
                controller_screw_positions(controller)
                    cylinder(r=screw_radius(screw), h=thickness*2+2, center=true);
        }
    } else {
        controller_screw_positions(controller)
            pcb_spacer_assembly(raspberry_pi ? 2 : 1, raspberry_pi ? $i >= 2 : true);
    }
}

module pcb_spacer_stl(screw = M3_cap_screw, h = pcb_spacer_height()) {
    stl("pcb_spacer");

    r = screw_clearance_radius(screw);

    difference() {
        cylinder(r = corrected_radius(r) + 2, h = h,  center = false);
        translate([0, 0, -0.5])
            poly_cylinder(r = r, h = h + 1, center = false);
    }
}

module pcb_spacer_assembly(spacers, spacer) {
    if(spacers && spacer)
        color(pcb_spacer_color) render() pcb_spacer_stl();

    if(spacers > 1  && spacer)
        color("red")
            translate([0, 0, pcb_spacer_height()])
                render() pcb_spacer_stl();

    translate([0, 0, spacers * pcb_spacer_height() + pcb_thickness])
        screw_and_washer(M3_cap_screw, pcb_screw_length, !frame_nuts);

    if(frame_nuts)
        translate([0, 0, -sheet_thickness(frame)])
            rotate([180, 0, 0])
                nut_and_washer(screw_nut(M3_cap_screw), true);
}

if(0)
    pcb_spacer_stl();
else
    //pcb_spacer_assembly();
    pcb_controller_spacer(Arduino2560);
