# denprof
Lipid Bilayer Density Profile Calculator

The code compute the density profile for membranes.
Three different type of profiles can be calcualted: number density, mass density and electron density.
Extra information (mass and no. of electrons) must be provided for mass and electron density calculation.
-sym option can be used to symmetrize the profile. 
The code support the popular GROMACS format of trajectory (.gro) and the trajectory of OCCAM MD Code.
List of options and usage are listed below.

The code is developed and mantained by Antonio De Nicola (adenicola.chem@gmail.com)

 -type [num, mass, ele]
 -dir [X, Y, Z]
 -sl no. of slice
 -m mass of the selcted particle
 -ei electron of the selected particle
 -sel particle to select i.e.: W
 -sym symmetrize profile [yes]
 -in input traj
 -format [gro, occam]
 -o ouput
 
 --help print this help
 --ver print the version
 Usage:
 ./densprof.x -in trj.gro -format gro -o out.dat  -dir X -sl 20 -type mass -m 18.016 -sel W
