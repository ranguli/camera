include <../lib/dotSCAD/src/rounded_square.scad>;
include <../lib/brass_insert.scad>;

module body(camera_body_dimensions, camera_format_parameters, camera_lens_parameters, film_back_parameters, film_compartment_dimensions, film_canister_dimensions, takeup_spool_compartment_dimensions, screw_insert_parameters, knob_dimensions, use_knob_washers) {

    body_width = camera_body_dimensions[0];
    body_height = camera_body_dimensions[1];
    body_depth = camera_body_dimensions[2];

    lens_opening = camera_lens_parameters[0];
    lens_opening_diameter = camera_lens_parameters[1];
    focal_length = camera_lens_parameters[2];
    
    format = camera_format_parameters[0];
    perforations = camera_format_parameters[1];

    film_back_cutout_depth = film_back_parameters[1];

    difference() {
        body_blank(body_width, body_height, body_depth);
        film_compartment(camera_body_dimensions, film_compartment_dimensions, film_canister_dimensions, knob_dimensions, film_back_parameters);

        film_back_mating_surface(camera_body_dimensions, film_back_parameters);

        if (use_knob_washers == true) {
            knob_washers();
        }

        dark_chamber(camera_body_dimensions, camera_format_parameters, camera_lens_parameters);

        takeup_spool_compartment(camera_body_dimensions, film_compartment_dimensions, film_canister_dimensions, knob_dimensions, film_back_parameters);
        
        film_plane(camera_body_dimensions, camera_format_parameters, camera_lens_parameters, film_back_parameters);
        
        color("blue")
        brass_inserts(camera_body_dimensions, screw_insert_parameters, film_back_parameters);

    }
}

module body_blank(width, height, depth) {
    linear_extrude(depth)
        rounded_square(
        size = [width, height],
        corner_r = 3
    );
}

module film_plane(camera_body_dimensions, camera_format_parameters, camera_lens_parameters, film_back_parameters) {
     body_width = camera_body_dimensions[0];
     body_height = camera_body_dimensions[1];
     body_depth = camera_body_dimensions[2];

     focal_length = camera_lens_parameters[3];

     format_width = camera_format_parameters[0] * 1.5;
     format_height = camera_format_parameters[1] * 1.15;
     perforations = camera_format_parameters[2];


     film_back_cutout_depth = film_back_parameters[1];

     //translate([body_width/2,31,focal_length+2])
     //cube([10+format_width+2*perforations,34,4],true);

    translate([body_width/2-format_width/2,body_height/2-format_height/2,body_depth-film_back_cutout_depth-4])
    cube([format_width,format_height,4]);
}


module takeup_spool_compartment(camera_body_dimensions, takeup_spool_compartment_dimensions, film_canister_dimensions, knob_dimensions, film_back_parameters) {

    body_width = camera_body_dimensions[0];
    body_height = camera_body_dimensions[1];
    body_depth = camera_body_dimensions[2];

    knob_shaft_diameter     = knob_dimensions[0];
    knob_shaft_length       = knob_dimensions[1];
    knob_disk_height        = knob_dimensions[2];
    knob_disk_diameter      = knob_dimensions[3];
    knob_height             = knob_dimensions[5];

    film_canister_nub_depth = film_canister_dimensions[0];
    film_canister_nub_height = film_canister_dimensions[1];

    takeup_spool_compartment_width = takeup_spool_compartment_dimensions[0];
    takeup_spool_compartment_depth = takeup_spool_compartment_dimensions[1];
    takeup_spool_compartment_height = takeup_spool_compartment_dimensions[2];

    film_back_bezel = film_back_parameters[0];
    film_back_cutout_depth = film_back_parameters[1];

    translate([body_width-film_back_bezel-takeup_spool_compartment_width,film_back_bezel,body_depth-film_back_cutout_depth-takeup_spool_compartment_width]) {
            // Cutout for the film compartment knob.
            translate([takeup_spool_compartment_width/2,takeup_spool_compartment_height+knob_shaft_length/2,takeup_spool_compartment_width/2])
            color("red") {
                translate([0,-1,0])
                rotate([90,0,0])
                cylinder(h=knob_shaft_length, r=knob_shaft_diameter/2, $fs=0.5);

                // Knob disk
                rotate([90,0,0])
                cylinder(h=knob_disk_height, r=knob_disk_diameter/2, $fs=0.5);
            }



            // Where the film canister actually rests
            color("green") {
                hull() {
                    translate([0,film_canister_nub_height,takeup_spool_compartment_width/2])
                    cube([takeup_spool_compartment_width,takeup_spool_compartment_height,takeup_spool_compartment_width/2]);

                    translate([takeup_spool_compartment_width/2,takeup_spool_compartment_height+film_canister_nub_height,takeup_spool_compartment_width/2])
                    rotate([90,0,0])

                    cylinder(h=takeup_spool_compartment_height, r=takeup_spool_compartment_width/2, $fs=0.5);
                }
            }
    }
}

module dark_chamber(camera_body_dimensions, camera_format_parameters, camera_lens_parameters) {

    body_width = camera_body_dimensions[0];

    format_width = camera_format_parameters[0];
    format_height = camera_format_parameters[1];
    perforations = camera_format_parameters[2];

    lens_opening_diameter = camera_lens_parameters[0];
    focal_length = camera_lens_parameters[2];


    CubePoints = [
        [ -lens_opening_diameter/2,  -lens_opening_diameter/2,  0 ],  //0
        [ lens_opening_diameter/2,  -lens_opening_diameter/2,  0 ],  //1
        [ lens_opening_diameter/2,  lens_opening_diameter/2,  0 ],  //2
        [  -lens_opening_diameter/2,  lens_opening_diameter/2,  0 ],  //3
        [  -(format_width/2)-perforations,  -12-perforations,  focal_length-8 ],  //4
        [ (format_width/2)+perforations,  -12-perforations,  focal_length-8 ],  //5
        [ (format_width/2)+perforations,  12+perforations,  focal_length-8 ],  //6
        [ -(format_width/2)-perforations,  12+perforations,  focal_length-8 ]
    ]; //7

    CubeFaces = [
        [0,1,2,3],  // bottom
        [4,5,1,0],  // front
        [7,6,5,4],  // top
        [5,6,2,1],  // right
        [6,7,3,2],  // back
        [7,4,0,3]   // left
    ];

    translate([body_width/2,31,8])
    polyhedron(CubePoints,CubeFaces);

    // lens opening
    translate([body_width/2,+31,-2])
    cylinder(h=8+4, r=lens_opening_diameter/2, $fs=0.5);
}





// Holes for brass screw inserts
module brass_inserts(camera_body_dimensions, screw_insert_parameters, film_back_parameters) {
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
        translate([screw_insert_coords[i][0], screw_insert_coords[i][1], screw_insert_coords[i][2]])
        brass_insert(insert_diameter, screw_length);
    }
}


module film_compartment(camera_body_dimensions, film_compartment_dimensions, film_canister_dimensions, knob_dimensions, film_back_parameters) {

    body_width = camera_body_dimensions[0];
    body_height = camera_body_dimensions[1];
    body_depth = camera_body_dimensions[2];

    knob_shaft_diameter     = knob_dimensions[0];
    knob_shaft_length       = knob_dimensions[1];
    knob_disk_height        = knob_dimensions[2];
    knob_disk_diameter      = knob_dimensions[3];
    knob_height             = knob_dimensions[5];

    film_canister_nub_depth = film_canister_dimensions[0];
    film_canister_nub_height = film_canister_dimensions[1];

    film_compartment_width = film_compartment_dimensions[0];
    film_compartment_depth = film_compartment_dimensions[1];
    film_compartment_height = film_compartment_dimensions[2];

    film_back_bezel = film_back_parameters[0];
    film_back_cutout_depth = film_back_parameters[1];

    translate([film_back_bezel,film_back_bezel,body_depth-film_back_cutout_depth-film_compartment_width]) {
            // Cutout for the film compartment knob.
            translate([film_compartment_width/2,film_compartment_height+knob_shaft_length/2,film_compartment_width/2])
            color("red") {
                translate([0,-1,0])
                rotate([90,0,0])
                cylinder(h=knob_shaft_length, r=knob_shaft_diameter/2, $fs=0.5);

                // Knob disk
                rotate([90,0,0])
                cylinder(h=knob_disk_height, r=knob_disk_diameter/2, $fs=0.5);
            }


             // Where the film canister actually rests
            color("purple") {
                translate([film_compartment_width/2-film_canister_nub_depth/2,0,film_compartment_width/2])
                hull() {
                    translate([0,0,0])
                    cube([film_canister_nub_depth,film_canister_nub_height,film_compartment_width/2]);

                    translate([film_canister_nub_depth/2,film_canister_nub_height,0])
                    rotate([90,0,0])
                    cylinder(h=film_canister_nub_height, r=film_canister_nub_depth/2, $fs=0.5);
                }
            }

            // Where the film canister actually rests
            color("green") {
                hull() {
                    translate([0,film_canister_nub_height,film_compartment_width/2])
                    cube([film_compartment_width,film_compartment_height,film_compartment_width/2]);

                    translate([film_compartment_width/2,film_compartment_height+film_canister_nub_height,film_compartment_width/2])
                    rotate([90,0,0])

                    cylinder(h=film_compartment_height, r=film_compartment_width/2, $fs=0.5);
                }
            }
    }
}



module film_back_mating_surface(camera_body_dimensions, film_back_parameters) {
    body_width = camera_body_dimensions[0];
    body_height = camera_body_dimensions[1];
    body_depth = camera_body_dimensions[2];

    film_back_bezel = film_back_parameters[0];
    film_back_cutout_depth = film_back_parameters[1];

     // Cutout for the film back

    echo(film_back_cutout_depth);
    echo(film_back_parameters[1]);

    translate([film_back_bezel,film_back_bezel,body_depth-film_back_cutout_depth])
    cube([body_width-5,body_height-5,film_back_cutout_depth],false);
}


module knob_washers() {
    // Takeup spool side
    translate([TAKEUP_SPOOL_X,CAMERA_BODY_HEIGHT,CAMERA_BODY_DEPTH-FILM_BACK_CUTOUT_DEPTH])
    translate([0,-5.35,-13])
    cube([18,1.3,26],true);

    // Film compartment side
    translate([18,CAMERA_BODY_HEIGHT,CAMERA_BODY_DEPTH-FILM_BACK_CUTOUT_DEPTH])
    translate([0,-5.35,-13])
    cube([18,1.3,26],true);
}

module case_internals(use_washers) {

    // Rounding on the cutout for the film back
    difference(){
        translate([3.25,3.25,CAMERA_BODY_DEPTH])
        cube([1.5,1.5,CAMERA_BODY_DEPTH+5],true);

        translate([4,4,CAMERA_BODY_DEPTH/2])
        cylinder(h=CAMERA_BODY_DEPTH, r=1.5, $fs=0.5);
    }

    difference(){
        translate([CAMERA_BODY_WIDTH-3.25,3.25,CAMERA_BODY_DEPTH])
        cube([1.5,1.5,CAMERA_BODY_DEPTH+5],true);

        translate([CAMERA_BODY_WIDTH-4,4,CAMERA_BODY_DEPTH/2])
        cylinder(h=CAMERA_BODY_DEPTH+10, r=1.5, $fs=0.5);
    }

    difference(){
        translate([3.25,CAMERA_BODY_HEIGHT-3.25,CAMERA_BODY_DEPTH])
        cube([1.5,1.5,CAMERA_BODY_DEPTH+5],true);

        translate([4,CAMERA_BODY_HEIGHT-4,CAMERA_BODY_DEPTH/2])
        cylinder(h=CAMERA_BODY_DEPTH+10, r=1.5, $fs=0.5);
    }

    difference(){
        translate([CAMERA_BODY_WIDTH-3.25,CAMERA_BODY_HEIGHT-3.25,CAMERA_BODY_DEPTH])
        cube([1.5,1.5,CAMERA_BODY_DEPTH+5],true);

        translate([CAMERA_BODY_WIDTH-4,CAMERA_BODY_HEIGHT-4,CAMERA_BODY_DEPTH/2])
        cylinder(h=CAMERA_BODY_DEPTH+10, r=1.5, $fs=0.5);
    }
}
