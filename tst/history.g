##  kan/tst/history.g 
LoadPackage("kan");
Print( "running history.tst\n" ); 
Test( "tst/manual/history.tst", rec(compareFunction := "uptowhitespace") ); 
