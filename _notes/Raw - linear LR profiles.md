---
title: Raw - Linear (flat) LR profiles
season: summer
toc: false
category: printing
tags: printing
---

In order to replace the default LR profile tone curve in LR or ACR, do the following

- use DCP Tool to convert .dcp to .xml. Adjust 
- the tone curve, 
- the profile name
- convert back to.dcp
- copy to USER Library/Application Support/Adobe/CameraRaw/CameraProfiles/Imported

Or start with a DNG file xported from Lr (rendered with Adobe Standard profile) and use the DNG editor to create and adjust the profile


dcpTool http://dcptool.sourceforge.net/Introduction.html

dpreview https://www.dpreview.com/forums/thread/4090036

tony kuyper https://tonykuyper.wordpress.com/2021/07/23/the-linear-profile-a-new-beginning-in-light-room-and-camera-raw/


PV2012, Adobe Neutral is supposed to have a linear curve but I don't see it listed in LR5 for Sony DSC RX100 .arw images

PV2010 flat curve: all sliders to 0, linear curve, Adobe Standard

All profiles below are based on Sony DSC-RX100 Adobe Standard.dcp
in folder /Library/Application Support/Adobe/CameraRaw/CameraProfiles/Adobe Standard

Adobe Standard, ACR default tonecurve (test)
Adobe Standard, linear tonecurve
Adobe Standard, linear tonecurve, baseline exposure offset +0.25
Adobe Standard, linear tonecurve, baseline exposure offset +0.50
Adobe Standard, linear tonecurve, baseline exposure offset +0.75
Adobe Standard, linear tonecurve, baseline exposure offset +1.00

Adobe Standard, untwisted, ACR default tonecurve (test)
Adobe Standard, untwisted, linear tonecurve
Adobe Standard, untwisted, linear tonecurve, baseline exposure offset +0.25
Adobe Standard, untwisted, linear tonecurve, baseline exposure offset +0.50
Adobe Standard, untwisted, linear tonecurve, baseline exposure offset +0.75
Adobe Standard, untwisted, linear tonecurve, baseline exposure offset +1.00

Notes
1.  "(test)" means: use this profile to verify that switching between the regular "Adobe Standard" and the tailormade "Adobe standard, ACR default tonecurve" profile doesn't affect the interpretation of the raw file. Only when nothing changes to colors and histogram, the profile and the tonecurve in the tailormade profile can be safely assumed to be correct.
2. The ACR default tonecurve is a 2015 point curve provided in the Adobe DNG SDK. See dng_tone_curve_acr3_default in dng_render.cpp
3. The Adobe Standard profile does not contain a tonecurve; the ACR default tonecurve is applied in LR or ACR automatically when a dcp profile doesn't specify the tonecurve
4. A linear tonecurve is applied to the image when a two point tone curve (0,0 and 1,1) has been included in the profile
5. "untwisted" is a result of dcpTool Untwist. An untwisted profile avoids hue changes (twists) when adjusting exposure during raw development
6. The BaselineExposure for a Sony DSC-RX-100 camera at 100 ISO is a whopping -1.0 EV. As a result the image is made 1 EV darker than the actual exposure in one of the first stages of the internal raw development pipeline. This is a so-called Adobe hidden setting. The setting is visible in the EXIF of a DNG. The Baseline Exposure Offset can be used to compensate



curve     untwisted     baseline corr     untwisted     exposure     L     a     b  
linear     0     