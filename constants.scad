$fn = 100;

// *******************
// * Knob Parameters *
// *******************

KNOB_SHAFT_DIAMETER = 9;
KNOB_SHAFT_LENGTH = 27;

KNOB_DISK_HEIGHT = 1;
KNOB_DISK_DIAMETER = 10;

KNOB_DIAMETER = 17;
KNOB_HEIGHT = 9;

KNOB_DIMENSIONS = [
    KNOB_SHAFT_DIAMETER,    // 0
    KNOB_SHAFT_LENGTH,      // 1
    KNOB_DISK_HEIGHT,       // 2
    KNOB_DISK_DIAMETER,     // 3
    KNOB_DIAMETER,          // 4
    KNOB_HEIGHT             // 5
];


// ************************
// * Film Back Parameters *
// ************************

FILM_BACK_BEZEL = 2.5;
FILM_BACK_CUTOUT_DEPTH = 2.4;

FILM_BACK_PARAMETERS = [
    FILM_BACK_BEZEL,
    FILM_BACK_CUTOUT_DEPTH
];

// ************************************
// * Film Compartment Knob Parameters *
// ************************************

FILM_COMPARTMENT_KNOB_SLIT_WIDTH = 1.75;
FILM_COMPARTMENT_KNOB_SLIT_HEIGHT = 4;


FILM_COMPARTMENT_KNOB_DIMENSIONS = [
    FILM_COMPARTMENT_KNOB_SLIT_WIDTH,       // 0
    FILM_COMPARTMENT_KNOB_SLIT_HEIGHT,      // 1

];


// *******************************
// * Film Compartment Parameters *
// *******************************

FILM_COMPARTMENT_WIDTH = 26;
FILM_COMPARTMENT_DEPTH = FILM_COMPARTMENT_WIDTH + 10;
FILM_COMPARTMENT_HEIGHT = 44;

FILM_COMPARTMENT_DIMENSIONS = [
    FILM_COMPARTMENT_WIDTH,     // 0
    FILM_COMPARTMENT_DEPTH,     // 1
    FILM_COMPARTMENT_HEIGHT     // 2
];


// ****************************
// * Film Canister Dimensions *
// ****************************

FILM_CANISTER_NUB_DEPTH = 12;
FILM_CANISTER_NUB_HEIGHT = 4;

FILM_CANISTER_DIMENSIONS = [
    FILM_CANISTER_NUB_DEPTH,    // 0
    FILM_CANISTER_NUB_HEIGHT    // 1
];


M3_INSERT = 4.8;

// ***************************************
// * Takeup Spool Compartment Dimensions *
// ***************************************

TAKEUP_SPOOL_COMPARTMENT_WIDTH = FILM_COMPARTMENT_WIDTH;
TAKEUP_SPOOL_COMPARTMENT_DEPTH = FILM_COMPARTMENT_DEPTH;
TAKEUP_SPOOL_COMPARTMENT_HEIGHT = FILM_COMPARTMENT_HEIGHT;

TAKEUP_SPOOL_COMPARTMENT_DIMENSIONS = [
    TAKEUP_SPOOL_COMPARTMENT_WIDTH,     // 0
    TAKEUP_SPOOL_COMPARTMENT_DEPTH,     // 1
    TAKEUP_SPOOL_COMPARTMENT_HEIGHT     // 2
];


// ****************************
// * Camera Format Parameters *
// ****************************

FORMAT = 36; // [24:Square,36:Standard,43:Cinema,55:Panoramic]
PERFORATIONS = 0; // [5:exposed, 0:hidden]
FOCAL_LENGTH = 30; // [30:60]

CAMERA_FORMAT_PARAMETERS = [
    FORMAT,
    PERFORATIONS,
    FOCAL_LENGTH
];


// **************************
// * Camera Body Parameters *
// **************************

CAMERA_BODY_WIDTH = FORMAT + 72 + (2*PERFORATIONS);
CAMERA_BODY_HEIGHT = 63;
CAMERA_BODY_DEPTH = FOCAL_LENGTH + 4.5;


CAMERA_BODY_DIMENSIONS = [
    CAMERA_BODY_WIDTH,
    CAMERA_BODY_HEIGHT,
    CAMERA_BODY_DEPTH
];


// **************************
// * Camera Lens Parameters *
// **************************

/* [Hidden] */
height = 1; // [1:50]

////Diamètre du cylindre de la chambre noire :
LENS_OPENING = ((4*(55/2))/30);
LENS_OPENING_DIAMETER = 1;

SHUTTER_RADIUS  = ((5.2*(55/2))/30);

CAMERA_LENS_PARAMETERS = [
    LENS_OPENING,
    LENS_OPENING_DIAMETER,
    SHUTTER_RADIUS
];



SCREW_INSERT_DEPTH = 3;


SCREW_INSERT_Z = CAMERA_BODY_DEPTH - SCREW_INSERT_DEPTH - FILM_BACK_CUTOUT_DEPTH;

TAKEUP_SPOOL_X = CAMERA_BODY_WIDTH - TAKEUP_SPOOL_COMPARTMENT_WIDTH;


TAKEUP_SPOOL_KNOB_GEAR_WIDTH = 3;
TAKEUP_SPOOL_KNOB_GEAR_HEIGHT = 6;

USE_KNOB_WASHERS = false;


