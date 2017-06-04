##############################################################################
##
#W  example1.g                   Kan Package                     Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2017, Chris Wensley and Anne Heyworth 
##

SetInfoLevel( InfoKan, 1 );
SetInfoLevel( InfoKnuthBendix, 1 );

Print( "\n===============================================================\n" );
Print( "oriented surface, genus 2 example: example1.g, version 23/05/17\n" );
Print( "===============================================================\n\n" );

F4 := FreeGroup( 4 );
rels := [ Comm(F4.1,F4.2) * Comm(F4.3,F4.4) ];;
H4 := F4/rels; 
L := [2,1,4,3,6,5,8,7];
order := "wreath";
alph4 := "aAbBcCdD";
rws4 := ReducedConfluentRewritingSystem( H4, L, order, 0, alph4 );;
Print( "rws4 has rules:\n" );
DisplayRwsRules( rws4 );

a := H4.1; b := H4.2; c := H4.3; d := H4.4;
x := b * Comm( c, d ); 
rx := ReducedForm( H4, x ); 
Print( x, " -> ", rx, "\n" );
