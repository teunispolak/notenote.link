---
title: Argyll - vanilla install 1.9.2, 2.0.1
season: summer
toc: false
tags: develop
---
Installation directories

##### v1.9.2
Dan hebben we ook nog /opt/Argyll. Dat is versie 1.9.2. Het lijkt wel alsof die stand-alone is geïnstalleerd. In /opt/Argyll/bin zitten keurig alle Argyll tools. Datum voor alle files is 17 Oct 2016. 

Volgens de [installation instructions](http://argyllcms.com/doc/Installing_OSX.html) zou dit allemaal best eens kunnen kloppen:
- via Terminal kun je Argyll installeren waar je wil (dus bijv in /opt)
- alle tools komen dan in /opt/Argyll/bin
- en er worden geen libraries geïnstalleerd

##### v2.0.1
Met macPorts is v 2.0.1 geinstalleerd; alle tools zitten in opt/local/bin - typisch macPorts dus.

In ~/.profile wordt duidelijk dat de route via PATH naar alle macPorts is afgesneden ten faveure van homebrew. Alle /opt/local directories zijn uitgecommentarieerd. Of toch niet? ~/.bashrc is er niet helemaal duidelijk over maar het commando in .bashrc wel:

````
echo $PATH | tr ":" "\n" | nl

     1	/usr/local/bin
     2	/usr/bin
     3	/bin
     4	/usr/sbin
     5	/sbin
     6	/opt/X11/bin
````

Dus: colprof en alle andere Argyll tools kun je niet via path bereiken, dat kan alleen via een expliciet pad, waarmee je meteen de versie kiest

/opt/Argyll/bin  v 1.9.2
/opt/local/bin v 2.0.1









