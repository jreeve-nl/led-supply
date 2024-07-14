
include <nutsnbolts/data-access.scad>
include <nutsnbolts/cyl_head_bolt.scad>


module threadedinsertpost(h, isoscrew, t, center) {

    screw_outer_diam = data_screw_fam[search(["M5"],data_screw_fam)[0]][_NB_F_OUTER_DIA];
    difference() {
        cylinder(h=h, r=screw_outer_diam/2 + t, center=center);
        translate([0, 0, h+e]) hole_through(name=isoscrew, l=h+5, cld=0.1, h=10, hcld=0.4);
    }

}