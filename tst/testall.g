#############################################################################
##
#W  testall.g                 GAP4 package `Kan'                Chris Wensley
## 
#Y  Copyright (C) 2001-2019, Chris Wensley and Anne Heyworth 
##
#############################################################################

LoadPackage( "kan" ); 
TestDirectory( 
    [ DirectoriesPackageLibrary( "kan", "tst/manual" ), 
      DirectoriesPackageLibrary( "kan", "tst/extra" ) ], 
    rec( exitGAP := true,
         testOptions := rec(compareFunction := "uptowhitespace") ) 
    );
FORCE_QUIT_GAP(1);
