##############################################################################
##
#W  dcrws1.tst                    Kan Package                    Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2023, Chris Wensley and Anne Heyworth 
#Y  School of Computer Science, Bangor University, U.K. 
##
gap> START_TEST( "Kan package: dcrws1.tst" );
gap> kan_infolevel_saved := InfoLevel( InfoKan );;
gap> SetInfoLevel( InfoKan, 0 );;
gap> knuth_bendix_infolevel_saved := InfoLevel( InfoKnuthBendix );; 
gap> SetInfoLevel( InfoKnuthBendix, 0 );;
gap> previous_assertion_level := AssertionLevel();; 
gap> ## setting AssertionLevel to 0 to avoid recursion in Automata
gap> SetAssertionLevel( 0 );; 

## Section 2.1
gap> F4 := FreeGroup( 4 );;
gap> rels := [ Comm(F4.1,F4.2) * Comm(F4.3,F4.4) ];;
gap> H4 := F4/rels;; 
gap> L := [2,1,4,3,6,5,8,7];;
gap> order := "wreath";;
gap> alph4 := "aAbBcCdD";;
gap> rws4 := ReducedConfluentRewritingSystem( H4, L, order, 0, alph4 );;
gap> DisplayRwsRules( rws4 );
[ [ aA, id ], [ Aa, id ], [ bB, id ], [ Bb, id ], [ cC, id ], [ cd, dcBAba ], \
[ Cc, id ], [ Cd, dABabC ], [ CD, BAbaDC ], [ dD, id ], [ Dd, id ], [ cBAbaD, \
Dc ] ]
true
gap> a := H4.1;; b := H4.2;; c := H4.3;; d := H4.4;; 
gap> c*d;
f3*f4
gap> ReducedForm( H4, c*d);
f4*f3*f2^-1*f1^-1*f2*f1
gap> free4 := FreeMonoidOfRewritingSystem( rws4 );; 
gap> gens4 := GeneratorsOfMonoid( free4 );
[ f1, f1^-1, f2, f2^-1, f3, f3^-1, f4, f4^-1 ]
gap> NextWord( rws4, gens4[5]*gens4[7] ); 
f3*f4^-1
gap> NextWords( rws4, last, 20, 100 );
[ f3^-1*f1, f3^-1*f1^-1, f3^-1*f2, f3^-1*f2^-1, f3^-1^2, f4*f1, f4*f1^-1, 
  f4*f2, f4*f2^-1, f4*f3, f4*f3^-1, f4^2, f4^-1*f1, f4^-1*f1^-1, f4^-1*f2, 
  f4^-1*f2^-1, f4^-1*f3, f4^-1*f3^-1, f4^-1^2, f1^3 ]

gap> SetAssertionLevel( previous_assertion_level );; 
gap> SetInfoLevel( InfoKnuthBendix, knuth_bendix_infolevel_saved );;  
gap> SetInfoLevel( InfoKan, kan_infolevel_saved );;  
gap> STOP_TEST( "dcrws1.tst", 10000 );

##############################################################################
##
#E  dcrws1.tst . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
