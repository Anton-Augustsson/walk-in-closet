/*

    Walk-in closet
    
    By Anton Augustsson
    
    
*/

use <module/dovetail-drawer.scad>;
use <module/hanger.scad>;

/*
    ---------- Variables ---------- 
*/

totalWidth  = 1000;
totalDepth  = 600; 
totalHeight = 1600;

frameThickness = 20;
shelfThickness = frameThickness;

drawerThicknessBottom = 8;
drawerThicknessSide   = 12;
drawerThicknessFront  = 20;
drawerDepth  = totalDepth;
drawerWidth  = (totalWidth
    -frameThickness*2
    -shelfThickness)/2;
drawerHeight = 100;

hangingHeight = 1000;

shelfHeight = (totalHeight
    -hangingHeight
    -frameThickness*2
    -shelfThickness*3)/3;

shelf1Position = shelfHeight
    +frameThickness;
shelf2Position = shelfHeight*2
    +frameThickness
    +shelfThickness;
shelf3Position = shelfHeight*3
    +frameThickness
    +shelfThickness*2;

/*
    ---------- Code ---------- 
*/


// ---------- Frame ---------- 
color("Wheat")
union () {
// Left
translate([
    0,
    0,
    0]) 
cube(size = [
    frameThickness,
    totalDepth,
    totalHeight]);

// Right
translate([
    totalWidth-frameThickness,
    0,
    0]) 
cube(size = [
    frameThickness,
    totalDepth,
    totalHeight]);

// Bottom
translate([
    frameThickness,
    0,
    0]) 
cube(size = [
    totalWidth-frameThickness*2,
    totalDepth,
    frameThickness]);

// Top
translate([
    frameThickness,
    0,
    totalHeight-frameThickness]) 
cube(size = [
    totalWidth-frameThickness*2,
    totalDepth,
    frameThickness]);
}

// ---------- Shelf ---------- 
color("Tan")
union () {

// Shelf 1
translate([
    frameThickness,
    0,
    shelf1Position]) 
cube(size = [
    totalWidth-frameThickness*2,
    totalDepth,
    shelfThickness]);

// Devider B S1-S2
translate([
    (totalWidth-shelfThickness)/2,
    0,
    frameThickness]) 
cube(size = [
    shelfThickness,
    totalDepth,
    shelf1Position-frameThickness]);

// Shelf 2
translate([
    frameThickness,
    0,
    shelf2Position]) 
cube(size = [
    totalWidth-frameThickness*2,
    totalDepth,
    shelfThickness]);

// Devider B S2-S3
translate([
    (totalWidth-shelfThickness)/2,
    0,
    frameThickness]) 
cube(size = [
    shelfThickness,
    totalDepth,
    shelf2Position-frameThickness]);
    
// Shelf 3
translate([
    frameThickness,
    0,
    shelf3Position]) 
cube(size = [
    totalWidth-frameThickness*2,
    totalDepth,
    shelfThickness]);

// Devider B S2-S3
translate([
    (totalWidth-shelfThickness)/2,
    0,
    frameThickness]) 
cube(size = [
    shelfThickness,
    totalDepth,
    shelf3Position-frameThickness]);
}

// Left
dovetailDrawer (
    drawerThicknessBottom,
    drawerThicknessSide,
    drawerThicknessFront,
    totalDepth,
    (totalWidth-shelfThickness)/2
    -shelfThickness,
    shelfHeight,
    frameThickness,0,
    shelf2Position+shelfThickness,
    0
    );

// Right
dovetailDrawer (
    drawerThicknessBottom,
    drawerThicknessSide,
    drawerThicknessFront,
    totalDepth,
    (totalWidth-shelfThickness)/2
    -shelfThickness,
    shelfHeight,
    (totalWidth-shelfThickness)/2
    +frameThickness,0,
    shelf2Position+shelfThickness,
    0
    );
    
hanger (
    20,
    totalWidth-frameThickness*2,
    frameThickness,
    totalDepth/2-20,
    totalHeight-frameThickness-100
    );
