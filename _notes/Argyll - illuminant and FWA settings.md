---
title: Argyll - illuminant and FWA settings
season: summer
toc: false
category: printing
tags: printing
---
illuminant: the illuminant spectrum used to calculate the XYZ values from the .ti3 file patches. The patches are measured under M0 conditions (Illuminant A) and transformed to D50 values by the i1Pro.

```
--------------------------------------------------------------------
| Illumination | FWA compensation | Initial whitepoint, Lab | Case |
|--------------|------------------|-------------------------|------|
|      ""      |       ""         |  94.63   0.05   -3.91   |      |
|      ""      |       -f         |  94.69   0.19   -4.92   |      |
|			   |				  |							|      |
|    -iD50     |       ""         |  94.63   0.05   -3.91   |  a   |
|    -iD50     |       -f         |  94.69   0.19   -4.92   |  b   |
|    -iD50     |   -fM0 or -fA    |  94.63   0.05   -3.91   |  c   |
|    -iD50     |   -fM1 or -fD50  |  94.69   0.19   -4.92   |  d   |
|    -iD50     |  -fM2 or -fD50M2 |  94.55  -0.66   -1.38   |  e   |
|    -iD50     |    -fD50_0.0.sp  |  94.54  -0.71   -1.11   |  f   |
|    -iD50     |      -fD65       |  94.79   0.46   -6.50   |  g   |
|			   |				  |							|      |
|   -iD50M2    |       ""         |  94.63  -0.28   -3.17   |  a   |
|   -iD50M2    |       -f         |  94.55  -1.00   -0.63   |  b   |
|   -iD50M2    |  -fM0 or -fA     |  94.63  -0.28   -3.17   |  c   |
|   -iD50M2    |  -fM1 or -fD50   |  94.69  -0.15   -4.19   |  d   |
|   -iD50M2    |  -fM2 or -fD50M2 |  94.55  -1.00   -0.63   |  e   |
|   -iD50M2    |   -fD50_0.0.sp   |  94.54  -1.05   -0.34   |  f   |
|   -iD50M2    |     -fD65        |  94.79   0.13   -5.78   |  g   |
|			   |				  |							|      | 
| -iD50_0.0.sp |       ""         |  94.63  -1.76    0.18   |  a   |
| -iD50_0.0.sp |       -f         |  94.53  -2.52    3.06   |  b   |
| -iD50_0.0.sp |  -fM0 or -fA     |  94.63  -1.76    0.18   |  c   |
| -iD50_0.0.sp |  -fM1 or -fD50   |  94.69  -1.64   -0.8    |  d   |
| -iD50_0.0.sp |  -fM2 or -fD50M2 |  94.55  -2.44    2.71   |  e   |
| -iD50_0.0.sp |   -fD50_0.0.sp   |  94.53  -2.52    3.06   |  f   |
| -iD50_0.0.sp |     -fD65        |  94.79  -1.38   -2.47   |  g   |
|			   |				  |							|      |
|    -iD65     |       ""         |  94.68  -1.93  -22.60   |  a   |
|    -iD65     |       -f         |  94.87  -1.28  -25.40   |  b   |
|    -iD65     |  -fM0 or -fA     |  94.68  -1.93  -22.60   |  c   |
|    -iD65     |  -fM1 or -fD50   |  94.76  -1.71  -23.69   |  d   |
|    -iD65     |  -fM2 or -fD50M2 |  94.59  -2.96  -19.80   |  e   |
|    -iD65     |   -fD50_0.0.sp   |  94.57  -3.03  -19.50   |  f   |
|    -iD65     |     -fD65        |  94.87  -1.28  -25.40   |  g   |
--------------------------------------------------------------------

```

<br>

The above table can be summarized as follows:

```
---------------------------------------------------------------------
|		colprof arguments		  |  		equivalent to		    |
|---------------------------------|---------------------------------|
| Illumination | FWA compensation | Illumination | FWA compensation |
|--------------|------------------|--------------|------------------|
| 	   ""	   |		""        |    -iD50     |       -fA        |
|	   ""      |	 -f[illum]    |    -iD50     |    -f[illum]     |
| 	   "" 	   |		-f        |    -iD50	 |      -fD50       |
|			   |				  |			     |      			|
|   -i[illum]  |        ""	      |  -i[illum]   | 	     -fA        |
|   -i[illum]  |        -f        |  -i[illum]   |    -f[illum]     |
---------------------------------------------------------------------
```


5.  An i1Pro spectrophotometer gives M0 results. The instrument has an Illuminant A light source and the results are transformed to D50 before being reported
9.  Case d is always higher in blue than case c: Illuminant A contains less UV than D50
10. Case f is always slightly lower in blue than case e: Illuminant D50_0.0 contains slightly less UV than D50M2


colprof documentation

The **\-i** parameter allows specifying a standard or custom illumination spectrum, applied to spectral .ti3 data to compute PCS (Profile Connection Space) tristimulus values. **A**, **D50**, **D65**, **F5**, **F8**, **F10** are a selection of standard illuminant spectrums, with **D50** being the default. If a filename is specified instead, it will be assumed to be an Argyll specific [.sp](https://www.argyllcms.com/doc/File_Formats.html#.sp) custom spectrum file. This only works if spectral data is available. Illuminant details are:  
  
   	A   CIE tungsten filament lamp 2848K  
        D50 CIE daylight 5000K  
        D65 CIE daylight 6500K  
        F5  CIE Fluorescent 6350K, CRI 72  
        F8  CIE Fluorescent 5000K, CRI 95  
        F10 CIE Fluorescent 5000K, CRI 81  
  
Custom illuminants are most often used when a  viewing booth or other known viewing conditions is going to be used to view results. Other illuminant reference files could be created using a suitable measuring instrument such as a spectrolino, or an eyeone using [spotread](https://www.argyllcms.com/doc/spotread.html), although such instruments do not themselves provide the necessary response down to Ultra Violet that is needed for accurate operation of Fluorescent Whitening Agent compensation. The best way of measuring a custom illuminant is to use [illumread](https://www.argyllcms.com/doc/illumread.html), since it uses a special method to estimate the illuminant UV in a way that complements FWA compensation. (See the discussion above for the **\-f** flag).  
  
Note that if an illuminant other than D50 is chosen, the resulting ICC profile will not be standard, and may not work perfectly with other profiles that that use  the standard ICC D50 illuminant, particularly if the absolute rendering intent is used. Profiles should generally be linked with other profiles that have the same illuminant and observer.


The **\-f** flag enables Fluorescent Whitening Agent (FWA) compensation. This only works if spectral data is available and, the instrument is not UV filtered.  FWA compensation adjusts the spectral samples so that they appear to have been measured using an illuminant that has a different level of Ultra Violet to the one the instrument actually used in the measurement. There are two ways this can be used:  
  
**The first and most useful** is to use the **\-f** flag with the **\-i** illuminant parameter (i.e. "**\-f -i D50"**), to make the color values more accurately reflect their appearance under the viewing illuminant. This will work accurately if you specify the actual illuminant spectrum you are using to view the print, using the \-i flag. If you are doing proofing, you need to apply this to both your source profile, and your destination profile. Note that it is not sufficient to specify an illuminant with the same white point as the one you are using, you should specify the spectrum of the illuminant you are actually using for the proofing, including its Ultra Violet spectral content, otherwise FWA compensation won't work properly. This means you ideally need to measure your illuminant spectrum using an instrument that can measure down to 300nm. Such instruments are not easy to come by. The best alternative is to use the [illumread](https://www.argyllcms.com/doc/illumread.html) utility, which uses an indirect means of measuring an illuminant and estimating its UV content. Another alternative is to simply try different illuminant spectra in the ref directory, and see if one gives you the result you are after, although this will be fairly a tedious approach. The ref/D50\_X.X.sp set of illuminant spectra are the D50 spectrum with different levels of U.V. added or subtracted, ref/D50\_1.0.sp being the standard D50 illuminant, and may be somewhere to start.  
  
 \[Note: Generally using \-f with the standard (**\-i)** D50 illuminant spectrum will predict that the device will produce bluer output than the default of not FWA compensation. This is because most instruments use an incandescent illuminant (A type illuminant), which has lower relative levels of UV than D50, so the FWA compensation simulates the effect of the greater UV in the D50. 
 
 Also note that in an absolute colorimetric color transformation, the more a profile predicts the output device will have blue output, the yellower the result will be, as the overall color correction compensates for the blueness. The opposite will happen for an input profile.\]  
  
**The second way** of using the **\-f** flag is to provide it with a instrument simulation illuminant spectrum parameter, in addition to the default D50 or **\-i** parameter CIE XYZ  calculation illuminant (i.e. "**\-f M1"**, or "**\-f A -i D65"** etc.). This more complicated scenario simulates the measurement of the spectral reflectance of the samples under a particular instrument illuminant, then computes the CIE XYZ values of that reflectance spectrum under the default D50 or **\-i** parameter illuminant. This is not used to give a more accurate real world result, but to provide simulations of various standardized measurement conditions. For instance, to reproduce ISO 13655:2009 M2 measurement conditions, the **\-f D50M2** could be used (together with the default **\-i D50** setting). There are shortcuts provided for ISO 13655:2009 conditions:  
  
    **\-f M0**        equivalent to **-f A**  
    **\-f M1**        equivalent to **-f D50**  
    **\-f M2**        equivalent to **-f D50M2** 
	
Note that using \-f **M2** gives a result that is comparable to that of a U.V. cut filter instrument. See also the discussion [About Fluorescent Whitening Agent compensation](https://www.argyllcms.com/doc/FWA.html).