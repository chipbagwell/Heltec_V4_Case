smoothness = 150;
casebottomheight = 12;
casebottomwidth = 65;
casebottomlength = 117;


radiomodulelength = casebottomwidth+4;
radiowidth = 26;
pcbthickness = 1.8;
headerwidth = 2;
radiobottomgap = 6;
radiotopgap = 5;
radiomoduleheight = radiobottomgap+pcbthickness+radiotopgap;

module caseBottom(){
    difference(){
        hull(){
            sphere(r=4,$fn=smoothness);
            translate([0,casebottomwidth,0])sphere(r=4,$fn=smoothness);
            translate([casebottomlength,0,0])sphere(r=4,$fn=smoothness);
            translate([casebottomlength,casebottomwidth,0])sphere(r=4,$fn=smoothness);
            cylinder(h=casebottomheight+2,r=4,$fn=smoothness);
            translate([0,casebottomwidth,0])cylinder(h=casebottomheight+2,r=4,$fn=smoothness);
            translate([casebottomlength,0,0])cylinder(h=casebottomheight+2,r=4,$fn=smoothness);
            translate([casebottomlength,casebottomwidth,0])cylinder(h=casebottomheight+2,r=4,$fn=smoothness);
        };
        color("red")cube([casebottomlength,casebottomwidth,casebottomheight+radiomoduleheight+2]);
    };
};



module radioslide(){
    difference(){
        union(){
            translate([0,0,2])cube([2,6,radiobottomgap+pcbthickness+radiotopgap]);
            translate([0,radiowidth-2,2])cube([2,6,radiobottomgap+pcbthickness+radiotopgap]);
            translate([0,0,2])cube([1,radiowidth,radiobottomgap+pcbthickness+radiotopgap]);
            
            translate([2,0,2])cube([radiomodulelength, 2+headerwidth, radiobottomgap]);
            translate([2,radiowidth,2])cube([radiomodulelength, 2+headerwidth, radiobottomgap]);
            translate([2,0,2+radiobottomgap])cube([radiomodulelength, 2, pcbthickness]);
            translate([2,radiowidth+2,2+radiobottomgap])cube([radiomodulelength, 2, pcbthickness]);
            translate([2,0,2+radiobottomgap+pcbthickness])cube([radiomodulelength, 2+headerwidth, radiotopgap]);
            translate([2,radiowidth,2+radiobottomgap+pcbthickness])cube([radiomodulelength, 2+headerwidth, radiotopgap]);
            
            translate([0,0,2+radiobottomgap+pcbthickness+radiotopgap-1])cube([radiomodulelength, radiowidth+2+2, 1]);
            };
        union(){
            color("green")hull(){
                translate([0,10,2+radiobottomgap+pcbthickness+2])rotate([0,90,0])cylinder(r=2,h=1,$fn=smoothness);
                translate([0,20,2+radiobottomgap+pcbthickness+2])rotate([0,90,0])cylinder(r=2,h=1,$fn=smoothness);
            }
            color("red")translate([5.5,7,1+radiobottomgap+pcbthickness+radiotopgap])cylinder(r=2,h=1,$fn=smoothness);
            color("red")translate([5.5,radiowidth+2+2-7,1+radiobottomgap+pcbthickness+radiotopgap])cylinder(r=2,h=1,$fn=smoothness);
            color("red")translate([16.8,5.5,2+radiobottomgap+pcbthickness+radiotopgap-1])cube([radiomodulelength, radiowidth+2+2-11, 1]);        
        };
    };
}


//radioslide();

translate([26+4,-4,casebottomheight])rotate([0,0,90])radioslide();
//    
//};
caseBottom();
