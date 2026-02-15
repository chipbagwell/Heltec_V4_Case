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


radiomodulelength = 40;
radiowidth = 26;
pcbthickness = 1.8;
headerwidth = 2;
radiobottomgap = 6;
radiotopgap = 5;

module radioslide(){
    cube([radiomodulelength +2+2, radiowidth+2+2, 2]);
    cube([2,6, 2+radiobottomgap+pcbthickness+radiotopgap]);
    translate([0,radiowidth-2,0])cube([2,6, 2+radiobottomgap+pcbthickness+radiotopgap]);
    cube([1,radiowidth, 2+radiobottomgap+pcbthickness+radiotopgap]);
    
    translate([2,0,2])cube([radiomodulelength, 2+headerwidth, radiobottomgap]);
    translate([2,radiowidth,2])cube([radiomodulelength, 2+headerwidth, radiobottomgap]);
    translate([2,0,2+radiobottomgap])cube([radiomodulelength, 2, pcbthickness]);
    translate([2,radiowidth+2,2+radiobottomgap])cube([radiomodulelength, 2, pcbthickness]);
    translate([2,0,2+radiobottomgap+pcbthickness])cube([radiomodulelength, 2+headerwidth, radiotopgap]);
    translate([2,radiowidth,2+radiobottomgap+pcbthickness])cube([radiomodulelength, 2+headerwidth, radiotopgap]);
    
    translate([0,0,2+radiobottomgap+pcbthickness+radiotopgap-1])cube([radiomodulelength, radiowidth+2+2, 1]);
    
}


//radioslide();
difference(){
    radioslide();
    hull(){
        translate([0,10,2+radiobottomgap+pcbthickness+2])rotate([0,90,0])cylinder(r=2,h=1,$fn=smoothness);
        translate([0,20,2+radiobottomgap+pcbthickness+2])rotate([0,90,0])cylinder(r=2,h=1,$fn=smoothness);
    }
    translate([5,6.5,1+radiobottomgap+pcbthickness+radiotopgap])color("red")cylinder(r=2,h=1,$fn=smoothness);
    translate([5,radiowidth+2+2-6.5,1+radiobottomgap+pcbthickness+radiotopgap])color("red")cylinder(r=2,h=1,$fn=smoothness);
    translate([16.8,6,2+radiobottomgap+pcbthickness+radiotopgap-1])cube([radiomodulelength, radiowidth+2+2-12, 1]);
    
    
};
