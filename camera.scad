include <parts/body.scad>;
include <parts/film_back.scad>;
include <parts/film_compartment_knob.scad>;
include <parts/takeup_spool_knob.scad>;
include <parts/takeup_spool.scad>;

// Render quality of the final model.
$fn=50;


// Choose between a visualization of the assembled camera, or a printable layout of all parts.
Layout = 0; // [0: Printable, 1: Assembled]

/* [Part Selector] */
// Print the camera body.
Print_Body = true;

// Print the knob for the film compartment.
Print_Film_Compartment_Knob = true;

// Print the takeup spool knob.
Print_Takeup_Spool_Knob = true;

// Print the takeup spool.
Print_Takeup_Spool = true;

// Print the film back;
Print_Film_Back = true;

// Use 3D-printed washers for extra protection against knobs popping out of their slots.
Use_Knob_Washers = false;


// *******************
// * Knob Parameters *
// *******************

/* [Knobs] */
// Defines the diameter of the knob shaft.
Knob_Shaft_Diameter = 9;

// Defines the length of the knob shaft.
Knob_Shaft_Length = 21;

// Defines the height of the small disk shape underneath the knob.
Knob_Disk_Height = 1;

// Defines the diameter of the small disk shape underneath the knob.
Knob_Disk_Diameter = 10;

// Defines the diameter of the film knobs.
Knob_Diameter = 17;

// How tall the knobs are.
Knob_Height = 9;

Knob_Dimensions = [
    Knob_Shaft_Diameter,
    Knob_Shaft_Length,
    Knob_Disk_Height,
    Knob_Disk_Diameter,
    Knob_Diameter,
    Knob_Height
];

/* [Hidden] */
Film_Compartment_Knob_Slit_Width = 1.75;
Film_Compartment_Knob_Slit_Height = 4;

// ************************
// * Film Back Parameters *
// ************************

/* [Film Back] */

Film_Back_Bezel = 2.5;
Film_Back_Cutout_Depth = 2.4;

Film_Back_Parameters = [
    Film_Back_Bezel,
    Film_Back_Cutout_Depth
];

// ************************************
// * Film Compartment Parameters *
// ************************************

/* [Film Compartment] */

// The diameter of the film compartment.
Film_Compartment_Width = 26;

Film_Compartment_Depth = Film_Compartment_Width + 10;

// The height of the film compartment.
Film_Compartment_Height = 44;

Film_Compartment_Dimensions = [
    Film_Compartment_Width,     // 0
    Film_Compartment_Depth,     // 1
    Film_Compartment_Height     // 2
];

Film_Compartment_Knob_Dimensions = [
    Film_Compartment_Knob_Slit_Width,       // 0
    Film_Compartment_Knob_Slit_Height,      // 1
];

// ****************************
// * Film Canister Dimensions *
// ****************************

/* [Hidden] */
Film_Canister_Nub_Depth = 12;
Film_Canister_Nub_Height = 4;

Film_Canister_Dimensions = [
    Film_Canister_Nub_Depth,    // 0
    Film_Canister_Nub_Height// 1
];


// ***************************************
// * Takeup Spool Compartment Dimensions *
// ***************************************

Takeup_Spool_Compartment_Width = Film_Compartment_Width;
Takeup_Spool_Compartment_Depth = Film_Compartment_Depth;
Takeup_Spool_Compartment_Height = Film_Compartment_Height;

Takeup_Spool_Compartment_Dimensions = [
    Takeup_Spool_Compartment_Width,     // 0
    Takeup_Spool_Compartment_Depth,     // 1
    Takeup_Spool_Compartment_Height     // 2
];


// ****************************
// * Camera Format Parameters *
// ****************************

/* [Format] */

Film_Format = 0; // [0:35mm, 1:6 x 4.5, 2:6 x 6]
Perforations = 0; // [5:exposed, 0:hidden]

/* [Hidden] */

Film_Format_Dimensions = [
    [36, 24] // 35mm
];

Format_Width = Film_Format_Dimensions[Film_Format][0];
Format_Height = Film_Format_Dimensions[Film_Format][1];

Camera_Format_Parameters = [
    Format_Width,
    Format_Height,
    Perforations,
    Film_Format
];


/* [Lens] */

Focal_Length = 30; // [24:200]

Lens_Opening = ((4*(55/2))/30);
Lens_Opening_Diameter = 1;

Camera_Lens_Parameters = [
    Lens_Opening,
    Lens_Opening_Diameter,
    Focal_Length
];


Takeup_Spool_Knob_Gear_Width = 3;
Takeup_Spool_Knob_Gear_Height = 6;


// *********************************
// * Brass Screw Insert Parameters *
// *********************************

// Which brass screw insert should be used.
Screw_Insert = 3.5; // [3.5:M2, 4.8:M3]

// The length of the screw insert.
Insert_Length = 4;

// The height of the screw head.
Screw_Head_Length = 2;


// **************************
// * Camera Body Dimensions *
// **************************

Camera_Body_Height = Film_Compartment_Height + Screw_Insert*2 + Film_Back_Bezel*2 + 1;
Camera_Body_Width = Format_Width + 72 + (2*Perforations);
Camera_Body_Depth = Focal_Length + 4.5;

Camera_Body_Dimensions = [
    Camera_Body_Width,
    Camera_Body_Height,
    Camera_Body_Depth
];


Takeup_Spool_X = Camera_Body_Width - Takeup_Spool_Compartment_Width;

Screw_Insert_Z = Camera_Body_Depth - Insert_Length - Film_Back_Cutout_Depth;

Screw_Insert_Parameters = [
    Screw_Insert,
    Insert_Length,
    Screw_Head_Length,
    Screw_Insert_Z
];


// ***************************
// * Takeup Spool Parameters *
// ***************************

// Diameter of the Takeup Spool core.
Takeup_Spool_Core_Diameter = 10;

// Height of the Takeup Spool core.
Takeup_Spool_Core_Height = 26;

// Diameter of the wheels on the top and bottom of the Takeup Spool.
Takeup_Spool_Wheel_Diameter = 24;

// Height of the wheels on the top and bottom of the Takeup Spool.
Takeup_Spool_Wheel_Height = 3;

Takeup_Spool_Film_Slit_Width = 1;
Takeup_Spool_Film_Height = 20;

Takeup_Spool_Parameters = [
    Takeup_Spool_Core_Diameter,
    Takeup_Spool_Core_Height,
    Takeup_Spool_Wheel_Diameter,
    Takeup_Spool_Wheel_Height,
    Takeup_Spool_Film_Slit_Width,
    Takeup_Spool_Film_Height
];


// Assembled
if (Layout == 1) {
    translate([0,Camera_Body_Depth,0])
    rotate([90,0,0])
    body(Camera_Body_Dimensions, Camera_Format_Parameters, Camera_Lens_Parameters, Film_Back_Parameters, Film_Compartment_Dimensions, Film_Canister_Dimensions, Takeup_Spool_Compartment_Dimensions, Screw_Insert_Parameters, Knob_Dimensions, Use_Knob_Washers);
    
} 
// Print Layout
else if (Layout == 0) {
    
    if (Print_Body) {
        body(Camera_Body_Dimensions, Camera_Format_Parameters, Camera_Lens_Parameters, Film_Back_Parameters, Film_Compartment_Dimensions, Film_Canister_Dimensions, Takeup_Spool_Compartment_Dimensions, Screw_Insert_Parameters, Knob_Dimensions, Use_Knob_Washers);
    }
    
    if (Print_Film_Compartment_Knob) {
        translate([Camera_Body_Width + Knob_Diameter, Knob_Diameter*4,0])
        film_compartment_knob(Knob_Dimensions, Film_Compartment_Knob_Dimensions);
    }
    
    if (Print_Takeup_Spool_Knob) {
        translate([Camera_Body_Width + Knob_Diameter, Knob_Diameter*2.5,0])
        takeup_spool_knob(Knob_Dimensions, Screw_Insert_Parameters);
    }

    if (Print_Takeup_Spool) {
        translate([Camera_Body_Width + Takeup_Spool_Wheel_Diameter, Takeup_Spool_Wheel_Diameter/2, 0])
        takeup_spool(Takeup_Spool_Parameters);
    }

    if (Print_Film_Back) {
        translate([0, Camera_Body_Height*1.05, 0])
        film_back(Camera_Body_Dimensions, Film_Back_Parameters, Camera_Format_Parameters, Screw_Insert_Parameters);
    }
}


