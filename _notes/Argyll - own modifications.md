---
title: Argyll - Own modifications
season: summer
toc: false
tags: printing
---
Build directories

##### hargyllcms 1.9.2
Een Xcode omgeving om individule argyll tools te kunnen debuggen en te kunnen aanpassen
Oorspronkelijk jam omgeving omgezet naar make, als external build tool in xcode

Je kunt nu dus losse tools (colprof, hunteff, tiffgamut enz) debuggen, aanpassen en bouwen

Je kunt de losse tools ook vanuit Xcode uitvoeren om bijvoorbeeld een printer profile te bouwen met colprof. Het werkt maar het lijkt me beter die zaken te scheiden: debuggen, aanpassen, bouwen met xcode; daarna uitvoeren via Terminal


De directory is bepaald door External Build Tool Configuration in XCode van de hargyllcms-1.9.2 target, die is ````/Users/teunis/Repos/tpArgyll-1.9.2````
(In XCode helemaal linksboven tpArgyll-1.9.2. selecteren, dan Target, dan Info)


De directory staat niet in path, dus "which colprof" levert niks op

De manier om de zelfbouw Argyll tools aan te roepen is ````/Users/teunis/dev/bin/colprof````

NB: colprof verwijst dan naar de versie van de tool in ````/Users/teunis/Repos/tpArgyll-1.9.2/src/tools/.libs```` Dat is namelijk maar een doorgeefluik. Dat kun je zien aan de omvang van het bestand: ../bin/colprof is maar 7 KB, terwijl ../tools/.libs/colprof 43 KB groot is.

Er zijn drie libraries
1. De eerste is libargyll.la.  Daar gaan een heleboel source files in (zie lib/Makefile.am in source tree)
2. De tweede is libargyllicc.la. Zie /icc/Readme.txt en /icc/Makefile.am
3. Nummer drie is cgats. Zie /cgats/Readme.txt. Mij is dit nog niet helemaal duidelijk

De libraries worden door make (zie AC_DEFAULT_PREFIX in configure.ac) neergezet in ~/dev/lib. Het lijkt wel alsof de libraries alleen tijdens het linken van de Argyll tools worden gebruikt.










