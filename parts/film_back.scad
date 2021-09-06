module film_back(camera_body_dimensions, film_back_parameters, camera_format_parameters, screw_insert_parameters) {
    body_width = camera_body_dimensions[0];
    body_height = camera_body_dimensions[1];
    body_depth = camera_body_dimensions[2];
     
    format_width = camera_format_parameters[0];
    
    film_back_bezel = film_back_parameters[0];
    film_back_cutout_depth = film_back_parameters[1];
 
    
    difference() {
        union() {
            linear_extrude(film_back_cutout_depth)
                rounded_square(
                size = [body_width, body_height],
                corner_r = 3
            );
            translate([0,film_back_bezel,film_back_cutout_depth])
            cube([body_width, body_height-(film_back_bezel*2), film_back_cutout_depth]);
        } 
        translate([0,0,film_back_cutout_depth/2])
        film_back_brass_inserts(camera_body_dimensions, screw_insert_parameters, film_back_parameters);
    }
}

// Holes for brass screw inserts
module film_back_brass_inserts(camera_body_dimensions, screw_insert_parameters, film_back_parameters) {
    body_width = camera_body_dimensions[0];
    body_height = camera_body_dimensions[1];
    
    insert_diameter = screw_insert_parameters[0];
    screw_length = screw_insert_parameters[1];
    screw_insert_z = screw_insert_parameters[3];
    
    film_back_bezel = film_back_parameters[0];
    
    screw_position = (insert_diameter / 2) + film_back_bezel;
    
    screw_insert_coords = [
        [screw_position, screw_position, screw_insert_z],
        [body_width-screw_position, screw_position, screw_insert_z],
        [screw_position, body_height-screw_position, screw_insert_z],
        [body_width-screw_position, body_height-screw_position, screw_insert_z]
    ];

    for (i = [0:3]) {
        translate([screw_insert_coords[i][0], screw_insert_coords[i][1], 0])
        brass_insert(insert_diameter, screw_length);
    }
}