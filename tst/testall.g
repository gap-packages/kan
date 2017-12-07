##############################################################################
##
#W  testall.g                    Kan Package                     Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2017, Chris Wensley and Anne Heyworth 
##

LoadPackage( "kan" );
dir := DirectoriesPackageLibrary("kan","tst");
TestDirectory(dir, rec(exitGAP := true,
    testOptions:=rec(compareFunction := "uptowhitespace")));
FORCE_QUIT_GAP(1);
