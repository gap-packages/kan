#############################################################################
##
#W  PackageInfo.g                 GAP 4 Package `kan'           Chris Wensley
#W                                                              Anne Heyworth

SetPackageInfo( rec(

PackageName := "kan",
Subtitle := "including double coset rewriting systems",
Version := "1.28",
Date := "04/02/2018",

Persons := [
  rec(
    LastName      := "Heyworth",
    FirstNames    := "Anne",
    IsAuthor      := true,
    IsMaintainer  := false, 
    Place         := "Open University" 
    ## Email         := "anne.heyworth@gmail.com" 
  ),
  rec(
    LastName      := "Wensley",
    FirstNames    := "Christopher D.",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "c.d.wensley@bangor.ac.uk",
    WWWHome       := "http://pages.bangor.ac.uk/~mas023/",
    PostalAddress := Concatenation( [
                       "Dr. C.D. Wensley\n",
                       "School of Computer Science\n",
                       "Bangor University\n",
                       "Dean Street\n",
                       "Bangor\n",
                       "Gwynedd LL57 1UT\n",
                       "UK"] ),
    Place         := "Bangor",
    Institution   := "Bangor University"
  )
],

Status := "accepted",
CommunicatedBy := "Leonard Soicher (QMUL)",
AcceptDate := "05/2015",

SourceRepository := rec( 
  Type := "git", 
  URL := "https://github.com/gap-packages/kan"
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://gap-packages.github.io/kan/",
README_URL      := Concatenation( ~.PackageWWWHome, "README.md" ),
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL, 
                                  "/releases/download/v", ~.Version, 
                                  "/", ~.PackageName, "-", ~.Version ), 
ArchiveFormats  := ".tar.gz",

AbstractHTML :=
 "The Kan package provides functions for the computation of normal forms \
  of representatives of double cosets of finitely presented groups.",

PackageDoc := rec(
  BookName  := "Kan",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Computing with Kan extensions" 
),

Dependencies := rec(
  GAP := ">=4.9.0",
  NeededOtherPackages := [ [ "automata", ">= 1.13" ], 
                           [ "GAPDoc", ">= 1.5.1" ] ],
  SuggestedOtherPackages := [ [ "kbmag", ">= 1.5.5" ] ],
  ExternalConditions := [ ]
),

AvailabilityTest := ReturnTrue,

Autoload := false, 

TestFile := "tst/testall.g",

Keywords := [ "Kan extension", 
              "double coset rewriting system", 
              "induced action" ],

BannerString := Concatenation( 
    "Loading Kan ", String( ~.Version ), " (computing with Kan extensions)\n", 
    "by Anne Heyworth and ", 
    "Chris Wensley (http://pages.bangor.ac.uk/~mas023/)\n", 
  "-----------------------------------------------------------------------\n" ),

AutoDoc := rec(
    TitlePage := rec(
        Copyright := Concatenation(
            "&copyright; 1996-2018 Anne Heyworth and Chris Wensley<P/>\n",
            "The &Kan; package is free software; you can redistribute it ", 
            "and/or modify it under the terms of the GNU General ", 
            "Public License as published by the Free Software Foundation; ", 
            "either version 2 of the License, or (at your option) ", 
            "any later version.\n"
            ), 
        Abstract := Concatenation( 
            "&Kan; is a &GAP; package originally implemented in 1996 ", 
            "using the &GAP; 3 language, to compute induced actions ", 
            "of categories, when the first author was studying ", 
            "for a Ph.D. in Bangor.\n", 
            "<P/>\n", 
            "This reduced version only provides functions for ", 
            "the computation of normal forms of representatives ", 
            "of double cosets of finitely presented groups.\n", 
            "<P/>\n", 
            "&Kan; became an accepted &GAP; package in May 2015.\n", 
            "<P/>\n",  
            "Bug reports, suggestions and comments are, of course, welcome.\n", 
            "Please contact the last author at ", 
            "<Email>c.d.wensley@bangor.ac.uk</Email> ", 
            "or submit an issue at the GitHub repository ",
            "<URL>https://github.com/gap-packages/kan/issues/</URL>.\n" 
            ), 
        Acknowledgements := Concatenation( 
            "This documentation was prepared with the ", 
            "&GAPDoc; <Cite Key='GAPDoc'/> ", 
            "and &AutoDoc; <Cite Key='AutoDoc'/> packages.<P/>\n", 
            "The procedure used to produce new releases uses the package ", 
            "<Package>GitHubPagesForGAP</Package> ", 
            "<Cite Key='GitHubPagesForGAP' /> ", 
            "and the package <Package>ReleaseTools</Package>.<P/>" 
            ),
    )
),

));
