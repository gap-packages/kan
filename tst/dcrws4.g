##  kan/tst/dcrws4.g 
LoadPackage("kan");
Print( "running dcrws4.tst\n" ); 
Test( "tst/manual/dcrws4.tst", rec(compareFunction := "uptowhitespace") ); 
