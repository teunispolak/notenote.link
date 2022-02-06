---
title: MacBook R groot onderhoud
season: summer
toc: false
category: IT
tags: IT
---
###### Wat te doen als een mid-2012 Apple MacBook Pro [[[MacBook Pro9.2 specs](https://everymac.com/systems/apple/macbook_pro/specs/macbook-pro-core-i5-2.5-13-mid-2012-unibody-usb3-specs.html) en [CPU benchmark](https://www.cpubenchmark.net/cpu.php?cpu=Intel+Core+i5-3210M+%40+2.50GHz&id=815)::rmn]]vooral strandballen laat zien?
 
  
#### Verwijderen
##### Google Chrome
Verwijderd. Daarmee is ook het risico verdwenen dat de automatische Google Update veel performance vraagt. Dat doet het namelijk, plus dat er om onduidelijke redenen een tweede update proces probeerde te starten (not responding).
##### Seagate

Niet nodig
##### AdwareMedic

Niet nodig

##### Norton AV en de rest

Wat een rommeltje was dat zeg. Uiteindelijk alles met [[RemoveSymantecMacFiles](https://knowledge.broadcom.com/external/article?legacyId=TECH103489)] kunnen verwijderen


#### Installeren
- CleanMyMac
- AppZapper [MAG WEER WEG]
- MacsFanControl
- EtreCheck

#### System Preferences aanpassen
##### FileVault

Encryptie uitgezet

##### Spotlight

- In Preference pane: "/" toegevoegd aan "private" om indexeren te voorkomen
- In Preference pane: alle vinkjes uitgezet
- Vervolgens mds en mdworker stilgezet:




```
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
Password:
/System/Library/LaunchDaemons/com.apple.metadata.mds.plist: Operation not permitted while System Integrity Protection is engaged
  
sudo mdutil
Usage: mdutil -pEsa -i (on|off) -d volume ...
mdutil -t {volume-path | deviceid} fileid
Utility to manage Spotlight indexes.
-p Publish metadata.
-i (on|off) Turn indexing on or off.
-d Disable Spotlight activity for volume (re-enable using -i on).
-E Erase and rebuild index.
-s Print indexing status.
-t Resolve files from file id with an optional volume path or device id.
-a Apply command to all volumes.
-V vol Apply command to all stores on the specified volume.
-v Display verbose information.
-r plugins Ask the server to reimport files for UTIs claimed by the listed plugin.
NOTE: Run as owner for network homes, otherwise run as root.

sudo mdutil -sa
/:
Indexing enabled.

sudo mdutil -a -d
/:
2021-12-31 08:03:34.586 mdutil[3498:224454] mdutil disabling Spotlight: / -> kMDConfigSearchLevelOff
Indexing and searching disabled.

sudo mdutil -sa -v
/:
Indexing and searching disabled.
```

##### AppStore

Auto update uitgezet, wel auto download. Laat updates eerst maar even rijpen, maak dan een backup, verwijder de externe schijf en voer dan de update of updates stap voor stap uit. 

PM: Bij image-copy: wacht een week na upgrade voordat je een nieuwe backup maakt; die overschrijft namelijk de vorige
  
##### Accessibility, onder Display

Reduce transparency uitgezet; berekenen van transparante weergave kost namelijk behoorlijk wat inspanning
Increased Contrast aangezet, maakt de weergave op het scherm duidelijker
Muis tierelantijnen uitgezet, kost performance

##### Sharing

File sharing aangezet, MOET WEER UIT

##### iCloud

Alles uitgezet, ook FindMyMac. Sign Out zou nog performance-verbetering kunnen geven. MOET WEER AAN 

##### Network

Via Advanced de twee ‘standaard’ Google servers toegevoegd

##### Extensions

Zo’n beetje alles uitgezet

##### Users & Groups

Login items: Mac Fans Control toegevoegd

##### Siri

Uitgezet

#### Error log onderzoeken: PowerChime
Meldingen in syslog onderdrukken: 
```
defaults write com.apple.PowerChime ChimeOnNoHardware -bool false; killall PowerChime
```

#### SMC en NVRAM resetten


#### Backup maken
Time Machine blijft hangen in “Preparing backup”. Laatste TM backup is van 3 okt, dus de files sindsdien moeten naar de externe schijf.
```
touch -t "202110030000" LastTimeMachineDate

find, rsync
find /Users/pietjepuk/./Desktop/ -newer LastTimeMachineDate \! -name ".*" -exec rsync -v -t -R {} '/Volumes/Seagate Backup Plus Drive/SindsOkt03/' \;
```

En omdat het kan, doen we ook een extra setje met álle user files: wel zo makkelijk om straks naar de volgende laptop over te zetten
```
find /Users/pietjepuk/./Desktop/ \! -name ".*" -exec rsync -v -t -R {} '/Volumes/Seagate Backup Plus Drive/GewoonAlles/' \;
```

Gewoon alles betekent: Desktop, Documents en Downloads.

GewoonAlles
rsync newer (skip tenzij nieuwer)
rsync: ook niet de .dmg
Helaas, pindakaas. Ergens halverwege eruit geknikkerd. Time-out op de verbinding veroorzaakt door een hang op de hard drive read?

Daarnaast: Library/mail, en mail preferences (zie [[IT - Apple Mail, backup, restore, export and migration]])
Mail: 68472 items, 12.63GB

Op externe schijf: 63170 items, 12.7 GB

O ja, en de enige hidden folder: .Belastingdienst



tooltje om TM backup te bekijken - waarom zo groot?

