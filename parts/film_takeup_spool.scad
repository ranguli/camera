$fn=100;





module film_takeup_spool_bottom(wheel_height, wheel_radius, height, core_radius, film_slit_width, film_slit_height) {

    cylinder(h=wheel_height, r=wheel_radius);

    difference() {
        cylinder(h=height, r=core_radius);

        translate([-film_slit_width/2, -core_radius, 3])
        cube([film_slit_width, core_radius*2, film_slit_height]);

        //translate([0,0,height-(wheel_height*4)])
        //cylinder(r=core_radius/2, h=wheel_height*4);
    }
}

module film_takeup_spool_top(wheel_height, wheel_radius, height, core_radius, film_slit_width, film_slit_height) {

    cylinder(h=wheel_height, r=wheel_radius);
    cylinder(h=height, r=core_radius);
}



CORE_RADIUS = 5;
WHEEL_HEIGHT = 3;
WHEEL_RADIUS = 12;

film_takeup_spool_bottom(
    height=33,
    core_radius=CORE_RADIUS,
    film_slit_width=1,
    film_slit_height=20,
    wheel_height=WHEEL_HEIGHT,
    wheel_radius=WHEEL_RADIUS
);


translate([30,0,0])
film_takeup_spool_top(
    height=13,
    core_radius=CORE_RADIUS,
    film_slit_width=1,
    film_slit_height=20,
    wheel_height=WHEEL_HEIGHT,
    wheel_radius=WHEEL_RADIUS
);



