##############################################################################
##
#W  dcrws.gd                     Kan Package                     Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2017, Chris Wensley and Anne Heyworth 
##
##  This file contains generic methods for double coset rewriting systems
##

#############################################################################
##
#V  InfoKan
##
DeclareInfoClass( "InfoKan" );

############################################################################# 
## 
#A  ConstructedFromFpGroup
## 
DeclareAttribute( "ConstructedFromFpGroup", IsFpMonoid );

#############################################################################
## 
#P  IsDoubleCosetRewritingSystem( <rws> )
#P  IsWordAcceptorOfDoubleCosetRws( <aut> ) 
## 
DeclareProperty( "IsDoubleCosetRewritingSystem", IsRewritingSystem );
DeclareProperty( "IsWordAcceptorOfDoubleCosetRws", IsAutomatonObj ); 

############################################################################# 
## 
#O  WordToString( <word>, <alph> )
#O  DisplayAsString( <word>, <alph> )
#A  OrderedAlphabet( <rws> )
#O  DisplayRwsRules( <rws> )
## 
DeclareOperation( "WordToString", [ IsWord, IsString ] );
DeclareOperation( "DisplayAsString", [ IsWord, IsString ] ); 
DeclareAttribute( "OrderedAlphabet", IsRewritingSystem );    
DeclareOperation( "DisplayRwsRules", [ IsRewritingSystem ] );    

############################################################################# 
## 
#A  InitialRewritingSystem
#A  CompleteRewritingSystem
#A  WordAcceptorOfReducedRws
## 
DeclareAttribute( "InitialRewritingSystem", IsFpGroup );
DeclareAttribute( "CompleteRewritingSystem", IsFpGroup );
DeclareAttribute( "WordAcceptorOfReducedRws", IsRewritingSystem );

############################################################################# 
## 
#O  DoubleCosetRewritingSystem
#O  PartialDoubleCosetRewritingSystem
#O  DCrules
#A  Hrules
#A  Krules
#A  HKrules
#A  InclusionInDoubleCosetMonoid 
#O  NextWord
#O  NextWords 
#O  IdentityDoubleCoset
## 
DeclareOperation( "DoubleCosetRewritingSystem", 
    [ IsGroup, IsGroup, IsGroup, IsRewritingSystem ] );    
DeclareOperation( "PartialDoubleCosetRewritingSystem", 
    [ IsGroup, IsGroup, IsGroup, IsRewritingSystem, IsInt ] );
DeclareOperation( "DCrules", [ IsDoubleCosetRewritingSystem ] );
DeclareAttribute( "Hrules", IsDoubleCosetRewritingSystem );
DeclareAttribute( "Krules", IsDoubleCosetRewritingSystem );
DeclareAttribute( "HKrules", IsDoubleCosetRewritingSystem );
DeclareAttribute( "InclusionInDoubleCosetMonoid",IsDoubleCosetRewritingSystem );
DeclareOperation( "NextWord", [ IsRewritingSystem, IsWord, IsPosInt ] );
DeclareOperation( "NextWords", 
    [ IsRewritingSystem, IsWord, IsPosInt, IsPosInt ] );
DeclareOperation( "IdentityDoubleCoset", [ IsDoubleCosetRewritingSystem ] );

############################################################################# 
## 
#A  WordAcceptorOfDoubleCosetRws( <dcrws> )                           
#O  WordAcceptorOfPartialDoubleCosetRws( <grp>, <prws> )
#O  WordAcceptorByKBMagOfDoubleCosetRws( <grp>, <pdcrws> )
#A  RewritingSystemOfWordAcceptor( <aut> )
## 
DeclareAttribute( "WordAcceptorOfDoubleCosetRws", 
    IsDoubleCosetRewritingSystem );
DeclareOperation( "WordAcceptorOfPartialDoubleCosetRws", 
    [ IsGroup, IsDoubleCosetRewritingSystem ] );
DeclareOperation( "WordAcceptorByKBMagOfDoubleCosetRws", 
    [ IsFpGroup, IsDoubleCosetRewritingSystem ] );
DeclareAttribute( "RewritingSystemOfWordAcceptor", IsAutomatonObj );

############################################################################# 
## 
#O  KBMagFSAtoAutomataDFA
#O  WordAcceptorByKBMag
#A  KBMagRewritingSystem
#A  KBMagWordAcceptor
## 
DeclareOperation( "KBMagFSAtoAutomataDFA", [ IsInternalRep, IsString ] );
DeclareOperation( "WordAcceptorByKBMag", [ IsFpGroup, IsString ] );
DeclareAttribute( "KBMagRewritingSystem", IsFpGroup );
DeclareAttribute( "KBMagWordAcceptor", IsFpGroup );

############################################################################# 
## 
#O  DoubleCosetsAutomaton
#O  RightCosetsAutomaton
## 
DeclareOperation( "DoubleCosetsAutomaton", [ IsFpGroup, IsGroup, IsGroup ] );
DeclareOperation( "RightCosetsAutomaton", [ IsFpGroup, IsGroup ] );

##############################################################################
## 
#E  dcrws.gd . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
## 
