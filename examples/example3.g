##############################################################################
##
#W  example3.g                   Kan Package                     Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2017, Chris Wensley and Anne Heyworth 
##

SetInfoLevel( InfoKan, 1 );
SetInfoLevel( InfoKnuthBendix, 1 );

Print( "\n=============================================\n" );
Print( "2-generator example example3.g, trefoil group\n" );
Print( "=============================================\n\n" );

FT := FreeGroup( 2 );
relsT := [ FT.1^3*FT.2^-2 ];
T := FT/relsT;
genT := GeneratorsOfGroup( T );
U := Subgroup( T, [ genT[1] ] );  
V := Subgroup( T, [ genT[2] ] );
alphT := "cCdD";
ordT := [3,4,1,2];
orderT := "wreath";
rwsT := ReducedConfluentRewritingSystem( T, ordT, orderT, 0, alphT );
ord1 := OrderingOfRewritingSystem( rwsT );
ord2 := OrderingOnGenerators( ord1 );
Print( "rules for reduced rws for trefoil group with wreath order:\n" );
Print( "and ordering on the generators:- ", ord2, "\n" ); 
DisplayRwsRules( rwsT );
accT := WordAcceptorOfReducedRws( rwsT );
Print( "word acceptor for this rws:\n", accT, "\n" );
langT := FAtoRatExp( accT ); 
Print( "langT = ", langT, "\n\n" ); 
free := FreeMonoidOfRewritingSystem( rwsT );
mon := MonoidOfRewritingSystem( rwsT );
gens := GeneratorsOfMonoid( free ); 
oalphT := OrderedAlphabet( rwsT );
c := gens[1];  C := gens[2];  d := gens[3];  D := gens[4];
w := d^5*c^5; 
sw := WordToString( w, alphT ); 
Print( "        word  w = ", w, "     converts to string  sw = ", sw, "\n" ); 
rw := ReducedForm( rwsT, w );
srw := WordToString( rw, alphT ); 
Print( "reduced word rw = ", rw, "  converts to string srw = ", srw, "\n\n" ); 
Print( "accT recognises string sw ? ", 
       IsRecognizedByAutomaton( accT, sw ), "\n" );
Print( "accT recognises string srw ? ", 
        IsRecognizedByAutomaton( accT, srw ), "\n" );

## find a shorter expression for langT 
alph := AlphabetOfRatExpAsList( langT ); 
a1 := RatExpOnnLetters( alph, [ ], [1] );   ## d
a2 := RatExpOnnLetters( alph, [ ], [2] );   ## D
a3 := RatExpOnnLetters( alph, [ ], [3] );   ## c
a4 := RatExpOnnLetters( alph, [ ], [4] );   ## C
s1 := RatExpOnnLetters( alph, "star", a1 ); ## d*
s2 := RatExpOnnLetters( alph, "star", a2 ); ## D*
a1a3 := RatExpOnnLetters( alph, "product", [ a1, a3 ] );  ## dc 
u1 := RatExpOnnLetters( alph, "union", [ a1a3, a3 ] );    ## dcUc
a3a1 := RatExpOnnLetters( alph, "product", [ a3, a1 ] );  ## cd
u2 := RatExpOnnLetters( alph, "union", [ a3a1, a1 ] );    ## cdUd
u2a3 := RatExpOnnLetters( alph, "product", [ u2, a3 ] );  ## (cdUd)c
su2a3 := RatExpOnnLetters( alph, "star", u2a3 );          ## ((cdUd)c)*
u2s1 := RatExpOnnLetters( alph, "product", [ u2, s1 ] );  ## (cdUd)d*
a3s2 := RatExpOnnLetters( alph, "product", [ a3, s2 ] );  ## cD*
u3 := RatExpOnnLetters( alph, "union", [u2s1,a3s2,s2] ); 
prod := RatExpOnnLetters( alph, "product", [u1,su2a3,u3] );  
a1s1 := RatExpOnnLetters( alph, "product", [ a1, s1 ] );  ## dd*
r := RatExpOnnLetters( alph, "union", [ prod, a1s1, s2] );
Print( "expression r = ", r, "\n" ); 
Print( "LangT and r are equal languages? ", AreEqualLang(langT,r), "\n\n" ); 

## find a partial dcrws with a maximum of 20 rules
prwsT :=  PartialDoubleCosetRewritingSystem( T, U, V, rwsT, 20 );
Print("\nrules for partial double coset rws:\n" );
DisplayRwsRules( prwsT );

paccT := WordAcceptorOfPartialDoubleCosetRws( T, prwsT );
Print( "word acceptor for this partial double coset rws:\n", paccT, "\n" );

plangT := FAtoRatExp( paccT );
wordsT := [ "HK", "HcK", "HdK", "HDK", "HdcK", "HdccK", "HddH", "HdcDK"];
Print( "list of 8 words:\n", wordsT, "\n" );
validT := List( wordsT, w -> IsRecognizedByAutomaton( paccT, w ) );
Print( "these words are or are not recognized?\n", validT, "\n\n" );

pfree := FreeMonoidOfRewritingSystem( prwsT );
pmon := MonoidOfRewritingSystem( prwsT ); 
pgens := GeneratorsOfMonoid( pfree ); 
H := pgens[1];  K := pgens[2]; 
c := pgens[3];  C := pgens[4]; 
d := pgens[5];  D := pgens[6];
palphT := Concatenation( "HK", alphT ); 
pw := H*d^5*c^5*K;
rpw := ReducedForm( prwsT, pw ); 
Print( "double coset  " );
DisplayAsString( pw, palphT ); 
Print( "  reduces to  " ); 
DisplayAsString( rpw, palphT ); 
Print( "\n" );
spw := WordToString( rpw, palphT ); 
ok := IsRecognizedByAutomaton( paccT, spw ); 
