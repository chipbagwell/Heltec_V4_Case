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

module casebottom(){
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

module casetop(){
    difference(){
        translate([4,4,4]){
            minkowski(){
                union(){
                    color("green")cube([radiomodulelength-4,radiowidth-4,radiomoduleheight-4]);  
                    color("blue")translate([radiomodulelength-17,radiowidth-4,-radiomoduleheight+1])cube([13,15,casebottomheight+radiomoduleheight-4.2]);
                    color("red")translate([0,-casebottomlength+radiowidth-4,-radiomoduleheight+1])cube([casebottomwidth,casebottomlength,casebottomheight]);
                };
                sphere(r=4,$fn=smoothness); 
            }
        }
        union(){
            // button holes
            color("red")translate([5.5,7,1+radiobottomgap+pcbthickness+radiotopgap])cylinder(r=2,h=5,$fn=smoothness);
            color("red")translate([5.5,radiowidth+2+2-7,1+radiobottomgap+pcbthickness+radiotopgap])cylinder(r=2,h=5,$fn=smoothness);
            // usb port
            color("green")hull(){
                translate([0,10,2+radiobottomgap+pcbthickness+2])rotate([0,90,0])cylinder(r=2,h=5,$fn=smoothness);
                translate([0,20,2+radiobottomgap+pcbthickness+2])rotate([0,90,0])cylinder(r=2,h=5,$fn=smoothness);
            }
            // screen hole
            color("red")translate([16.8,5.5,2+radiobottomgap+pcbthickness+radiotopgap-1])cube([33.5, radiowidth+2+2-11, 5]);
            // body hole
            color("red")translate([2,4,-2])cube([radiomodulelength,radiowidth-4,radiomoduleheight+5]);
            color("red")translate([1,6,4])cube([1,radiowidth-8,radiomoduleheight-2]);
            color("green")translate([radiomodulelength-15,radiowidth,-2])cube([17,17,radiomoduleheight+5]);
            color("red")translate([4,-casebottomlength+radiowidth,-radiomoduleheight+5])cube([casebottomwidth,casebottomlength,casebottomheight]);
            // pcb hole
            color("red")translate([2,2,radiobottomgap+2])cube([radiomodulelength-1,radiowidth,pcbthickness]);
            color("blue")translate([radiomodulelength-6.5,radiowidth+23,2])rotate([90,0,0])cylinder(h=10,r=3.5,$fn=smoothness);
        }
    }
};
//translate([0,50,0])radioslide();
casetop();

//color("blue"){
//    translate([radiomodulelength+2,radiowidth+4+17,6])sphere(r=4,$fn=smoothness);
//    translate([radiomodulelength+2,radiowidth+4+17,radiomoduleheight-2])sphere(r=4,$fn=smoothness);
//    translate([radiomodulelength+2-17,radiowidth+4+17,6])sphere(r=4,$fn=smoothness);
//    translate([radiomodulelength+2-17,radiowidth+4+17,radiomoduleheight-2])sphere(r=4,$fn=smoothness);
//    translate([radiomodulelength-19,radiowidth+2,2])cube([6,6,radiomoduleheight]);
//    
//    
//}
//translate([26+4,-4,casebottomheight])rotate([0,0,90])radioslide();
//radioslide();
//caseBottom();
