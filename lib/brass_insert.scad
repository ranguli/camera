include <../constants.scad>;

module brass_insert(screw_type, length) {
    cylinder(r=screw_type/2, h=length);
}