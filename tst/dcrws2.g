##  kan/tst/dcrws2.g 
LoadPackage("kan");
Print( "running dcrws2.tst\n" ); 
Test( "tst/manual/dcrws2.tst", rec(compareFunction := "uptowhitespace") ); 
