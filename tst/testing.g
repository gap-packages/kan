##############################################################################
##
#W  testing.g                    Kan Package                     Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2018, Chris Wensley and Anne Heyworth 
##

LoadPackage( "kan" );

pkgname := "kan";
pkgdir := DirectoriesPackageLibrary( pkgname, "tst" );
if ( Filename( KBMAG_FOR_KAN_PATH, "kbprog" ) = fail ) then 
    testfiles := [ "example1.tst", "example2.tst", 
                   "example3.tst", "example5.tst" ];
else 
    testfiles := [ "example1.tst", "example2.tst", 
                   "example3.tst", "example4.tst", "example5.tst" ];
fi;
testresult := true;
for ff in testfiles do
    fn := Filename( pkgdir, ff );
    Print( "#I  Testing ", fn, "\n" );
    if not Test( fn, rec(compareFunction := "uptowhitespace", 
                            showProgress := true ) ) then
        testresult := false;
    fi;
od;
if testresult then
    Print("#I  No errors detected while testing package ", pkgname, "\n");
else
    Print("#I  Errors detected while testing package ", pkgname, "\n");
fi;
