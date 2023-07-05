

$extrusion_width = 0.4;
$layer_height = 0.2;
$pp1_colour = "dimgrey";
$pp2_colour = [0.9, 0.9, 0.9];

include <NopSCADlib/core.scad>
include <NopSCADlib/vitamins/iecs.scad>
include <NopSCADlib/vitamins/mains_sockets.scad>
include <NopSCADlib/vitamins/tubings.scad>

use <NopSCADlib/vitamins/insert.scad>
use <NopSCADlib/vitamins/wire.scad>
use <NopSCADlib/vitamins/jack.scad>
use <NopSCADlib/printed/foot.scad>

include <./roundedcube.scad>
include <./threadedinsertpost.scad>
include <nutsnbolts/materials.scad>

box_external = [100, 250, 60];     // mm

box_wall_depth = 3;      // mm

unit_inch = 25.4;   // mm

transformer_mount_pitch = 2.812;  // In
transformer_height = 1.937;       // In

enclosure_screw = "M4";

render_lid = false;

iec = IEC_inlet_atx;
socket = Contactum;

foot = Foot(d = 20, h = 8, t = 3, r = 1, screw = M3_dome_screw);

module foot_stl() foot(foot);

socket_depth = 13;

screw = mains_socket_screw(socket);
screw_clearance_radius = screw_clearance_radius(screw);

insert = screw_insert(screw);
insert_hole_radius = insert_hole_radius(insert);
insert_length = insert_length(insert);
insert_boss = mains_socket_insert_boss(socket);
screw_length = screw_longer_than(mains_socket_height(socket) + insert_length(insert));


// An [x, y, z] vector specifies distance on each axis. Default [1, 1, 1]
size_outer = [box_external.x,
    box_external.y,
    box_external.z];
    
size_inner = [box_external.x - box_wall_depth * 2,
    box_external.y - box_wall_depth * 2,
    box_external.z - box_wall_depth];
    
size_lid = [box_external.x,
    box_external.y,
    box_wall_depth - 2.0];


iec_h = iec_body_h(iec) + 1;

box_height = box_external.z - box_wall_depth;
base_thickness = box_wall_depth;
height = base_thickness + box_height;

//iec_x = -mains_socket_width(socket) / 2;
//iec_y = 0;
//iec_z = box_wall_depth + iec_h / 2;

iec_x = 0;
iec_y = -box_external.y / 2;
iec_z = box_wall_depth * 4 + iec_h / 2;
//iec_z = box_wall_depth + iec_h / 2;

jack_pitch = 20;
jack_z = iec_z;

// An integer creates a cube with specified wall distance. Default [1, 1, 1]
//size = 5;

// Whether or not to place the object centered on the origin. Default false
center = true;

// Specify a rounding radius. Default 0.5
radius = 3.0;

// Specify where to apply the rounded corners. Default "all"
//apply_to = 
//"all"|"x"|"y"|"z"|"zmax"|"zmin"|"xmax"|"xmin"|"ymax"|"ymin"
apply_to = "z";

//screw_outer_diam = data_screw_fam[search([enclosure_screw],data_screw_fam)[0]][_NB_F_OUTER_DIA];
screw_outer_diam = 4;
postpitchx = box_external.x - box_wall_depth * 4 - screw_outer_diam;
postpitchy = box_external.y - box_wall_depth * 4 - screw_outer_diam;


module foot_positions() {
    inset = box_wall_depth + foot_diameter(foot) / 2;

    for(x = [-1, 1], y = [-1, 1])
        translate([x * postpitchx / 2, y * postpitchy / 2])
            children();
}

module jack_hole() {
    intersection() {
        teardrop_plus(r = jack_4mm_shielded_hole_radius(), h = 50);

        cube([11, 100, 100], center = true);
    }
}

module project_box_stl() {
    stl("project_box");

    union () {
        difference() {
            translate([0, 0, size_outer.z / 2]) roundedcube(size_outer, center, radius, apply_to);
            translate([0, 0, size_inner.z / 2 + box_wall_depth]) {
                roundedcube(size_inner, center, radius, apply_to);
            }
            //
            // IEC holes
            //
            difference() {
                translate([iec_x, iec_y, iec_z])
                    //rotate([90, 0, -90])
                    rotate([90, 0, 0])
                        iec_holes(iec);
    
                    linear_extrude(height = height, convexity = 5)
                         offset(-box_wall_depth) face_plate(socket);
            }
            //
            // Jack holes
            //
            for(x = [-1, 0, 1])
                translate([x * jack_pitch, size_outer.y / 2, jack_z])
                    rotate([90, 0, 0])
                        jack_hole();
    
            for(x = [-1, 1])
                translate([x * jack_pitch / 2, size_outer.y / 2, jack_z + jack_pitch])
                    rotate([90, 0, 0])
                        jack_hole();
            //
            // Feet holes
            //
            foot_positions()
                poly_cylinder(r = screw_clearance_radius(foot_screw(foot)), h = 100, center = true);
            
        }
    }
    
    //
    // Add threaded insert posts
    //
    
    for (xpos = [-1, 1], ypos = [-1, 1]) {
            
        threadedpost_x = xpos * postpitchx / 2;
        threadedpost_y = ypos * postpitchy / 2;
        translate([threadedpost_x, threadedpost_y, 0]) {
            union () {
                cube(10, true);
                threadedinsertpost(box_external.z, enclosure_screw, box_wall_depth, true);
            }
        }
    }

}


echo(size_lid);
if (render_lid) {

    translate([0,0,box_external.z + box_wall_depth * 4]) {
        roundedcube(size_lid, center, radius, apply_to);
        //cube(size_lid);
    }

}

module pcb_assembly()
assembly("pcb") {

}

module base_assembly()
assembly("base") {
    stl_colour(pp1_colour) render() /*clip(ymax = 0)*/ project_box_stl();

    mains_socket_hole_positions(socket)
        translate_z(height)
            insert(insert);
}

module feet_assembly()
assembly("feet") {
    base_assembly();

    foot_positions()
        foot_assembly(base_thickness, foot);
}

module mains_in_assembly() pose([ 35.40, 0.00, 144.20 ], [ -13.10, 0.00, 13.75 ])
assembly("mains_in") {
    feet_assembly();

    hidden() {
        wire("green & yellow", 30, 150, 0.25);
        wire("blue",  30, 150, 0.25);
        wire("brown", 30, 150, 0.25);
        wire("brown", 30, 150, 0.25);
        for(i = [1:3])
            tubing(HSHRNK32);
    }
    translate([iec_x, iec_y, iec_z])
        rotate([90, 0, 0])
            iec_assembly(iec, box_wall_depth);

}

module main_assembly()
assembly("main") {
    hidden() {
        wire("green & yellow", 30, 150, 0.25);
        wire("blue",  30, 150, 0.25);
        for(i = [1:5])
            hidden() tubing(HSHRNK32);

        for(i = [1:3])
            vitamin(": Ferrule for 1.5mm^2 wire");
    }
    echo(screw_length = screw_length);

    mains_in_assembly();

/*
    explode(50, true) {
        translate_z(height)
             mains_socket(socket);

        mains_socket_hole_positions(socket)
            translate_z(height + mains_socket_height(socket))
                screw(screw, screw_length);
    }
    */

    for(x = [-1, 0, 1])
        translate([x * jack_pitch, size_inner.y / 2 + box_wall_depth, jack_z])
            rotate([90, 0, 180])
                jack_4mm_shielded(["red", "blue", "red"][x + 1], box_wall_depth, ["red", "royalblue", "red"][x + 1]);

        for(x = [-1, 1])
            translate([x * jack_pitch / 2, size_inner.y / 2 + box_wall_depth, jack_z + jack_pitch])
                rotate([90, 0, 180])
                    jack_4mm_shielded("red", box_wall_depth);
}

echo($preview);
if($preview)
    main_assembly();
else
    project_box_stl();

