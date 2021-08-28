include <../lib/knurling.scad>
include <../lib/donut.scad>
include <../lib/knob.scad>
include <../constants.scad>
include <../lib/brass_insert.scad>

module takeup_spool_knob(knob_diameter, knob_height, disk_height, shaft_diameter, shaft_length, gear_width, gear_height) {

    difference() {
        knob(knob_diameter, knob_height, disk_height, shaft_diameter, shaft_length);

        translate([0,0, shaft_length+knob_height+disk_height-10])
        brass_insert(screw_type=M3_INSERT, length=10);
    }
}

takeup_spool_knob(
    KNOB_DIAMETER,
    KNOB_HEIGHT,
    KNOB_DISK_HEIGHT,
    KNOB_SHAFT_DIAMETER,
    KNOB_SHAFT_LENGTH,
    TAKEUP_SPOOL_KNOB_GEAR_WIDTH,
    TAKEUP_SPOOL_KNOB_GEAR_HEIGHT
);
