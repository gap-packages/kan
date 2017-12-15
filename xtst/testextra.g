##############################################################################
##
#W  testextra.g                   Kan Package                    Chris Wensley
##                                                               Anne Heyworth 
#Y  Copyright (C) 2000-2017, Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 
##  

LoadPackage( "kan" );

pkgname := "kan"; 
pkgdir := DirectoriesPackageLibrary( pkgname, "xtst" );
testfiles := [ "kbtest.tst" ];
testresult := true;
for ff in testfiles do
    fn := Filename( pkgdir, ff );
    Print( "#I  Testing ", fn, "\n" );
    if not Test( fn, rec(compareFunction := "uptowhitespace") ) then
        testresult := false;
    fi;
od;
if testresult then
    Print("#I  No errors detected in extra tests for ", pkgname, "\n");
else
    Print("#I  Errors detected in extra tests for ", pkgname, "\n");
fi;
