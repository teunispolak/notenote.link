---
title: Luminance
season: summer
toc: false
tags: color
---
The Hunt effect

how to get the colorfulness of a brightly lit scene under subdued indoor lighting

Bright summer's day: illuminance is 50000 Lux

full lambertian reflection = 50000 / 3.14 = 15915 cd/m2

La = 15950 * 0.2 = 3185 cd/m2


Subdued indoor lighting = 32 / 3.14 * 0.2 = 2 cd/m2


```
From cam02.h
Typical adapting field luminances and white luminance in reflective setup:

E = illuminance in Lux
Lv = White luminance assuming 100% reflectance
La = Adapting field luminance in cd/m^2, assuming 20% reflectance from surround
    
   E     La     Lv   Condition 
   11     0.7    4   Twilight
   32     2     10   Subdued indoor lighting
   64     4     20   Less than typical office light; sometimes recommended for
                      display-only workplaces (sRGB)
  350    22    111   Typical Office (sRGB annex D)
  500    32    160   Practical print evaluationa (ISO-3664 P2)
 1000    64    318   Good Print evaluation (CIE 116-1995)
 1000    64    318   Television Studio lighting
 1000    64    318   Overcast Outdoors
 2000   127    637   Critical print evaluation (ISO-3664 P1)
10000   637   3183   Typical outdoors, full daylight 
50000  3185  15915   Bright summers day 
````
