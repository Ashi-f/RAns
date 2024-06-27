// Set the factory to OpenCASCADE
SetFactory("OpenCASCADE");

// Define points
Point(1) = {0, 0, 0, .01};
Point(2) = {.3535533906, .3535533906, 0, .01};
Point(3) = {.3535533906, -.3535533906, 0, .01};
Point(4) = {-.3535533906, -.3535533906, 0, .01};
Point(5) = {-.3535533906, .3535533906, 0, .01};
Point(6) = {-.5, .5, 0, .01};
Point(7) = {-.7, .7, 0, .01};
Point(8) = {-.7, -.7, 0, .01};
Point(9) = {.7, -.7, 0, .01};
Point(10) = {.7, .7, 0, .01};

// Delete point 6
Recursive Delete { Point{6}; }

// Define circles
Circle(1) = {5, 1, 4};
Circle(2) = {5, 1, 2};
Circle(3) = {4, 1, 3};
Circle(4) = {3, 1, 2};
Circle(5) = {8, 1, 7};
Circle(6) = {7, 1, 10};
Circle(7) = {10, 1, 9};
Circle(8) = {8, 1, 9};

// Define lines
Line(9) = {5, 7};
Line(10) = {4, 8};
Line(11) = {3, 9};
Line(12) = {2, 10};

// Define additional points
Point(11) = {10.5, 1.5, -0, .1};
Point(12) = {10.5, -1.5, -0, .1};
Point(13) = {10.5, 5.5, 0, .2};
Point(14) = {10.5, -5.5, 0, .2};
Point(19) = {-5.5, -5.5, 0, .2};
Point(20) = {-5.5, 5.5, 0, .2};

//Right Line
Line(16) = {12, 14};
Line(17) = {13, 11};
Line(18) = {11, 12};

//inner right line 
Line(19) = {10, 11};
Line(20) = {9, 12};

//top line
Line(29) = {20, 13};

//bottom line
Line(32) = {14, 19};

//Left_line
Line(35) = {19, 20};

// Delete curve 7
Recursive Delete { Curve{7};}

// Define curve loops and surfaces
Curve Loop(1) = {16, 32, 35, 29, 17, -19, -6, -5, 8, 20};
Plane Surface(1) = {1};
Curve Loop(2) = {12, -6, -9, 2};
Plane Surface(2) = {2};
Curve Loop(3) = {9, -5, -10, -1};
Plane Surface(3) = {3};
Curve Loop(4) = {3, 11, -8, -10};
Plane Surface(4) = {4};
Curve Loop(5) = {18, -20, -11, 4, 12, 19};
Plane Surface(5) = {5};

// Define transfinite curves and surfaces
Transfinite Curve {1, 5} = 81 Using Progression 1.05;
Transfinite Curve {2, 3, 8, 6} = 81 Using Progression 1.05;
Transfinite Curve {10, 9} = 41 Using Progression 1;
Transfinite Curve {11,12} = 41 Using Progression 1;
Transfinite Surface {2};
Transfinite Surface {3};
Transfinite Surface {4};


// Recombine surfaces
Recombine Surface {2, 3, 4};

// Set characteristic lengths
Characteristic Length {2, 3} = 0.02;
Characteristic Length {4, 5} = 0.02;
Characteristic Length {10, 9} = 0.02;
Characteristic Length {8, 7} = 0.03;
Characteristic Length {19, 20} = 0.8;
Characteristic Length {13, 14} = 0.8;

// Additional transfinite curves
Transfinite Curve {1, 5, 2, 3, 8, 6} = 60 Using Progression 1.1;
Transfinite Curve {1, 5, 2, 3, 8, 6} = 60 Using Bump 1.1;

// Extrude surfaces to create 3D mesh (commented out in the original script)
Extrude {0, 0, -1} {
Surface{5}; Surface{4}; Surface{3}; Surface{2}; Surface{1}; Layers{1}; Recombine;
 }

// Extrude surfaces to create 3D mesh
//Extrude {0, 0, 4} {
//  Surface{5}; Surface{4}; Surface{1}; Surface{2}; Surface{3};
//}

//+
Physical Volume("fluide", 69) = {4, 3, 2, 5, 1};
//+
Physical Surface("inlet", 70) = {26};
//+
Physical Surface("walls", 71) = {27, 25};
//+
Physical Surface("outlet", 72) = {28, 6, 24};

//+
Physical Surface("front", 73) = {29, 12, 23, 20, 16};
//+
Physical Surface("back", 74) = {1, 5, 2, 3, 4};
//+
Physical Surface("circle", 75) = {19, 22, 13, 9};

