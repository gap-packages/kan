#############################################################################
##
#W  read.g                   GAP package `kan'                  Chris Wensley
#W                                                            & Anne Heyworth
##  read the actual code

ReadPackage( "kan", "lib/dcrws.gi" ); 
ReadPackage( "kan", "lib/kbrws.gi" ); 

KBMAG_FOR_KAN_PATH := DirectoriesPackagePrograms( "kbmag" ); 
if ( Filename( KBMAG_FOR_KAN_PATH, "kbprog" ) = fail ) then
  Info( InfoWarning, 1, 
    "Package ``kbmag'' is not compiled, so some Kan functions are unavailable" );
else
  ReadPackage( "kan", "lib/dckbmag.gi" );
fi;
