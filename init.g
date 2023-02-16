#############################################################################
##
#W  init.g                    GAP package `kan'                 Chris Wensley
#W                                                            & Anne Heyworth

if not IsBound( PreImagesRepresentativeNC ) then 
    BindGlobal( "PreImagesRepresentativeNC", PreImagesRepresentative ); 
fi; 

##  read the function declarations

ReadPackage( "kan", "lib/dcrws.gd" ); 

