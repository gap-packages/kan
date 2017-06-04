##############################################################################
##
#W  readall.g                     GAP4 package `Kan'             Chris Wensley
#W  
#Y  Copyright (C) 1996-2017, Anne Heyworth and Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 
##  

LoadPackage( "kan", false ); 
kan_examples_dir := DirectoriesPackageLibrary( "kan", "examples" ); 

Read( Filename( kan_examples_dir, "example1.g" ) ); 
Read( Filename( kan_examples_dir, "example2.g" ) ); 
Read( Filename( kan_examples_dir, "example3.g" ) ); 
Read( Filename( kan_examples_dir, "example4.g" ) ); 
Read( Filename( kan_examples_dir, "example5.g" ) ); 

