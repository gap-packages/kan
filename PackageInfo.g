#############################################################################
##
#W  PackageInfo.g                 GAP 4 Package `kan'           Chris Wensley
#W                                                              Anne Heyworth

SetPackageInfo( rec(
Packagename := "kan",
PackageName := "kan",
Subtitle := "including double coset rewriting systems",

Version := "1.28",
Date := "04/06/2017",

##  duplicate these values for inclusion in the manual: 
##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY KANVERSION "1.28">
##  <!ENTITY KANTARFILENAME "kan-1.28.tar.gz">
##  <!ENTITY KANHTMLFILENAME "kan.html">
##  <!ENTITY KANRELEASEDATE "04/06/2017">
##  <!ENTITY KANLONGRELEASEDATE "4th June 2017">
##  <!ENTITY KANCOPYRIGHTYEARS "1996-2017">
##  <#/GAPDoc>

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
README_URL      := Concatenation( ~.PackageWWWHome, "README" ),
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
  GAP := ">=4.8.7",
  NeededOtherPackages := [ [ "automata", ">= 1.13" ], 
                           [ "GAPDoc", ">= 1.5.1" ]  ],
  SuggestedOtherPackages := [ [ "kbmag", ">= 1.5.4" ] ],
  ExternalConditions := [ ]
),

AvailabilityTest := ReturnTrue,

BannerString := Concatenation( 
    "Loading Kan ", String( ~.Version ), " (computing with Kan extensions)\n", 
    "by Anne Heyworth and ", 
    "Chris Wensley (http://pages.bangor.ac.uk/~mas023/)\n", 
  "-----------------------------------------------------------------------\n" ),

TestFile := "tst/testall.g",

Keywords := [ "Kan extension", 
              "double coset rewriting system", 
              "induced action" ]

));
