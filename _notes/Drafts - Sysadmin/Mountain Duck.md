
Hoe werkt het mounten van de "disk" in de Finder Sidebar
De app en de FinderSync extension
app bevat /plugin/Mountain Duck Finder Extension.appex




Eerst wordt de disk vanuit /Users/teunis/Library/Group Containers/G69SCX94XU.duck/Library/Application Support/duck/Volumes in de sidebar geladen.
Vervolgens wordt de Findersync extension geladen en verandert het logo in die achtelijke eend (ehh... kutduck?). Als je in System Preferences/Extensions/Finder extensions de extension disabelt, dan zie je het voor je ogen gebeuren.

[Apple Developer](https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/Finder.html#//apple_ref/doc/uid/TP40014214-CH15-SW1) heeft het in de App Extension Programming Guide allemaal netjes uitgelegen. Maar helaas, zo werkt Mountain Duck niet, of ik heb het niet goed opgevolgd. 


Pas de icons aan
- Kopieer de application.icns file uit de app naar een aparte folder
- Converteer in die folder de .icns file naar een een iconset folder: 
	- iconutil -iconset application.icns
- cp application.iconset application_new.iconset
- Vervang de Finder icons in application_new.iconset door iets fatsoenlijks, bijvoorbeeld SidebarExternalDisk.icns,  SidebariDisk.icns of SidebariCloud.icns. Die staan in  /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources, de folder met alle Mojave [icons](https://archive.org/details/macosx10.14-iconfiles)
- Maak dan een nieuwe application.icns: iconutil -icns application_new.iconset



Stop de app en de extension
- In Activity Monitor zie je een entry voor de app en een voor de extension. De app verdwijnt wanneer je de app stopt; dan blijft de extension nog gewoon geladen. Verwijder die met Force Quit uit het lijstje


Verwijder de extension
- Disable Mountain Duck Finder Integration in System Preferences/Extensions/Finder extensions
- pluginkit -r "/Applications/Mountain Duck.app/Contents/PlugIns/Mountain Duck Finder Integration.appex"
- pluginkit -m -v | grep gration   om te controleren
- In System Preferences/Extensions/Finder extensions zou de extension nu niet zichtbaar meer moeten zijn

Vervang de icons
- Rename .../Resources/application.icns in application_orig.icns
- Kopieer de aangepaste .icns file als application.icns
- Vervang de extension .../Resources/app-idle.tiff door een gewijzigde versie als je ook het icon in de Finder menu toolbar wilt aanpassen 
- Als je het icon in de macOS toolbar wil aanpassen, moet je in de app Resources folder de app-idle en app-pause tiff files vervangen
- Sluit System Preferences en alle Finders; run ~/clear-icon-cache.sh
- Start desnoods in safe mode, dat wil zeggen SHIFT indrukken bij restart tot logo weer verschijnt, en dan veel geduld hebben



