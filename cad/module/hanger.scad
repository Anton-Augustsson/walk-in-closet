/*

    Hanger
    
    By Anton Augustsson


*/



module hanger (
    rodDiameter,
    rodLength,
    x,y,z
    ){
/*
    ---------- Local varibles ---------- 
*/

mountWidth = rodDiameter*4;
mountThickness = rodDiameter/2;
        
/*
    ---------- Code ---------- 
*/

color("BurlyWood")
translate([
    x,
    y,
    z]) 
union () {
    
// Left mount width
translate([
    0,
    0,
    0]) 
cube(size = [
    mountThickness,
    mountWidth,
    mountWidth]);

// Right mount width
translate([
    rodLength-mountThickness,
    0,
    0]) 
cube(size = [
    mountThickness,
    mountWidth,
    mountWidth]);

translate([
    0,                   
    mountWidth/2,   
    mountWidth/2
    ])  
rotate([0,90,0])
cylinder(
    h = rodLength,
    r = rodDiameter/2
    );      
}}
    
/*
    ---------- Example ---------- 
*/


thicknessBottom = 14;
thicknessSide   = 14;
thicknessFront  = 20;

length = 500;
width  = 600;
height = 100;


x=0;
y=0;
z=0;
yRotate=0;

hanger (
    20,
    1000,
    x,y,z
    );