module takeup_spool(takeup_spool_parameters) {
    core_diameter    = takeup_spool_parameters[0];
    core_height      = takeup_spool_parameters[1];
    wheel_diameter   = takeup_spool_parameters[2];
    wheel_height     = takeup_spool_parameters[3];
    film_slit_width  = takeup_spool_parameters[4];
    film_slit_height = takeup_spool_parameters[5];
    
    cylinder(h=wheel_height, r=wheel_diameter/2);
            
    difference() {
        translate([0, 0, wheel_height])
        cylinder(h=core_height, r=core_diameter/2);

        color("red") {
            translate([0, -core_diameter/2, wheel_height])
            cube([film_slit_width, wheel_diameter/2, 20]);
        }
    }
    
    translate([0,0,core_height+wheel_height]) {   
        cylinder(h=wheel_height, r=wheel_diameter/2);
    }
}