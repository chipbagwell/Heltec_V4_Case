smoothness = 150;
module caseBottom(){

    hull(){
        color("green")sphere(r=4,$fn=smoothness);
        translate([0,65,0])color("green")sphere(r=4,$fn=smoothness);
        translate([117,0,0])color("green")sphere(r=4,$fn=smoothness);
        translate([117,65,0])color("green")sphere(r=4,$fn=smoothness);
        translate([0,0,0])rotate([0,90,0])cylinder(h=117,r=4,$fn=smoothness);
        translate([0,65,0])rotate([0,90,0])cylinder(h=117,r=4,$fn=smoothness);
        translate([0,0,0])rotate([-90,0,0])cylinder(h=65,r=4,$fn=smoothness);
        translate([117,0,0])rotate([-90,0,0])cylinder(h=65,r=4,$fn=smoothness);
    };
    {
        color("green")cylinder(h=10,r=4,$fn=smoothness);
        translate([0,65,0])color("green")cylinder(h=10,r=4,$fn=smoothness);
        translate([117,0,0])color("green")cylinder(h=10,r=4,$fn=smoothness);
        translate([117,65,0])color("green")cylinder(h=10,r=4,$fn=smoothness);
        translate([0,-4,0])rotate([0,0,0])cube([117,4,10]);
        translate([0,65,0])rotate([0,0,0])cube([117,4,10]);
        translate([-4,0,0])rotate([0,0,0])cube([4,65,10]);
        translate([117,0,0])rotate([0,0,0])cube([4,65,10]);
    }
};


difference(){
    caseBottom();
    color("red")cube([117,65,11]);
};
