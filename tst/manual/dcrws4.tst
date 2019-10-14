##############################################################################
##
#W  dcrws4.tst                    Kan Package                    Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2019, Chris Wensley and Anne Heyworth 
#Y  School of Computer Science, Bangor University, U.K. 
##
gap> START_TEST( "Kan package: dcrws4.tst" );
gap> kan_infolevel_saved := InfoLevel( InfoKan );;
gap> SetInfoLevel( InfoKan, 0 );;
gap> knuth_bendix_infolevel_saved := InfoLevel( InfoKnuthBendix );; 
gap> SetInfoLevel( InfoKnuthBendix, 0 );;
gap> previous_assertion_level := AssertionLevel();; 
gap> ## setting AssertionLevel to 0 to avoid recursion in Automata
gap> SetAssertionLevel( 0 );; 

## Section 2.4 
##
gap> found := not ( Filename( KBMAG_FOR_KAN_PATH, "kbprog" ) = fail );; 
gap> F4 := FreeGroup("a","b");;
gap> rels4 := [ F4.1^3, F4.2^3, (F4.1*F4.2)^3 ];;
gap> G4 := F4/rels4;;
gap> alph4 := "AaBb";;
gap> if found then 
>      waG4 := WordAcceptorByKBMag( G4, alph4 );;
>      ## Print( waG4 ); ## output deleted
>      langG4 := FAtoRatExp( waG4 );;
>      ## Print( langG4, "\n" );  ## output deleted
>      limit := 100;;
>    fi;
gap> genG4 := GeneratorsOfGroup( G4 );;
gap> a := genG4[1];;  b := genG4[2];; 
gap> H4 := Subgroup( G4, [ a*b ] );;  
gap> K4 := Subgroup( G4, [ b*a ] );;
gap> if found then 
>      rwsG4 := KnuthBendixRewritingSystem( G4, "shortlex", [2,1,4,3], alph4 );;
>      dcrws4 := PartialDoubleCosetRewritingSystem( G4, H4, K4, rwsG4, limit );;
>      ok1 := ( Length( Rules( dcrws4 ) ) = 101 );; 
>      dcaut4 := WordAcceptorByKBMagOfDoubleCosetRws( G4, dcrws4 );;
>      ## Print( "Double Coset Minimalized automaton:\n", dcaut4 );
>      dclang4 := FAtoRatExp( dcaut4 );;
>      ## Print( "Double Coset language of acceptor:\n", dclang4, "\n" );
>      rules := DCrules( dcrws4 );;
>      alph4e := dcrws4!.alphabet;;
>      ## Print("H-rules:\n"); 
>      ##  DisplayAsString( Hrules(dcrws4), alph4e, true );;
>      ## H-rules:
>      ## [ HB, Ha ]
>      ## [ HaB, Hb ]
>      ## [ Hab, H ]
>      ## [ HbAB, HAba ]
>      ## [ HbAbAB, HAbAba ]
>      ## [ HbAbAbAB, HAbAbAba ]
>      ## [ HbAbAbAbAB, HAbAbAbAba ]
>      ## [ HbAbAbAbAbAB, HAbAbAbAbAba ]
>      ## [ HbAbAbAbAbAbAB, HAbAbAbAbAbAba ]
>      ## [ HbAbAbAbAbAbAbAB, HAbAbAbAbAbAbAba ]
>      ## Print(" K-rules:\n");  
>      ## DisplayAsString( Krules(dcrws4), alph4e, true );;
>      ## K-rules:
>      ## [ BK, aK ]
>      ## [ BaK, bK ]
>      ## [ baK, K ]
>      ## [ BAbK, abAK ]
>      ## [ BAbAbK, abAbAK ]
>      ## [ BAbAbAbK, abAbAbAK ]
>      ## [ BAbAbAbAbK, abAbAbAbAK ]
>      ## [ BAbAbAbAbAbK, abAbAbAbAbAK ]
>      ## [ BAbAbAbAbAbAbK, abAbAbAbAbAbAK ]
>      ## [ BAbAbAbAbAbAbAbK, abAbAbAbAbAbAbAK ]
>      ## Print("HK-rules:\n"); 
>      ## DisplayAsString( HKrules(dcrws4), alph4e, true );;
>      ## HK-rules:
>      ## [ HbK, HAK ]
>      ## [ HbAbK, HAbAK ]
>      ## [ HbAbAbK, HAbAbAK ]
>      ## [ HbAbAbAbK, HAbAbAbAK ]
>      ## [ HbAbAbAbAbK, HAbAbAbAbAK ]
>      ## [ HbAbAbAbAbAbK, HAbAbAbAbAbAK ]
>      ## [ HbAbAbAbAbAbAbK, HAbAbAbAbAbAbAK ]
>      mon4 := FreeMonoidOfRewritingSystem( dcrws4 );;
>      gens4 := GeneratorsOfMonoid( mon4 );; 
>      m1 := gens4[1];;  m2 := gens4[2];;  m3 := gens4[3];; 
>      m4 := gens4[4];;  m5 := gens4[5];;  m6 := gens4[6];; 
>      idc := IdentityDoubleCoset( dcrws4 );;
>      ok2 := ( idc = m1*m2 );; 
>      ## List of the next 29 normal forms for double cosets: 
>      L4 := NextWords( dcrws4, idc, 29, 50000 );;
>      ## DisplayAsString( L4, alph4e, true );   ## output deleted 
>      w := NextWord( dcrws4, L4[29] );;
>      ## Print( w, "\n" );
>      ok3 := ( w = m1*(m3*m6)^4*m3*m2 );;
>      s := WordToString( w, alph4e );;
>      ## Print( s, "\n" );
>      ok4 := ( s = "HAbAbAbAbAK" );; 
>      if not ( ok1 and ok2 and ok3 and ok4 ) then 
>          Error( "tests fail in dcrws4.tst" ); 
>      fi;
>    fi;

gap> SetAssertionLevel( previous_assertion_level );; 
gap> SetInfoLevel( InfoKnuthBendix, knuth_bendix_infolevel_saved );;  
gap> SetInfoLevel( InfoKan, kan_infolevel_saved );;  
gap> STOP_TEST( "dcrws4.tst", 10000 );

##############################################################################
##
#E  dcrws4.tst . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
