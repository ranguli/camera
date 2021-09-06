module takeup_spool_bottom(takeup_spool_parameters) {
    core_diameter = takeup_spool_parameters[0];
    bottom_height = takeup_spool_parameters[1];
    top_height = takeup_spool_parameters[2];
    wheel_diameter = takeup_spool_parameters[3];
    wheel_height = takeup_spool_parameters[4];
    film_slit_width = takeup_spool_parameters[5];
    film_slit_height = takeup_spool_parameters[6];
    
    cylinder(h=wheel_height, r=wheel_diameter/2);

    difference() {
        cylinder(h=bottom_height, r=wheel_diameter/2);

        translate([-film_slit_width/2, -wheel_diameter/2, 3])
        cube([film_slit_width, wheel_diameter, film_slit_height]);
    }
}


module takeup_spool_top(takeup_spool_parameters) {
    core_diameter = takeup_spool_parameters[0];
    bottom_height = takeup_spool_parameters[1];
    top_height = takeup_spool_parameters[2];
    wheel_diameter = takeup_spool_parameters[3];
    wheel_height = takeup_spool_parameters[4];
    film_slit_width = takeup_spool_parameters[5];
    film_slit_height = takeup_spool_parameters[6];
    
    
    cylinder(h=wheel_height, r=wheel_diameter/2);
    cylinder(h=top_height, r=core_diameter/2);
}