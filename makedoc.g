##  makedoc.g for the package Kan,
##  This builds the documentation of the Kan package. 
##  Needs: GAPDoc & AutoDoc packages, latex, pdflatex, mkindex
##  call this with GAP from within the package root directory 

LoadPackage( "Kan" );
LoadPackage( "GAPDoc" );
LoadPackage( "AutoDoc" ); 

AutoDoc(rec( 
    scaffold := rec(
        includes := [ "intro.xml", "dcrws.xml", "history.xml" ],
        bib := "bib.xml", 
        entities := rec( 
            kan := "<Package>Kan</Package>", 
            AutoDoc := "<Package>AutoDoc</Package>", 
            Automata := "<Package>Automata</Package>" 
        )
    )
));
