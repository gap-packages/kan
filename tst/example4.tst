##############################################################################
##
#W  example4.tst                  Kan Package                    Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2017, Chris Wensley and Anne Heyworth 

gap> kan_infolevel_saved := InfoLevel( InfoKan );;
gap> SetInfoLevel( InfoKan, 0 );;
gap> knuth_bendix_infolevel_saved := InfoLevel( InfoKnuthBendix );; 
gap> SetInfoLevel( InfoKnuthBendix, 0 );;
gap> previous_assertion_level := AssertionLevel();; 
gap> ## setting AssertionLevel to 0 to avoid recursion in Automata
gap> SetAssertionLevel( 0 );; 

## Example 4 
##
gap> F4 := FreeGroup("a","b");;
gap> rels4 := [ F4.1^3, F4.2^3, (F4.1*F4.2)^3 ];;
gap> G4 := F4/rels4;;
gap> alph4 := "AaBb";;
gap> waG4 := WordAcceptorByKBMag( G4, alph4 );;
gap> Print( waG4 );
Automaton("det",18,"aAbB",[ [ 2, 18, 18, 8, 10, 12, 13, 18, 18, 18, 18, 18, 18\
, 8, 17, 12, 18, 18 ], [ 3, 18, 18, 9, 11, 9, 12, 18, 18, 18, 18, 18, 18, 11, \
18, 11, 18, 18 ], [ 4, 6, 6, 18, 18, 18, 18, 18, 6, 12, 16, 18, 12, 18, 18, 18\
, 12, 18 ], [ 5, 5, 7, 18, 18, 18, 18, 14, 15, 5, 18, 18, 7, 18, 18, 18, 15, 1\
8 ] ],[ 1 ],[ 1 .. 17 ]);;
gap> langG4 := FAtoRatExp( waG4 );;
gap> Print( langG4, "\n" );
((abUAb)AUbA)(bA)*(b(aU@)UB(aB)*(a(bU@)U@)U@)U(abUAb)(aU@)U((aBUB)(aB)*AUba(Ba\
)*BA)(bA)*(b(aU@)U@)U(aBUB)(aB)*(a(bU@)U@)Uba(Ba)*(BU@)UbUaUA(B(aB)*(a(bU@)UAU\
@)U@)U@
gap> limit := 100;;
gap> genG4 := GeneratorsOfGroup( G4 );;
gap> a := genG4[1];;  b := genG4[2];; 
gap> genH4 := [ a*b ];;  genK4 := [ b*a ];;
gap> rwsG4 := KnuthBendixRewritingSystem( G4, "shortlex", [2,1,4,3], alph4 );;
gap> dcrws4 := PartialDoubleCosetRewritingSystem( G4, genH4, genK4, rwsG4, limit );;
gap> Print( Length( Rules( dcrws4 ) ), " rules found.\n" );
101 rules found.
gap> dcaut4 := WordAcceptorByKBMagOfDoubleCosetRws( G4, dcrws4 );;
gap> Print( "Double Coset Minimalized automaton:\n", dcaut4 );
Double Coset Minimalized automaton:
Automaton("det",44,"HKaAbB",[ [ 2, 2, 2, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2\
, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2\
, 2, 2 ], [ 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, \
2, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 1 ], [ 2, 2, 2,\
 2, 3, 24, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 43, 2, 43, 2, 27, 2, 2, 2\
, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ], [ 2, 2, 2, 2, 44, 3, 29, 2\
, 8, 2, 10, 2, 12, 2, 14, 2, 16, 2, 18, 2, 20, 2, 22, 2, 2, 2, 2, 26, 2, 29, 2\
, 31, 2, 33, 2, 35, 2, 37, 2, 39, 2, 41, 2, 2 ], [ 2, 2, 2, 2, 21, 2, 2, 28, 2\
, 9, 2, 11, 2, 13, 2, 15, 2, 17, 2, 19, 2, 42, 2, 3, 2, 28, 3, 2, 7, 2, 30, 2,\
 32, 2, 34, 2, 36, 2, 38, 2, 40, 2, 2, 28 ], [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2\
, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 6, 2, 25, 25, 2, 2, 2, 2, 2, 2, 2, 2, 2,\
 2, 2, 2, 2, 2, 2, 23, 6 ] ],[ 4 ],[ 1 ]);;
gap> dclang4 := FAtoRatExp( dcaut4 );;
gap> Print( "Double Coset language of acceptor:\n", dclang4, "\n" );
Double Coset language of acceptor:
(HbAbAbAbAbAbAbAbUHAb)(Ab)*(A(Ba(Ba)*bKUK)UK)UHbAbA(bA(bA(bA(bA(bAKUK)UK)UK)UK\
)UK)UH(A(B(aB)*(abUA)KUK)UaKUb(a(Ba)*BA(bA(bA(bA(bA(bA(bA(bA(bA)*(bKUK)UK)UK)U\
K)UK)UK)UK)UK)UAK)UK)
gap> ok := DCrules(dcrws4);;
gap> alph4e := dcrws4!.alphabet;;
gap> Print("H-rules:\n");  DisplayAsString( Hrules(dcrws4), alph4e, true );;
H-rules:
[ HB, Ha ]
[ HaB, Hb ]
[ Hab, H ]
[ HbAB, HAba ]
[ HbAbAB, HAbAba ]
[ HbAbAbAB, HAbAbAba ]
[ HbAbAbAbAB, HAbAbAbAba ]
[ HbAbAbAbAbAB, HAbAbAbAbAba ]
[ HbAbAbAbAbAbAB, HAbAbAbAbAbAba ]
[ HbAbAbAbAbAbAbAB, HAbAbAbAbAbAbAba ]
gap>     Print(" K-rules:\n");  DisplayAsString( Krules(dcrws4), alph4e, true );;
 K-rules:
[ BK, aK ]
[ BaK, bK ]
[ baK, K ]
[ BAbK, abAK ]
[ BAbAbK, abAbAK ]
[ BAbAbAbK, abAbAbAK ]
[ BAbAbAbAbK, abAbAbAbAK ]
[ BAbAbAbAbAbK, abAbAbAbAbAK ]
[ BAbAbAbAbAbAbK, abAbAbAbAbAbAK ]
[ BAbAbAbAbAbAbAbK, abAbAbAbAbAbAbAK ]
gap> Print("HK-rules:\n");  DisplayAsString( HKrules(dcrws4), alph4e, true );;
HK-rules:
[ HbK, HAK ]
[ HbAbK, HAbAK ]
[ HbAbAbK, HAbAbAK ]
[ HbAbAbAbK, HAbAbAbAK ]
[ HbAbAbAbAbK, HAbAbAbAbAK ]
[ HbAbAbAbAbAbK, HAbAbAbAbAbAK ]
[ HbAbAbAbAbAbAbK, HAbAbAbAbAbAbAK ]
gap> idc := IdentityDoubleCoset( dcrws4 );
m1*m2
gap> ## List of the next 29 normal forms for double cosets: 
gap> L4 := NextWords( dcrws4, idc, 29, 50000 );;
gap> DisplayAsString( L4, alph4e, true );
[ HAK, HaK, HAbK, HbAK, HABAK, HAbAK, HABabK, HAbAbK, HbAbAK, HbaBAK, HABaBAK,\
 HAbAbAK, HABaBabK, HAbABabK, HAbAbAbK, HbAbAbAK, HbaBAbAK, HbaBaBAK, HABaBaBA\
K, HAbAbAbAK, HABaBaBabK, HAbABaBabK, HAbAbABabK, HAbAbAbAbK, HbAbAbAbAK, HbaB\
AbAbAK, HbaBaBAbAK, HbaBaBaBAK, HABaBaBaBAK ]
gap> w := NextWord( dcrws4, L4[29] );;
gap> Print( w, "\n" );
m1*(m3*m6)^4*m3*m2
gap> s := WordToString( w, alph4e );;
gap> Print( s, "\n" );
HAbAbAbAbAK

gap> SetAssertionLevel( previous_assertion_level );; 
gap> SetInfoLevel( InfoKnuthBendix, knuth_bendix_infolevel_saved );;  
gap> SetInfoLevel( InfoKan, kan_infolevel_saved );;  

##############################################################################
##
#E  example4.tst . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
