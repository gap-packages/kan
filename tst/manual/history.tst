##############################################################################
##
#W  history.tst                   Kan Package                    Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2019, Chris Wensley and Anne Heyworth 
#Y  School of Computer Science, Bangor University, U.K. 
##
gap> START_TEST( "Kan package: history.tst" );
gap> kan_infolevel_saved := InfoLevel( InfoKan );;
gap> SetInfoLevel( InfoKan, 0 );;
gap> knuth_bendix_infolevel_saved := InfoLevel( InfoKnuthBendix );; 
gap> SetInfoLevel( InfoKnuthBendix, 0 );;
gap> previous_assertion_level := AssertionLevel();; 
gap> ## setting AssertionLevel to 0 to avoid recursion in Automata
gap> SetAssertionLevel( 0 );; 

## Section 3.2 
##
gap> F := FreeGroup(2);;
gap> rels := [ F.2^2, (F.1*F.2)^2 ];;
gap> G5 := F/rels;;
gap> genG5 := GeneratorsOfGroup( G5 );;
gap> a := genG5[1];;  b := genG5[2];;
gap> U := Subgroup( G5, [a^2] );;
gap> V := Subgroup( G5, [b] );;
gap> L := [2,1,4,3];; 
gap> rws5 := ReducedConfluentRewritingSystem( G5, L, "shortlex", 0, "aAbB" );; 
gap> dc5 := DoubleCosetsAutomaton( G5, U, V );;
gap> Print( dc5 );
Automaton("det",5,"HKAaBb",[ [ 2, 2, 2, 5, 2 ], [ 2, 2, 1, 2, 1 ], [ 2, 2, 2, \
2, 3 ], [ 2, 2, 2, 2, 2 ], [ 2, 2, 2, 2, 2 ], [ 2, 2, 2, 2, 2 ] ],[ 4 ],[ 1 ])\
;;
gap> rc5 := RightCosetsAutomaton( G5, V );;
gap> Print( rc5 );
Automaton("det",6,"HKAaBb",[ [ 2, 2, 2, 6, 2, 2 ], [ 2, 2, 1, 2, 1, 1 ], [ 2, \
2, 3, 2, 2, 3 ], [ 2, 2, 2, 2, 5, 5 ], [ 2, 2, 2, 2, 2, 2 ], [ 2, 2, 2, 2, 2, \
2 ] ],[ 4 ],[ 1 ]);;

gap> SetAssertionLevel( previous_assertion_level );; 
gap> SetInfoLevel( InfoKnuthBendix, knuth_bendix_infolevel_saved );;  
gap> SetInfoLevel( InfoKan, kan_infolevel_saved );;  
gap> STOP_TEST( "history.tst", 10000 );

##############################################################################
##
#E  history.tst  . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
