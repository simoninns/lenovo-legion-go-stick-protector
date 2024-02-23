/************************************************************************

    main.scad
    
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

// Local includes
include <protector.scad>

// Rendering resolution
$fn=50;

/* [Rendering Parameters] */
for_printing = "Display"; // [Display, Printing]

/* [Printable Parts] */
display_protector = "Yes"; // [Yes, No]
display_stick_mockup = "Yes"; // [Yes, No]

module main()
{
    toPrint = (for_printing == "Printing") ? true:false;

    d_protector = (display_protector == "Yes") ? true:false;
    d_stick_mockup = (display_stick_mockup == "Yes") ? true:false;

    if (d_protector) render_protector(toPrint);
    if (d_stick_mockup) render_stick_mockup(toPrint);
}

main();