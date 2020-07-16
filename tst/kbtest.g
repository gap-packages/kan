##  kan/tst/kbtest.g 
LoadPackage("kan");
Print( "running kbtest.tst\n" ); 
Test( "tst/extra/kbtest.tst", rec(compareFunction := "uptowhitespace") ); 
