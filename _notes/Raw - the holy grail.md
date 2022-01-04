---
title: Raw - the Holy Grail
season: summer
toc: false
category: printing
tags: printing
---



What's linear anyway?

Scene reflectances, recorded by sensor, "stored" in an input colorspace like sRGB, Adobe or ProPhotoRGB.

Something recorded by the sensor as having a reflectance of say 80% of the sensor's maximum number of levels will be stored as having a pixel value equal to 80% of 255 or 204. This is done for each RGGB channel individually; white balance is applied later on.

Simply speaking the linear tonecurve doesn't apply a tonecurve at all. All the linear tonecurve does is a one-on-one translation from the reflectance levels in the raw image to color channel values in for example ProPhotoRGB colorspace.



Lumariver / DCamprof

first: colorimetric, scene-referred

then: perceptual

linear tone curve

tone reproduction operator: neutral, TRO variant: neutral, base look: none  --> colorimetric all the way

neutral tone curve operator = perceptual zonder franje

neutral+ is perceptual met een kleine look. Dan krijg je in het profiel ook een LookTable

forwardmatrix is _the_ matrix

linear curve means matrix only

http://chromasoft.blogspot.com/2009/02/adobe-hue-twist.html

The final thing that's worth noting is that in the Canon EOS 5D Mark II profile, the twist is implemented as a "LookTable". _A LookTable is explicitly specified as something that is applied after exposure adjustments. But it would be possible to implement the same table as a HueSatDelta table, which is implemented before exposure adjustments_



DCamProf - a new camera profiling tool

p33

When mentioning RT (RawTherapee) where I'm also a contributor I've today pushed a patch that makes looktables be applied after exposure as they should. Before RT could not handle looktables properly. This means that if you get a build made July 6 or later you will get excellent control of DCamProf DNG profiles, in one and the same profile you can have a matrix-only profile, refined with a HusSatMap to a more accurate colorimetric result, and then a curve and looktable on top for the neutral tone operator, each element can be toggled directly inside RT depending on how you want to use the profile.

p34

Then there are two 2.5D HueSatMaps (StdA/D55) for further colorimetric correction


p38

[https://web.archive.org/web/20140107051347/http://www.cis.rit.edu/jwgu/research/camspec/camspec_database.txt](https://web.archive.org/web/20140107051347/http://www.cis.rit.edu/jwgu/research/camspec/camspec_database.txt)  
The original file is still alive in the previous location too, [http://www.cis.rit.edu/~dxl5849/projects/camspec/database.txt](http://www.cis.rit.edu/~dxl5849/projects/camspec/database.txt)  
All the projects by Dengyu Liu, including camspec database - scroll to the bottom - [http://www.cis.rit.edu/~dxl5849/projects/camspec/](http://www.cis.rit.edu/~dxl5849/projects/camspec/)

When you use "-t acr" you will embed a tone curve which will activate the neutral tone reproduction operator which tries to make a "perceptual" color appearance match, it's then no longer a colorimetric profile whose accuracy can be measured with standard methods.  
  
Without tone curve it should be colorimetric though, and it sounds strange that you've got different results from RT compared to Lr. The results should be the same. In earlier versions of DCamProf no linear curve was embedded per default which lead to that Lr added a default curve, destroying the colorimetric property. However, later version should add a linear curve per default, unless you disable it (or I have broken it, it was a while since I tested that aspect), and then you should get the same result as in say RT.  
  
You could check using dcp2json command if there is a linear curve in there, or simply look at Lr if it renders with a contrast curve or not when applying the profile.


---
  
For historical reasons RT always use its hard-coded color matrices for the white balance calculations, never the DCP color matrix (the RT white balance model needs some re-work, but noone's had time to do it yet). Adobe uses the DCP of course. Still if you use "as shot" you should see the same result in RT as in Lr, even if the stated color/temp is different, and this is the result I get. Have you tried "As Shot" white balance? Do you get the same result in RT as in Lr, as I do? If not you may have some other issue.  
  
Only when you have set a manual temp/tint Lr will use the color matrix "in reverse" to figure out the multipliers and then the color matrix will matter, that is a different color matrix will result in a different tint of the image.  
  
By using json2dcp/dcp2json and a text editor you can experiment with extracting the color matrix from Adobe's bundled profile and put that into the DCamProf profile. Then you should get the exact same white balance as the Adobe profile, but the color rendition is still completely DCamProf, as that is only affected by forward matrix and LUTs.  
  
Really old DCPs had only a color matrix (no forward matrix), and in that case the color matrix also affected the color rendition, but as soon as you have a forward matrix, the color matrix is only used for calculating white balance multpliers from temp/tint or calculating temp/tint from the raw-embedded as-shot multipliers.

---

**Choose a tone curve and exposure offsets**  
  
When we reproduce a scene on screen or on paper the luminance is typically lower which leads to that the eye experience the image as lower contrast, a bit dull even, this even if the (mid-tone) contrast is 100% accurate. This is a normal perceptual phenomenon and the solution is as old as photography: we apply an S-shaped contrast  
curve. In digital photography there's more compression of highlights than shadows as that suits the linear sensor behavior better, but the principle is the same. By compressing highlights and shadows we get increased midtone contrast so the whole image seems to have higher contrast, and we can get a better perceptual match with the original scene.  
  
A less known side effect of applying contrast is that the appearance of colors change. In human vision contrast and color appearance is tightly connected which means that if we want to retain the original color appearance when changing global contrast we must make some adjustments to the colors. Broadly speaking higher contrast requires higher saturation, and increased saturation is a natural side-effect of a basic RGB curve which is what's been traditionally used in digital photography. However an RGB curve will overdo saturation and it will also distort color so it's far from perfect, in fact there is still today no broadly used standard curve that is reasonably  
perceptually accurate. (It's actually not possible to make it 100% accurate, as that would require image-dependent local adjustments which a camera profile can't do.)  
  
DCamProf provides its own custom curve, a "neutral tone reproduction operator" to make it possible to embed a curve without distorting color appearance, and I think this is one of the more important features. Without that it doesn't matter how accurate we make our profile, as soon as we apply a curve in the raw converter the perceptual accuracy goes down the drain. And no, applying contrast in the Lab lightness channel or HSV value channel will not cut it (although it may work well for smaller adjustments or for creative effect). As I also contribute to the RawTherapee project, there's now actually a "perceptual" curve there which is based on DCamProf's  
neutral tone reproduction operator, so for RawTherapee you can provide a profile without a curve and instead apply it using the builtin curve adjustment, but as far as I know RawTherapee is unique in this aspect. For convenience you may still want to embed it in the profile though.  
  
For a longer more detailed discussion on how tone curves affect color, see [http://www.ludd.ltu.se/~torger/dcamprof.html#tone_curves](http://www.ludd.ltu.se/~torger/dcamprof.html#tone_curves) tone curve section in DCamProf's reference manual.  
  
Anyway, in order to make our profile fit for all-around photography we need to have an S-shaped tone curve to apply some contrast. So which shape to choose? With Adobe Camera Raw and the DNG reference code comes a standard curve which is used in many of Adobe's own profiles and it's also available as a built-in choice in DCamProf. It will provide a good result and if you don't have some special need I suggest using that (<tt>-t acr</tt> provided to make-dcp).  
  
The typical reason to want some other curve is to better match the look of in-camera JPEGs. This can indeed be important. With Adobe's curve the look may become significantly brighter or darker than the in-camera JPEG, and while it's okay if you will "expose to the right" (ETTR) manually anyway (common for planned photography shot from a tripod), the camera's auto exposure is of course tuned for the in-camera JPEG curve. That is to get good results without adjustments you need the curve to match what the camera expects.  
  
For DNG profiles there are actually three parameters for this, the curve itself, a baseline exposure offset and a black render tag. The DNG file itself can also contain a fixed baseline exposure which is added to the offset in the profile, at least if you're using Adobe's products. The exposure offsets and black render tag may or may not be  
supported by your favorite raw converter, so they may not be usable. The curve is generally supported though if the converter has a decent DNG profile support.  
  
The baseline exposure offset is sort of redundant as a curve can also include an exposure offset (it's just the average slope of it), but if the offset is large the curve gets an extreme shape which is hard to design so in that case it can be easier to separate them. The same can be said about the black render tag. That tag does not quantify an offset, it just tells the raw converter if it should make an automatic black subtraction (that is clip away darkest shadows if there is no detail there) or leave as is.

---
p50
---

To structure the thoughs a bit; here's the current challenges:  
  

-   DCamProf builds on the idea that you have an accurate colorimetric base profile, which you apply tone reproduction (tone curve) and gamut compression on top
-   Problem is that colorimetric base profile is only well-defined within the target range (typically CC24) and some distance outside that, for extreme saturation it's not well defined and will typically clip. You can recover clipped data when gamut compression is applied afterwards.
-   Some of the recent Sony sensor models like those in 645z and A7r-II have a high sensitivity blue which accentuates this effect
-   The obvious solution to pre-compress the gamut already in the colorimetric stage to avoid clipping is hard to make good looking, especially for the Sonys as you need to compress a lot in a short range, or do like Adobe and desaturate the whole profile (ie sacrifice color realism also in the normal range)
-   A related but different issue is that maybe accurate deep blues (well-represented by the deep blue CC24 patch) is not what people want, as better tonality is had if you lighten it. Currently DCamProf has no controls for this type of strong subjective adjustment already in the colorimetric stage, it may be a huge effort to implement support for this.
-   Clipping issues in the tone reproduction operator by pushing CIECAM02 too hard, but some of it may be solved by itself if some sort of pre-compression is made, so I've saved those issues to later

  
I'm not particular fond of the idea and do like Adobe, always prioritize robustness over nice colors as robustness is more commercially important for the mass market, so if the problem turns out "unsolvable", I'll clip "nicely" as a first stage (current 0.9.13 clips ugly sometimes with color shifts, sometimes to black), and in the longer term make it possible to make a desaturated profile particularly targeted at rendering extreme range colors without clipping. Interesting enough it's probably only certain cameras that are going to benefit from that, such as the Sonys, while I think my Canon and Hassy would be fine without as it doesn't have that kind of blue sensitivity.  
  
I'm perfectly aware of that artifacts in the extreme range will give me more "support tickets" than having less-than-excellent color in the broad normal range, as the first is easily seen (in scenes where it's triggered), the other is just a matter of taste, so I'm not surprised Adobe's profile is the way it is.

---

p57

DCP's allow for a layered approach, matrix that is as colorimetric as possible linearly, a huesatmap that corrects further, and then a curve+looktable that adds a look on top. That would give you the property you're after, and that was how DCamProf made its profiles, and you can still make it that way if you want to, but it turns out that you get clipping issues with extreme colors this way, most typically demonstrated with deep blues.

---

p58

The perceptual curve in RawTherapee is basically a copy of an older version of the DCamProf built-in tone reproduction operator. As it's an older version it does have some issues with clipping extreme colors, you can have very deep saturated blues turn magenta. At some point I'll update the perceptual curve in RT to come closer to the current DCamProf, but there's also a performance requirement when using it in RT so it's not feasible to bring over it unchanged, ie it's quite much work

---

p59

Actually the normal matrix-only profiles will make it worse, the reason is that a matrix profile is optimized for "normal colors", meaning that ultra-saturated colors like this are pushed way out into negative and positive clipping.  
  
You can however design a very low saturation matrix without any clipping, but the colors won't be that realistic. In fact if you open the file in RawTherapee, use the DCamProf profile and disable the LUTs (Base table and Look table checkboxes in RT) you have exactly that -- a low saturation no-clipping matrix.

---

p60

The "extreme value compression" works like this:  
  
The basis for the LUT is a linear matrix, but some of those values will be outside a valid gamut (negative Y etc), for cameras with high sensitive blue like many Sony cameras a significant range can be there. The LUT can't work well with invalid inputs, so there's a pre-compression done directly on the (white-balanced) raw RGB values. Saturation is reduced by using RGB-HSV desaturation until it fits in a valid gamut. To not hurt gradients the transition range is quite wide (it can be controlled using the new -k parameter to the make-profile command, but generally there's little reason to modify it) and the larger out-of-gamut range the camera has for a particular hue the larger transition range. RGB-HSV desaturation is chosen as it results in lighter colors, so instead of a more saturated color you get a lighter color and this way tonality is kept.  
  
This pre-compression of out-of-gamut matrix values is applied before the normal gamut compression (if activated). It can be disabled completely by "-k 0", but that's a bad idea(tm), unless you're making a reproduction profile and want to be 100% sure that the compression doesn't disturb colorimetric accuracy within the valid gamut.

---

p61

A comment about "hue twists" -- this is often presented as something bad and distorting, and if you want constant color appearance regardless of exposure you must remove them.  
  
This ignores the fact that general-purpose profiles have tone curves, and if you want constant color appearance, like DCamProf's neutral tone reproduction operator strives for, there's all sorts of non-linear tricks you need to do in the LookTable LUT to counteract the effects of the curve, which will show up as "hue twists". The LookTable is applied after exposure and the curve directly after that so they follow each-other, that is the LookTable corrections will always match the curve.  
  
That is "untwisting" a profile only makes sense if you intend to use the profile without tone curve. One use case for that would be to prepare files for HDR merging, but then it's better to merge in raw (like in my own Lumariver HDR), or if you don't have software for that use a pure matrix profile as even an untwisted LUT can have other nonlinearities left.  
  
Profiles like Adobe's own also add subjective elements to it, probably stuff like cooling down shadows and warming up highlights (a common adjustment) which is a "true" hue twist, but as long as it's in the LookTable and thus applied after exposure it makes sense.  
  
Another aspect is that if your profiler works with a different colorspace like say CIECAM02 JCh it will not perfectly match up with RGB-HSV, so you get some minor "hue twists" in the HSV space despite that the color is kept perceptually stable in the other space. DCamProf uses CIECAM02 quite extensively.


It would be the same problem to reverse DCamProf's profiles if all was put into the LookTable, however the DCP's DCamProf makes split them in two parts, colorimetric base (matrix + HSM) + tone reproduction on top (LookTable + Curve).

wo		fruit in rum
do 		poolish maken
vrij 	afmaken, afbakken