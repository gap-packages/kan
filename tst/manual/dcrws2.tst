##############################################################################
##
#W  dcrws2.tst                    Kan Package                    Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2019, Chris Wensley and Anne Heyworth 
#Y  School of Computer Science, Bangor University, U.K. 
##
gap> START_TEST( "Kan package: dcrws2.tst" );
gap> kan_infolevel_saved := InfoLevel( InfoKan );;
gap> SetInfoLevel( InfoKan, 0 );;
gap> knuth_bendix_infolevel_saved := InfoLevel( InfoKnuthBendix );; 
gap> SetInfoLevel( InfoKnuthBendix, 0 );;
gap> previous_assertion_level := AssertionLevel();; 
gap> ## setting AssertionLevel to 0 to avoid recursion in Automata
gap> SetAssertionLevel( 0 );; 

## Section 2.2 
gap> G1 := FreeGroup( 2 );;
gap> L1 := [2,1,4,3];;
gap> order := "shortlex";;
gap> alph1 := "AaBb";;
gap> rws1 := ReducedConfluentRewritingSystem( G1, L1, order, 0, alph1 );
Rewriting System for Monoid( [ f1, f1^-1, f2, f2^-1 ] ) with rules 
[ [ f1*f1^-1, <identity ...> ], [ f1^-1*f1, <identity ...> ], 
  [ f2*f2^-1, <identity ...> ], [ f2^-1*f2, <identity ...> ] ]
gap> DisplayRwsRules( rws1 );;
[ [ Aa, id ], [ aA, id ], [ Bb, id ], [ bB, id ] ]
gap> genG1 := GeneratorsOfGroup( G1 );;
gap> H1 := Subgroup( G1, [ genG1[1]^6 ] );;
gap> K1 := Subgroup( G1, [ genG1[1]^4 ] );;
gap> dcrws1 := DoubleCosetRewritingSystem( G1, H1, K1, rws1 );;
gap> IsDoubleCosetRewritingSystem( dcrws1 );
true
gap> DisplayRwsRules( dcrws1 );;
G-rules:
[ [ Aa, id ], [ aA, id ], [ Bb, id ], [ bB, id ] ]
H-rules:
[ [ HAAA, Haaa ],
  [ Haaaa, HAA ] ]
K-rules:
[ [ AAK, aaK ],
  [ aaaK, AK ] ]
H-K-rules:
[ [ HAK, HaK ],
  [ HaaK, HK ] ]

gap> free := FreeMonoidOfRewritingSystem( dcrws1 );;
gap> mon := MonoidOfRewritingSystem( dcrws1 );; 
gap> gens := GeneratorsOfMonoid( free );; 
gap> H := gens[1];;  K := gens[2];; 
gap> A := gens[3];;  a := gens[4];; 
gap> B := gens[5];;  b := gens[6];;
gap> alph2 := Concatenation( "HK", alph1 ); 
"HKAaBb"
gap> w := H*a^5*b^3*a^5*K;
m1*m4^5*m6^3*m4^5*m2
gap> DisplayAsString( w, alph2 ); 
HaaaaabbbaaaaaK
gap> rw := ReducedForm( dcrws1, w );
m1*m3*m6^3*m4*m2
gap> DisplayAsString( rw, alph2 ); 
HAbbbaK

gap> waG1 := WordAcceptorOfReducedRws( rws1 );;
gap> Print( waG1 );
Automaton("det",6,"aAbB",[ [ 1, 4, 1, 4, 4, 4 ], [ 1, 3, 3, 1, 3, 3 ], [ 1, 2,\
 2, 2, 1, 2 ], [ 1, 1, 5, 5, 5, 5 ] ],[ 6 ],[ 2, 3, 4, 5, 6 ]);;
gap> wadc1 := WordAcceptorOfDoubleCosetRws( dcrws1 );
< deterministic automaton on 6 letters with 15 states >
gap> words1 := [ "HK","HaK","HbK","HAK","HaaK","HbbK","HabK","HbaK","HbaabK"];;
gap> valid1 := List( words1, w -> IsRecognizedByAutomaton( wadc1, w ) );;
gap> Print( valid1, "\n" );
[ true, true, true, false, false, true, true, true, true ]
gap> lang1 := FAtoRatExp( wadc1 );
((H(aaaUAA)BUH(a(aBUB)UABUB))(a(a(aa*BUB)UB)UA(AA*BUB)UB)*(a(a(aa*bUb)Ub)UA(AA\
*bUb))UH(aaaUAA)bUH(a(abUb)UAbUb))((a(a(aa*BUB)UB)UA(AA*BUB))(a(a(aa*BUB)UB)UA\
(AA*BUB)UB)*(a(a(aa*bUb)Ub)UA(AA*bUb))Ua(a(aa*bUb)Ub)UA(AA*bUb)Ub)*((a(a(aa*BU\
B)UB)UA(AA*BUB))(a(a(aa*BUB)UB)UA(AA*BUB)UB)*(a(aKUK)UAKUK)Ua(aKUK)UAKUK)U(H(a\
aaUAA)BUH(a(aBUB)UABUB))(a(a(aa*BUB)UB)UA(AA*BUB)UB)*(a(aKUK)UAKUK)UH(aKUK)

gap> SetAssertionLevel( previous_assertion_level );; 
gap> SetInfoLevel( InfoKnuthBendix, knuth_bendix_infolevel_saved );;  
gap> SetInfoLevel( InfoKan, kan_infolevel_saved );;  
gap> STOP_TEST( "dcrws2.tst", 10000 );

##############################################################################
##
#E  dcrws2.tst . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
