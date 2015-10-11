include <../conf/config.scad>;
include <../conf/vitamins.scad>;
include <fans.scad>

e3d_hot_end(E3D_V6_1_75);

module e3d_hot_end(type) {
    translate([0, 0, hot_end_inset(type)]) e3d_v6();
}

module e3d_v6_fan_duct(with_fan=true) {
    translate([0, 0, -16.6])
    rotate([-90, 0, 180])
    import("../../imported_stls/e3d_v6_fan_duct.stl");
    
    if(with_fan) {
        color("gray")
        translate([20, 0, -31.6])
        rotate([90, 0, -90])
        e3d_v6_fan();
    }
}
module e3d_v6_fan() {
    fan(fan30x10);
}

module e3d_v6(with_fan_duct=true, with_fan=true) {
    translate([0, 0, 1.1]) import("../../imported_stls/E3D_v6_1.75mm_Universal.stl");
    if (with_fan_duct) {
        e3d_v6_fan_duct(with_fan);
    }
}