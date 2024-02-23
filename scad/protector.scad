/************************************************************************

    protector.scad
    
    Lenovo Legion Go Stick Protector
    Copyright (C) 2024 Simon Inns
    
    This is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

module render_stick_mockup(toPrint)
{
    if (!toPrint) {
        move([0,0,1]) {
            cyl(h=4, d=7, center=false);

            move([0,0,4]) cyl(h=1, d1=14, d2=16, center=false);
            move([0,0,5]) cyl(h=1.5, d=16, center=false);
            move([0,0,6.5]) cyl(h=1, d1=16, d2=14, center=false);
        }

        move([0,0,0]) cyl(h=1, d1=20, d2=18, center=false);
    }
}

module protector()
{
    difference() {
        union() {
            move([0,0,4]) cyl(h=1, d1=16, d2=14, center=false);
            move([0,0,2]) cyl(h=2, d1=18, d2=16, center=false);
            move([0,0,1]) cyl(h=2, d2=17, d1=23, center=false);
            move([0,0,0]) cyl(h=1, d=23, center=false);

            // Handle
            move([9,0,4]) cuboid([20,10,2], chamfer=0.5);
            hull() {
                move([15,0,4]) cuboid([6,10,2], chamfer=0.5);
                move([17,0,4]) cuboid([3,16,2], chamfer=0.5);
                move([19,0,4]) cuboid([2,10,2], chamfer=0.5);
            }
        }

        // Gap
        difference() {
            move([-6,0,2]) cuboid([14,7,10]);
            move([-2,4.5,2]) cyl(h=12, d=3);
            move([-2,-4.5,2]) cyl(h=12, d=3);
        }

        // Hollow the centre
        move([0,0,-1]) cyl(h=8, d=7.25, center=false);
        move([0,0,-1]) cyl(h=4, d1=15, d2=14, center=false);
        move([0,0,2.99]) cyl(h=1, d1=14, d2=13, center=false);

        move([0,0,-.75]) cyl(h=2, d1=23, d2=19, center=false);
        cyl(h=4, d=16, chamfer=1);

        // Hole in handle
        move([15,0,4]) cyl(h=4,d=4);
        move([15,0,4+1]) cyl(h=1,d1=4, d2=5);
        move([15,0,4-1]) cyl(h=1,d2=4, d1=5);

        // Trim the front edge
        move([-12,2,0]) zrot(45) cuboid([5,5,5]);
        move([-12,-2,0]) zrot(45) cuboid([5,5,5]);
    }
}

module render_protector(toPrint)
{
    if (!toPrint) protector();
    else {
        move([0,0,5]) xrot(180) protector();
    }
}