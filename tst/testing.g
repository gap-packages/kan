##############################################################################
##
#W  testing.g                   Kan Package                     Chris Wensley
##   
#Y  Copyright (C) 1999-2019, Chris Wensley and Anne Heyworth  
#Y  School of Computer Science, Bangor University, U.K. 

LoadPackage( "kan" );

pkgname := "kan";
pkgdir := DirectoriesPackageLibrary( pkgname, "tst/manual" ); 
## testing manual examples 
testmanual := 
    [ "dcrws1.tst",  "dcrws2.tst",    "dcrws3.tst",    "dcrws4.tst", 
      "history.tst" ];
testresult := true;
for ff in testmanual do
    fn := Filename( pkgdir, ff );
    Print( "#I  Testing ", fn, "\n" );
    if not Test( fn, rec(compareFunction := "uptowhitespace", 
                            showProgress := true ) ) then
        testresult := false;
    fi;
od;
if testresult then
    Print( "#I  No errors detected while testing manual examples in package ", 
           pkgname, "\n" );
else
    Print( "#I  Errors detected while testing manual examples in package ", 
           pkgname, "\n" );
fi; 
## testing extra examples
pkgdir := DirectoriesPackageLibrary( pkgname, "tst/extra" );
testextra := 
    [ "kbtest.tst" ];
testresult := true;
for ff in testextra do
    fn := Filename( pkgdir, ff );
    Print( "#I  Testing ", fn, "\n" );
    if not Test( fn, rec(compareFunction := "uptowhitespace", 
                            showProgress := true ) ) then
        testresult := false;
    fi;
od;
if testresult then
    Print( "#I  No errors detected while testing extra examples in package ", 
           pkgname, "\n" );
else
    Print( "#I  Errors detected while testing extra examples in package ", 
           pkgname, "\n" );
fi; 
