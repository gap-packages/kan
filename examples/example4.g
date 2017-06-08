##############################################################################
##
#W  example4.g                   Kan Package                     Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2017, Chris Wensley and Anne Heyworth 
##

Print("\n================================================\n"); 
Print("2-generator example example4.g, <a^3,b^3,(ab)^3>\n"); 
Print("================================================\n\n"); 

if ( Filename( KBMAG_FOR_KAN_PATH, "kbprog" ) = fail ) then
    Info( InfoKan, 1, "aborting: needs functions from the KBMAG package" );
else
    SetInfoLevel( InfoKan, 1 );
    SetInfoLevel( InfoKnuthBendix, 1 );

    F4 := FreeGroup("a","b");
    rels4 := [ F4.1^3, F4.2^3, (F4.1*F4.2)^3 ];
    G4 := F4/rels4;
    alph4 := "AaBb";
    waG4 := WordAcceptorByKBMag( G4, alph4 );;
    Print( waG4, "\n");
    langG4 := FAtoRatExp( waG4 );
    Print( langG4, "\n" );

    limit := 100;
    Print( "\nusing a limit of ", limit, " for the partial rws\n\n" );
    genG4 := GeneratorsOfGroup( G4 );
    a := genG4[1];;  b := genG4[2];; 
    H4 := Subgroup( G4, [ a*b ] );; 
    K4 := Subgroup( G4, [ b*a ] );;
    rwsG4 := KnuthBendixRewritingSystem( G4, "shortlex", [2,1,4,3], alph4 );
    Print( "Attributes of G4 :-\n", KnownAttributesOfObject( G4 ), "\n\n" );
    dcrws4 := PartialDoubleCosetRewritingSystem( G4, H4, K4, rwsG4, limit );
    Print( "#I ", Length( Rules( dcrws4 ) ), " rules found.\n" );
    dcaut4 := WordAcceptorByKBMagOfDoubleCosetRws( G4, dcrws4 );
    Print( "\nDouble Coset Minimalized automaton:\n", dcaut4, "\n");
    dclang4 := FAtoRatExp( dcaut4 );
    Print( "Double Coset language of acceptor:\n", dclang4, "\n\n" );
    ok := DCrules(dcrws4);;
    alph4e := dcrws4!.alphabet;
    Print( "H-rules = \n" );  DisplayAsString( Hrules(dcrws4), alph4e, true );
    Print( "K-rules = \n" );  DisplayAsString( Krules(dcrws4), alph4e, true );
    Print( "HK-rules= \n" );  DisplayAsString( HKrules(dcrws4), alph4e, true );

    len := 30;;
    L4 := 0*[1..len];;
    L4[1] := IdentityDoubleCoset( dcrws4 );;
    for i in [2..len] do
        L4[i] := NextWord( dcrws4, L4[i-1] );
    od;
    Print( "\nlist of ", len," irreducible words:-\n" );
    DisplayAsString( L4, alph4e, true );

    R4 := 0*[1..len];
    R4[1] := true;
    for i in [2..len] do
        w := Subword( L4[i], 2, Length(L4[i])-1 );
        s := WordToString( w, alph4e );
        R4[i] := IsRecognizedByAutomaton( waG4, s );
    od;
    if ( First(R4, b -> b=false) = fail ) then
        Print( "\nAll ", len, " irreducible reps accepted by rwsG4\n" );
    else
        Print( "not all of these representatives are accepted by rwsG4\n" );
    fi;

    w := NextWord( dcrws4, L4[30] );
    Print( "\nnext word w is: ", w, "\n" );
    s := WordToString( w, alph4e );
    Print( "converting w to a string gives: ", s, "\n\n" );
fi;
