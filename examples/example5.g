##############################################################################
##
#W  example5.g                   Kan Package                     Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2017, Chris Wensley and Anne Heyworth 
##

Print("\n==============================================================\n");
Print("2-generator example example5.g, <b^2,(ab)^2>, version 25/05/17\n");
Print("==============================================================\n\n");

SetInfoLevel( InfoKan, 1 );
SetInfoLevel( InfoKnuthBendix, 1 );

F := FreeGroup(2);;
rels := [ F.2^2, (F.1*F.2)^2 ];;
G5 := F/rels;;
genG5 := GeneratorsOfGroup( G5 );;
a := genG5[1];;  b := genG5[2];;
U := Subgroup( G5, [a^2] );;
V := Subgroup( G5, [b] );;
dc5 := DoubleCosetsAutomaton( G5, U, V );;
Print( dc5, "\n" );
rc5 := RightCosetsAutomaton( G5, V );;
Print( rc5, "\n" );

