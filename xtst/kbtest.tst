##############################################################################
##
#W  kbtest.tst                    Kan Package                    Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2017, Chris Wensley and Anne Heyworth 
#Y  School of Computer Science, Bangor University, U.K. 
##
gap> START_TEST( "Kan package: kbtest.tst" );
gap> kan_infolevel_saved := InfoLevel( InfoKan );;
gap> SetInfoLevel( InfoKan, 0 );;
gap> knuth_bendix_infolevel_saved := InfoLevel( InfoKnuthBendix );; 
gap> SetInfoLevel( InfoKnuthBendix, 0 );;
gap> previous_assertion_level := AssertionLevel();; 
gap> ## setting AssertionLevel to 0 to avoid recursion in Automata
gap> SetAssertionLevel( 0 );; 
 

gap> LoadPackage("kbmag");;
gap> F4 := FreeGroup("a","b");;
gap> rels4 := [ F4.1^3, F4.2^3, (F4.1*F4.2)^3 ]; 
[ a^3, b^3, (a*b)^3 ]
gap> G4 := F4/rels4;
<fp group on the generators [ a, b ]>
gap> rws4 := KBMAGRewritingSystem( G4 );
rec(
           isRWS := true,
          silent := true,
  generatorOrder := [_g1,_g2,_g3,_g4],
        inverses := [_g2,_g1,_g4,_g3],
        ordering := "shortlex",
       equations := [
         [_g1^2,_g2],
         [_g3^2,_g4],
         [_g1*_g3*_g1,_g4*_g2*_g4]
       ]
)
gap> ok := AutomaticStructure( rws4 );
true
gap> wa4 := WordAcceptor( rws4 );
rec( accepting := [ 1 .. 17 ], 
  alphabet := rec( format := "dense", names := [ _g1, _g2, _g3, _g4 ], 
      printingFormat := "dense", 
      printingStrings := [ "_g1", "_g2", "_g3", "_g4" ], size := 4, 
      type := "identifiers" ), 
  denseDTable := [ [ 2, 3, 4, 5 ], [ 0, 0, 6, 5 ], [ 0, 0, 6, 7 ], 
      [ 8, 9, 0, 0 ], [ 10, 11, 0, 0 ], [ 12, 9, 0, 0 ], [ 13, 12, 0, 0 ], 
      [ 0, 0, 0, 14 ], [ 0, 0, 6, 15 ], [ 0, 0, 12, 5 ], [ 0, 0, 16, 0 ], 
      [ 0, 0, 0, 0 ], [ 0, 0, 12, 7 ], [ 8, 11, 0, 0 ], [ 17, 0, 0, 0 ], 
      [ 12, 11, 0, 0 ], [ 0, 0, 12, 15 ] ], 
  flags := [ "BFS", "DFA", "accessible", "minimized", "trim" ], 
  initial := [ 1 ], isFSA := true, isInitializedFSA := true, 
  states := rec( size := 17, type := "simple" ), 
  table := rec( format := "dense deterministic", numTransitions := 31, 
      printingFormat := "dense deterministic", 
      transitions := [ [ 2, 3, 4, 5 ], [ 0, 0, 6, 5 ], [ 0, 0, 6, 7 ], 
          [ 8, 9, 0, 0 ], [ 10, 11, 0, 0 ], [ 12, 9, 0, 0 ], [ 13, 12, 0, 0 ],
          [ 0, 0, 0, 14 ], [ 0, 0, 6, 15 ], [ 0, 0, 12, 5 ], [ 0, 0, 16, 0 ], 
          [ 0, 0, 0, 0 ], [ 0, 0, 12, 7 ], [ 8, 11, 0, 0 ], [ 17, 0, 0, 0 ], 
          [ 12, 11, 0, 0 ], [ 0, 0, 12, 15 ] ] ) )

gap> SetAssertionLevel( previous_assertion_level );; 
gap> SetInfoLevel( InfoKnuthBendix, knuth_bendix_infolevel_saved );;  
gap> SetInfoLevel( InfoKan, kan_infolevel_saved );;  
gap> STOP_TEST( "kbtest.tst", 10000 );

##############################################################################
##
#E  kbtest.tst . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
