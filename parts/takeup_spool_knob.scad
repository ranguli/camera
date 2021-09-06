include <../lib/knurling.scad>
include <../lib/donut.scad>
include <../lib/knob.scad>
include <../constants.scad>
include <../lib/brass_insert.scad>

module takeup_spool_knob(knob_dimensions, screw_insert_parameters) {
    shaft_length = knob_dimensions[1];
    disk_height = knob_dimensions[2];
    knob_height = knob_dimensions[5];
    
    screw_insert = screw_insert_parameters[0];
   
    difference() {
        knob(knob_dimensions);

        translate([0,0, shaft_length+knob_height+disk_height-10])
        brass_insert(screw_type=screw_insert, length=10);
    }
}