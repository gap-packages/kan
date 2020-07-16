##  kan/tst/dcrws3.g 
LoadPackage("kan");
Print( "running dcrws3.tst\n" ); 
Test( "tst/manual/dcrws3.tst", rec(compareFunction := "uptowhitespace") ); 
