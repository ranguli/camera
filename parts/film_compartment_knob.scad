include <../lib/knurling.scad>
include <../lib/donut.scad>
include <../lib/knob.scad>

module film_compartment_knob(knob_dimensions, film_compartment_knob_dimensions) {

    shaft_diameter     = knob_dimensions[0];
    knob_shaft_length       = knob_dimensions[1];
    knob_disk_height        = knob_dimensions[2];
    knob_height             = knob_dimensions[5];

    slit_width = film_compartment_knob_dimensions[0];
    slit_height = film_compartment_knob_dimensions[1];


    difference() {
        knob(knob_dimensions);

        translate([-slit_width/2,-(shaft_diameter/2),knob_height+knob_shaft_length-slit_height+knob_disk_height]) {
            cube([slit_width,shaft_diameter, slit_height]);
        }

    }
}