# CHANGES to the Kan package

## ToDo: 

 * long-standing: see the ToDo list in section 3.2 in the manual 

## Version 1.37 for GAP 4.12.2 (23/01/24) 
 * (15/08/23) fixed varying output from DisplayRwsRules 
 * (16/02/23) now used PreImagesRepresentativeNC 

## Version 1.35 for GAP 4.12.2 (09/02/23) 
 * (23/12/22) changed email address; deleted location and institution 

## Version 1.34 for GAP 4.11.1 (13/03/22) 
 * (13/03/22) adjusted dcrws3.tst because of differences between 4r11 & dev

## Version 1.33 for GAP 4.11.1 (15/11/21) 
 * (15/11/21) move package homepage to https://github.com/cdwensley
 * (08/04/21) Switch CI to use GitHub Actions 

## Version 1.32 for GAP 4.11.0 (16/07/20) 
 * (16/07/20) fixed a problem in manual(2.2.1) reported by Daniel Longenecker  

## Version 1.31 for GAP 4.10.2 (14/10/19) 
 * (14/10/19) made kbmag a RequiredPackage rather than a Suggested one 
 * (14/10/19) restructured the tests 

## Version 1.29 for GAP 4.10.1 (29/05/19) 
 * (16/02/19) added License field in PackageInfo.g 

## 1.27 -> 1.28  (04/02/2018) 
 * (11/01/18) now using AutoDoc to build the manual 
 * (15/12/17) removed examples/; added expt/ and xtst/ 
 * (08/08/17) testall.g copied to testing.g; testall now calls TestDirectory
 * (03/07/17) README and CHANGES now in MarkDown format 
 * (08/06/17) (Partial)DoubleCosetRewritingSystem now takes two subgroups as 
              parameters 2,3, rather than their generating sets 
 * (01/06/17) NextWord now has max_number_of_attempts as third parameter and 
              now works for any rws; added operation NextWords 
 * (25/05/17) added attribute OrderedAlphabet for a rewriting system 
 * (23/05/17) added ReducedForm method for an fp-group and an element 
              added use of ReducedForm to the examples in the manual 

## 1.25 -> 1.27  (20/10/2016) 
 * (18/10/16) now using bibliography file `bib.xml` of type `bibxmlext.dtd`
 * (11/10/16) changed package releases to <https://gap-packages.github.io/kan> 

## 1.22 -> 1.25  (18/02/2016) 
 * (18/02/16) removed date/version information from file headers 
 * (16/02/16) attempted to correct new output error when printing accT 
 * (12/01/16) modified ENTITY names in `PackageInfo.g` 
 * (28/10/15) added MathJax to `makedocrel.g` 
 * (01/09/15) major edits to `README`, including GitHub issues link 

## 1.21 -> 1.22  (24/08/2015) 
 * (24/08/15) packed up version 1.22 prior to move from Bitbucket to Github 
 * (26/06/15) changed output of WordAcceptorOfReducedRws from nfa to mfa 
              fixing problem with the language langT given on p.5 of the manual 
              which has been outstanding for many years; 
              adjusted `test/example` files and added to page 8 of the manual

## 1.11 -> 1.21  (01/06/2015) 
 * (01/06/15) `PackageInfo.g` : Kan is now an accepted package  
 * (01/06/15) converted the bibliography to BibXMLext format 

## 1.07 -> 1.11  (10/12/2014) 
 * (10/12/14) moved package home page to <pages.bangor.ac.uk/~mas023/chda/kan/>
 * (10/12/14) started bitbucket repository for kan 

## 1.06 -> 1.07  (16/10/2013) 
 * (16/10/13) fix test files to reflect new printing of monoids
 * (05/02/13) rewrite of `testall.g` following Alex K's wedderga example 

## 1.05 -> 1.06  (07/01/2013) 
 * (07/01/13) edited test file output to agree with GAP 4.6 

## 1.04 -> 1.05  (23/04/2012) 
 * (23/04/12) replaced ReadTest by Test in testall.g 
 * (25/11/11) removed Anne's email address 
              now using package directory in the format `../kan-1.05/` 
              and archive files in the format  `kan-1.05.tar` 

## 1.03 -> 1.04  (21/11/2011) 
 * (21/11/11) forgotten why the edited version `kbsemi2.gi` of `kbsemi.gi` 
              was needed: deleted it, since it no longer seems necesssary. 

## 1.01 -> 1.03  (21/09/2011) 
 * (20/09/11) new version of `makedocrel.g` for building the manual 
 * (17/09/11) Shortened the banner. 
 * (16/09/11) Renamed subdirectory `kan/gap` as `kan/lib` 

## 0.99 -> 1.01  (25/08/2011) 
 * (16/08/11) changed directory for archive to `.../chda/gap4r5/kan/` 
 * (10/06/11) started version 1.01; moved Anne's files etc to folder extras. 

## 0.98 -> 0.99  (07/06/2011) 
 * (07/06/11) LoadPackage -> DirectoriesPackagePrograms in `read.g`
 * (06/06/11) Tidied up file headings and made version 0.99. 

## 0.97 -> 0.98  (06/05/2011) 
 * (06/05/11) the automaton in section 2.4.2 (Example 3) 
             now has 44 states, rather than the previous 40 (don't know why!)
 * (05/05/11) test files now  `fulltest.tst`  and  `parttest.tst`. 
 * (02/05/11) moved to gap4r5 pkg directory. 
 * (18/04/10) moved Kan development to IMac at home. 

## 0.96 -> 0.97  (18/11/2008)
 * (14/11/08) Automata.1.12 now available, so temporary fixes removed.

## 0.95 -> 0.96  (13/11/2008)
 * (12/11/08)  temporary fix: added edited version of functions 
  from the Automata package in files `automata.gd` and `automata.gi` 
 * added GNU General Public License declaration 
 * replaced AlphabetOfAutomaton with AlphabetOfAutomatonAsList 
  following changes in the Automata package. 

## 0.94 -> 0.95  (09/10/2007)
 * started this `CHANGES` file 
 * new address for Anne
 * fixed file permissions
 * added  `testall.g`  in directory `idrel/tst`
 * changed some  "L:=[1..n]; for i in L do ... od;"
            to  "for i in [1..n] do ... od;"

## 0.91 -> 0.94  (02/06/2006)
 * manual now prepared using the GAPDoc package, 
 * test file `kan/tst/kan_manual.tst` sets the AssertionLevel to 0 
  to avoid recursion in the Automata package, 
 * implementations of RightCosetsNC and DoubleCosetsNC 
  changed to RightCosetsAutomaton and DoubleCosetsAutomaton, 
 * separated KBMAG-calling methods from `dcrws.gi` to `dckbmag.gi`
  to suit users who do not have KBMAG available. 

# HISTORY up to version 0.91
 *  1998-99  GAP3 package started as part of Anne's thesis       
 * 27/04/05  started GAP4 code to compute examples for Bangor preprint 05.07
 * 01/07/05  made version 0.91 available on the Bangor CHDA website
