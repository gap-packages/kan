##  kan/tst/dcrws1.g 
LoadPackage("kan");
Print( "running dcrws1.tst\n" ); 
Test( "tst/manual/dcrws1.tst", rec(compareFunction := "uptowhitespace") ); 
