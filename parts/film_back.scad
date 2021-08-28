


module back(width, height) {
    rotate([0,180,0]) translate([-width,-height-20,48])
    difference() {
        ////Plaque :
        union(){
            translate([width/2,-5+height,-50]) cube([16+(8/(24/format)),24,4],true);
            translate([width/2,-32+height,-50]) cube([width,height,4],true);
            translate([width/2,-32+height,-52.4]) cube([width-6.2,height-6.2,4],true);

        };


        ////Viseur :
        translate([width/2,-5+height,-55])
        cube([8/(24/format),8,20],true);

        translate([width/2,-5+height,-54])
        cube([6.2+(8/(24/format)),14.2,4],true);


        ////arrondis :
        difference() {
            translate([2,2,-55]) cube([4,4,20],true);
            translate([4,4,-65]) cylinder(h=20, r=4, $fs=0.5);
        }

        difference() {
            translate([width-2,2,-55]) cube([4,4,20],true);
            translate([width-4,4,-65]) cylinder(h=20, r=4, $fs=0.5);
        }

        difference() {
            translate([2,height-2,-55]) cube([4,4,20],true);
            translate([4,height-4,-65]) cylinder(h=20, r=4, $fs=0.5);
        }

        difference() {
            translate([width-2,height-2,-55]) cube([4,4,20],true);
            translate([width-4,height-4,-65]) cylinder(h=20, r=4, $fs=0.5);
        }
        ////arrondis viseur :
        difference() {
            translate([(width/2)+((16+(8/(24/format)))/2)-2,height+5,-55])
            cube([4,4,20],true);

            translate([(width/2)+((16+(8/(24/format)))/2)-4,height+3,-65])
            cylinder(h=20, r=4, $fs=0.5);
        }

        difference() {
            translate([(width/2)-((16+(8/(24/format)))/2)+2,height+5,-55])
            cube([4,4,20],true);

            translate([(width/2)-((16+(8/(24/format)))/2)+4,height+3,-65])
            cylinder(h=20, r=4, $fs=0.5);
        }

        ////percements :
        translate([4.1,4.1,-50-3.2]) cube([2,2,2.4],true);
        translate([6.1,4.1,-50-3.2]) cube([2,2,2.4],true);
        translate([4.1,6.1,-50-3.2]) cube([2,2,2.4],true);
        translate([5.1,5.1,-50-4.4]) cylinder(h=6.4, r=2, $fs=0.5);

        translate([width-4.1,4.1,-50-3.2]) cube([2,2,2.4],true);
        translate([width-6.1,4.1,-50-3.2]) cube([2,2,2.4],true);
        translate([width-4.1,6.1,-50-3.2]) cube([2,2,2.4],true);
        translate([width-5.1,5.1,-50-4.4]) cylinder(h=6.4, r=2, $fs=0.5);

        translate([4.1,height-4.1,-50-3.2]) cube([2,2,2.4],true);
        translate([6.1,height-4.1,-50-3.2]) cube([2,2,2.4],true);
        translate([4.1,height-6.1,-50-3.2]) cube([2,2,2.4],true);
        translate([5.1,height-5.1,-50-4.4]) cylinder(h=6.4, r=2, $fs=0.5);

        translate([width-4.1,height-4.1,-50-3.2]) cube([2,2,2.4],true);
        translate([width-6.1,height-4.1,-50-3.2]) cube([2,2,2.4],true);
        translate([width-4.1,height-6.1,-50-3.2]) cube([2,2,2.4],true);
        translate([width-5.1,height-5.1,-50-4.4]) cylinder(h=6.4, r=2, $fs=0.5);
    }
}
