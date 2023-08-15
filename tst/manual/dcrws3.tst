##############################################################################
##
#W  dcrws3.tst                    Kan Package                    Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2021, Chris Wensley and Anne Heyworth 
#Y  School of Computer Science, Bangor University, U.K. 
##
gap> START_TEST( "Kan package: dcrws3.tst" );
gap> kan_infolevel_saved := InfoLevel( InfoKan );;
gap> SetInfoLevel( InfoKan, 0 );;
gap> knuth_bendix_infolevel_saved := InfoLevel( InfoKnuthBendix );; 
gap> SetInfoLevel( InfoKnuthBendix, 0 );;
gap> previous_assertion_level := AssertionLevel();; 
gap> ## setting AssertionLevel to 0 to avoid recursion in Automata
gap> SetAssertionLevel( 0 );; 

## Section 2.3 
gap> FT := FreeGroup( 2 );;
gap> relsT := [ FT.1^3*FT.2^-2 ];;
gap> T := FT/relsT;;
gap> genT := GeneratorsOfGroup( T );;
gap> U := Subgroup( T, [ genT[1] ] );;  
gap> V := Subgroup( T, [ genT[2] ] );;
gap> alphT := "cCdD";;
gap> ordT := [3,4,1,2];;
gap> orderT := "wreath";;
gap> rwsT := ReducedConfluentRewritingSystem( T, ordT, orderT, 0, alphT );;
gap> DisplayRwsRules( rwsT );;
[ [ C, ccDD ], [ dD, id ], [ Dc, dcDD ], [ Dd, id ], [ ccc, dd ], [ \
ddc, cdd ]\
 ]
gap> accT := WordAcceptorOfReducedRws( rwsT );
< deterministic automaton on 4 letters with 7 states >

gap> ## Display( accT );   ## commented out as dev output differs from 4r8 

gap> langT := FAtoRatExp( accT );
(dcUc)((cdUd)c)*((cdUd)(dd*U@)Uc(DD*U@)UDD*U@)Ud(dd*U@)UDD*U@

gap> free := FreeMonoidOfRewritingSystem( rwsT );;
gap> mon := MonoidOfRewritingSystem( rwsT );;
gap> gens := GeneratorsOfMonoid( free );; 
gap> oalphT := OrderedAlphabet( rwsT );
"dDcC"
gap> c := gens[1];;  C := gens[2];;  d := gens[3];;  D := gens[4];;
gap> w := d^5*c^5; 
f2^5*f1^5
gap> sw := WordToString( w, alphT ); 
"dddddccccc"
gap> rw := ReducedForm( rwsT, w );
f2*f1^2*f2^6
gap> srw := WordToString( rw, alphT ); 
"dccdddddd"
gap> IsRecognizedByAutomaton( accT, sw ); 
false
gap> IsRecognizedByAutomaton( accT, srw );
true

gap> alph := AlphabetOfRatExpAsList( langT );; 
gap> a1 := RatExpOnnLetters( alph, [ ], [1] );;   ## d
gap> a2 := RatExpOnnLetters( alph, [ ], [2] );;   ## D
gap> a3 := RatExpOnnLetters( alph, [ ], [3] );;   ## c
gap> a4 := RatExpOnnLetters( alph, [ ], [4] );;   ## C
gap> s1 := RatExpOnnLetters( alph, "star", a1 );; ## d*
gap> s2 := RatExpOnnLetters( alph, "star", a2 );; ## D*
gap> a1a3 := RatExpOnnLetters( alph, "product", [ a1, a3 ] );;  ## dc 
gap> u1 := RatExpOnnLetters( alph, "union", [ a1a3, a3 ] );;    ## dcUc
gap> a3a1 := RatExpOnnLetters( alph, "product", [ a3, a1 ] );;  ## cd
gap> u2 := RatExpOnnLetters( alph, "union", [ a3a1, a1 ] );;    ## cdUd
gap> u2a3 := RatExpOnnLetters( alph, "product", [ u2, a3 ] );;  ## (cdUd)c
gap> su2a3 := RatExpOnnLetters( alph, "star", u2a3 );;          ## ((cdUd)c)*
gap> u2s1 := RatExpOnnLetters( alph, "product", [ u2, s1 ] );;  ## (cdUd)d*
gap> a3s2 := RatExpOnnLetters( alph, "product", [ a3, s2 ] );;  ## cD*
gap> u3 := RatExpOnnLetters( alph, "union", [u2s1,a3s2,s2] );; 
gap> prod := RatExpOnnLetters( alph, "product", [u1,su2a3,u3] );;  
gap> a1s1 := RatExpOnnLetters( alph, "product", [ a1, s1 ] );;  ## dd*
gap> r := RatExpOnnLetters( alph, "union", [ prod, a1s1, s2] );
(dcUc)((cdUd)c)*((cdUd)d*UcD*UD*)Udd*UD*
gap> AreEqualLang( langT, r );
true

gap> ## find a partial dcrws with a maximum of 20 rules
gap> prwsT :=  PartialDoubleCosetRewritingSystem( T, U, V, rwsT, 20 );;
gap> ## DisplayRwsRules( prwsT );;
gap> paccT := WordAcceptorOfPartialDoubleCosetRws( T, prwsT );
< deterministic automaton on 6 letters with 6 states >
gap> Print( paccT );
Automaton("det",6,"HKdDcC",[ [ 2, 2, 2, 6, 2, 2 ], [ 2, 2, 1, 2, 2, 1 ], [ 2, \
2, 5, 2, 2, 5 ], [ 2, 2, 2, 2, 2, 2 ], [ 2, 2, 6, 2, 3, 2 ], [ 2, 2, 2, 2, 2, \
2 ] ],[ 4 ],[ 1 ]);;
gap> plangT := FAtoRatExp( paccT );
H(dc(dc)*c)*(dc(dc)*KUK)
gap> wordsT := [ "HK", "HcK", "HdK", "HDK", "HdcK", "HdccK", "HddH", "HdcDK"];;
gap> validT := List( wordsT, w -> IsRecognizedByAutomaton( paccT, w ) );
[ true, false, false, false, true, true, false, false ]

gap> pfree := FreeMonoidOfRewritingSystem( prwsT );; 
gap> pgens := GeneratorsOfMonoid( pfree );; 
gap> H := pgens[1];;  K := pgens[2];; 
gap> c := pgens[3];;  C := pgens[4];; 
gap> d := pgens[5];;  D := pgens[6];;
gap> palphT := Concatenation( "HK", alphT ); 
"HKcCdD"
gap> pw := H*d^5*c^5*K;;  DisplayAsString( pw, palphT );
HdddddcccccK
gap> rpw := ReducedForm( prwsT, pw );; 
gap> spw := WordToString( rpw, palphT ); 
"HdccK"
gap> ok := IsRecognizedByAutomaton( paccT, spw ); 
true 

gap> SetAssertionLevel( previous_assertion_level );; 
gap> SetInfoLevel( InfoKnuthBendix, knuth_bendix_infolevel_saved );;  
gap> SetInfoLevel( InfoKan, kan_infolevel_saved );;  
gap> STOP_TEST( "dcrws3.tst", 10000 );

##############################################################################
##
#E  dcrws3.tst . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
