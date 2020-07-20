/*

    Dovetail Drawer
    
    By Anton Augustsson


*/

// use dovtail library

module dovetailDrawer (
    thicknessBottom,
    thicknessSide,
    thicknessFront,
    lenghtDrawer,
    widthDrawer,
    heightDrawer,
    xDrawer,yDrawer,zDrawer,
    yRotate
    ){
/*
    ---------- Local varibles ---------- 
*/

length = lenghtDrawer;
width  = widthDrawer;
height = heightDrawer;

x=xDrawer;
y=yDrawer;
z=zDrawer;

/*
    ---------- Code ---------- 
*/

translate([
    x,
    y,
    z]) 
rotate([0,yRotate,0])
difference () {
union () {

// Left
color("Wheat")
translate([
    0,
    thicknessFront/4,
    0]) 
cube(size = [
    thicknessSide,
    length-thicknessFront/4,
    height]);

// Right
color("Wheat")
translate([
    width-thicknessSide,
    thicknessFront/4,
    0]) 
cube(size = [
    thicknessSide,
    length-thicknessFront/4,
    height]);
    
// Bottom 
color("Wheat")
translate([
    thicknessSide/2,
    thicknessFront,
    10]) 
cube(size = [
    width-thicknessSide,
    length-thicknessFront-thicknessSide,
    thicknessBottom]);

// Back
color("Wheat")
translate([
    0,
    length-thicknessSide,
    0]) 
cube(size = [
    width,
    thicknessSide,
    height]);

// Front
color("BurlyWood")
translate([
    0,
    0,
    0]) 
cube(size = [
    width,
    thicknessFront,
    height]);    
}


translate([
    width/2,                   
    -1,   
    height/4*3
    ])  
rotate([270,0,0])
cylinder(
    h = thicknessFront+2,    
    r = 10        
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

dovetailDrawer (
    thicknessBottom,
    thicknessSide,
    thicknessFront,
    length,
    width,
    height,
    x,y,z,
    yRotate
    );