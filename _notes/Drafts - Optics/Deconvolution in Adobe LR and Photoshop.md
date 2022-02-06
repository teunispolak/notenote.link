From the 45038 topic

PhotoShop Smart Sharpen (More Accurate, Lens Blur kernel and Gaussian kernel)
CR6 and LR3 (Ramp up Detail slider; 100% is full deconvolution)

Eric Chan
Yes Photoshop's Smart Sharpen is based on deconvolution (but you will need to choose the "More Accurate" option and the Lens Blur kernel for best results). Same with Camera Raw 6 and Lightroom 3 if you ramp up the Detail slider.
https://forum.luminous-landscape.com/index.php?topic=45038.msg377910#msg377910

Hi Bart, unfortunately I don't know the answer to that, but I will check with the scientist who does. I believe they limit the number of iterations for speed, so I expect this is the reason it would not be as effective for some parameters as the plug-ins, as you've observed.

Hi Erik, yes, the Gaussian and Lens Blur are different PSFs. The Gaussian is basically just that, and the Lens Blur is effectively simulating a nearly circular aperture (assuming even light distribution within the aperture, very unlike Gaussian). You will get better results with the latter though in many cases they are admittedly subtle. The OLP filter can be somewhat complex to model. (I believe the Zeiss articles you've referenced recently have some nice images showing how gnarly they can be. I recall it was in the first of the two MTF articles). Gaussians are handy because they have convenient mathematical properties but not the best for modeling this, unfortunately ...
https://forum.luminous-landscape.com/index.php?topic=45038.msg377934#msg377934

Hi Deja, yes, the sharpening in CR 6 / LR 3 is a continuous blend of methods (with Detail slider being the one used to "tween" between the methods, and the Amount, Radius, & Masking used to control the parameters fed into the methods). As you ramp up the Detail slider to higher values, the deconvolution-based method gets more weight. If you're interested in only the deconv method then just set Detail to 100 (which is what I do for low-ISO high-detail landscape images). Not recommended for portraits, though ... 
https://forum.luminous-landscape.com/index.php?topic=45038.msg378027#msg378027

If one were to set the Detail to 100, would this carry through to the Sharpening slider when using the Adjustment Brush in ACR?  If so, that would go a long way toward selective application of the deconvolution method, possibly as good as painting it in from a layer mask.

Yes, Walter. It does means you can apply this type of sharpening / deblurring selectively, if you wish. There are two basic workflows for doing this in CR 6 and LR 3.

The first way is just to paint in the sharpening where you want it. To do this, you set the Radius and Detail the way you want, but set Amount to 0. Then, with the local adjustment brush, you paint in a positive Sharpness amount in the desired areas. The brush controls and the local Sharpness amount can be used to control the application of it. (Of course you can also use the erase mode in case you overpaint.) This workflow is effective if there are relatively small areas of the image you want to sharpen. I tend to use this for narrow DOF images (e.g., macro of flower) where I only care about very specific elements being sharpened. It also works fine for portraits.

The second way is the opposite, i.e., you apply the capture sharpening in the usual till most of the image looks good, but then you can selective "back off" on it (using local Sharpness with negative values) in some areas. Of course you can also add to it (using local Sharpness with positive values).