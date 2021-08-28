module slanted_triangular_prism(height, slant_offset) {

    hull() {
        isosceles_triangle(b=2.5, angle=55, height=0.01);

        translate([0,slant_offset,height])
        isosceles_triangle(b=2.5, angle=55, height=0.01);
    }
}

/*
Triangles.scad
 Author: Tim Koopman
 https://github.com/tkoopman/Delta-Diamond/blob/master/OpenSCAD/Triangles.scad
         angleCA
           /|\
        a / H \ c
         /  |  \
 angleAB ------- angleBC
            b
Standard Parameters
	center: true/false
		If true same as centerXYZ = [true, true, true]
	centerXYZ: Vector of 3 true/false values [CenterX, CenterY, CenterZ]
		center must be left undef
	height: The 3D height of the Triangle. Ignored if heights defined
	heights: Vector of 3 height values heights @ [angleAB, angleBC, angleCA]
		If CenterZ is true each height will be centered individually, this means
		the shape will be different depending on CenterZ. Most times you will want
		CenterZ to be true to get the shape most people want.
*/

/*
Triangle
	a: Length of side a
	b: Length of side b
	angle: angle at point angleAB
*/
module triangle(
			a, b, angle, height=1, heights=undef,
			center=undef, centerXYZ=[false,false,false])
{
	// Calculate Heights at each point
	heightAB = ((heights==undef) ? height : heights[0])/2;
	heightBC = ((heights==undef) ? height : heights[1])/2;
	heightCA = ((heights==undef) ? height : heights[2])/2;
	centerZ = (center || (center==undef && centerXYZ[2]))?0:max(heightAB,heightBC,heightCA);

	// Calculate Offsets for centering
	offsetX = (center || (center==undef && centerXYZ[0]))?((cos(angle)*a)+b)/3:0;
	offsetY = (center || (center==undef && centerXYZ[1]))?(sin(angle)*a)/3:0;

	pointAB1 = [-offsetX,-offsetY, centerZ-heightAB];
	pointAB2 = [-offsetX,-offsetY, centerZ+heightAB];
	pointBC1 = [b-offsetX,-offsetY, centerZ-heightBC];
	pointBC2 = [b-offsetX,-offsetY, centerZ+heightBC];
	pointCA1 = [(cos(angle)*a)-offsetX,(sin(angle)*a)-offsetY, centerZ-heightCA];
	pointCA2 = [(cos(angle)*a)-offsetX,(sin(angle)*a)-offsetY, centerZ+heightCA];

	polyhedron(
		points=[	pointAB1, pointBC1, pointCA1,
					pointAB2, pointBC2, pointCA2 ],
		faces=[
			[0, 1, 2],
			[3, 5, 4],
			[0, 3, 1],
			[1, 3, 4],
			[1, 4, 2],
			[2, 4, 5],
			[2, 5, 0],
			[0, 5, 3] ] );
}





/*
Isosceles Triangle
	Exactly 2 of the following paramaters must be defined.
	If all 3 defined H will be ignored.
	b: length of side b
	angle: angle at points angleAB & angleBC.
*/
module isosceles_triangle(
			b, angle, H=undef, height=1, heights=undef,
			center=undef, centerXYZ=[true, false, false])
{
	valid = 	(angle!=undef)?((angle < 90) && (b!=undef||H!=undef)) : (b!=undef&&H!=undef);
	ANGLE = (angle!=undef) ? angle : atan(H / (b/2));
	a = (b==undef)?(H/sin((180-(angle*2))/2)) :
		 (b / cos(ANGLE))/2;
	B = (b==undef)? (cos(angle)*a)*2:b;
	if (valid)
	{
		triangle(a=a, b=B, angle=ANGLE, height=height, heights=heights,
					center=center, centerXYZ=centerXYZ);
	} else {
		echo("Invalid isosceles_triangle. Must specify any 2 of b, angle and H, and if angle used angle must be less than 90");
	}
}
