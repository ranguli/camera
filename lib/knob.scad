include <../lib/knurling.scad>
include <../lib/donut.scad>
include <../constants.scad>

module knob(knob_dimensions) {

    knob_shaft_diameter     = knob_dimensions[0];
    knob_shaft_length       = knob_dimensions[1];
    knob_disk_height        = knob_dimensions[2];
    knob_disk_diameter      = knob_dimensions[3];
    knob_diameter           = knob_dimensions[4];
    knob_height             = knob_dimensions[5];


    knurling_width = 1.5;
    knurling_height = 2;
    knurling_dp = 0.5;

    knurled_cyl(knob_height, knob_diameter, knurling_width, knurling_height, knurling_dp, 1, 1);

    // Smaller disk underneath the knob
    translate([0, 0, knob_height])
    cylinder(h=knob_disk_height, r=knob_disk_diameter/2);

    translate([0,0,knob_height+knob_disk_height])
    difference() {
        cylinder(h=knob_shaft_length, r=knob_shaft_diameter/2);
    }
}

knob(KNOB_DIMENSIONS);
