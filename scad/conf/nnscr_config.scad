//
// Mendel90
//
// GNU GPL v2
// nop.head@gmail.com
// hydraraptor.blogspot.com
//
// Configuration file
//
echo("nnscr Mendel90:");

Z_bearings = LM10UU; // besser 10?
Y_bearings = LM8UU;
X_bearings = LM8UU;

exploded = 0;

X_motor = NEMA17;
Y_motor = NEMA17;
Z_motor = NEMA17;

//hot_end = JHeadMk5;
hot_end = E3D_V6_1_75;
//nozzle_length = hot_end_total_length(hot_end);

X_travel = 200;
Y_travel = 200;
Z_travel = 200;

bed_depth = 214;
bed_width = 214;
bed_pillars = M3x20_pillar;
bed_glass = glass2;
bed_thickness = pcb_thickness + sheet_thickness(bed_glass);    // PCB heater plus glass sheet
bed_holes = [209, 209];

base = DiBond;               // Sheet material used for the base. Needs to be thick enough to screw into.
base_corners = 25;
base_nuts = true;

frame = DiBond;
frame_corners = 25;
frame_nuts = true;
include_fan = true;

logo = true;
logo_text = "nnscr";
logo_size = 35;
logo_font = "Andale Mono:style=Standard";

case_fan = fan80x38;
//psu = KY240W;
//psu = ALPINE500;
psu = ATX500;
//controller = Sanguinololu;
//controller = Melzi;
controller = Arduino2560;
raspberry_pi = false;

spool = spool_300x85;
bottom_limit_switch = true;
top_limit_switch = true;

single_piece_frame = true;
stays_from_window = false;
cnc_sheets = true;

Y_carriage = DiBond;

pulley_type = T2p5x16_metal_pulley;
X_belt = T2p5x6;
Y_belt = T2p5x6;

motor_shaft = 5;
Z_screw_dia = 8;            // Studding for Z axis (6 bei der dibond version?)

Y_carriage_depth = bed_holes[1] + 8; // + 7 bei der dibond version
Y_carriage_width = bed_holes[0] + 8; // + 7 bei der dibond version

Z_nut_radius = M8_nut_radius; // alle 3 M6 bei der original dibond version?
Z_nut_depth = M8_nut_depth;
Z_nut = M8_nut;

//
// Default screw use where size doesn't matter
//
cap_screw = M3_cap_screw;
hex_screw = M3_hex_screw;
//
// Screw for the frame and base
//
frame_soft_screw = No6_screw;               // Used when sheet material is soft, e.g. wood
frame_thin_screw = M4_cap_screw;            // Used with nuts when sheets are thin
frame_thick_screw = M4_pan_screw;           // Used with tapped holes when sheets are thick and hard, e.g. plastic or metal
//
// Feature sizes
//
default_wall = 3;
thick_wall = 4;
