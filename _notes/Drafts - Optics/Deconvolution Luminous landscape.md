Deconvolution sharpening revisited  (Read 248800 times)

Isn't it time to reconsider deconvolution? 
Last Edit: July 23, 2010, 08:47:51 am by bjanes  
https://forum.luminous-landscape.com/index.php?topic=45038.0

ImagesPlus
RawTherapee
Raw Developer
Focus Magic
PhotoShop Smart Sharpen (More Accurate, Lens Blur kernel and Gaussian kernel)
CR6 and LR3 (Ramp up Detail slider; 100% is full deconvolution)

For Adobe Photoshop and Lightroom, see [[Deconvolution in Adobe LR and Photoshop]]

Explanations



From the thread (post #4)
Suppose we are interested in undoing the effect of the AA filter.  The image coming through the lens is focused on the plane of the sensor, then the AA filter acts on the image in a manner similar to a Gaussian blur in Photoshop (though with a different blur profile).  The idea of deconvolution sharpening is that mathematically, if one knows the blur profile, one can reverse engineer to a reasonable approximation what the image was before it went through the AA filter.  The same idea works for many other kinds of image degrading phenomena, from misfocus to motion blur, to lens aberrations, etc.  The trick is that each different kind of blur has its own blur profile, ideally one would want to use the one specific to the image flaw one is trying to remove.  But practically that isn't possible, so typically one tries to use a generic blur profile and hope that that does a reasonably good job.  Another issue is that the method, like any sharpening method, can amplify noise, and generate haloes, and so one has to modify it to suppress noise enhancement and haloes.

For the more technically inclined, a more detailed explanation is that a good way to think about imaging components is in terms of spatial frequencies; for instance, MTF's are multiplicative -- for a fixed spatial frequency, the MTF of the entire optical chain is the product of the MTF's of the individual components.  So if the component doing the blurring has a blur profile B(f) for as a function of spatial frequency f, and the image has spatial frequency content I(f) at the point it reaches this component, then the image after passing through that component is I'(f)=I(f)*B(f).  Thus, if one knows the blur profile B(f), one can recover the unblurred image by dividing: I(f)=I'(f)/B(f).  The problem comes that B(f) can be small at high frequencies, since it is a low pass filter that is removing these frequencies from the image.  Dividing by a small number is inherently numerically unstable, and so choosing the wrong blur profile, or having a bit of noise in the image, all those inaccuracies get amplified by the method.  So in practice one includes a bit of damping at high frequency (quite similar to the 'radius' setting in USM) to keep the algorithm from going too far astray.

Edit: This multiplicative (in frequencies) aspect of the blur I'(f)=I(f)*B(f) is what is known as convolution, which is why the reverse process I(f)=I'(f)/B(f) is called deconvolution. 

Post #5 (BartvdWolf)
Basically it tries to invert the process of what caused the blurring of image detail, that's why they are also refered to as restoration algorithms. Blurring is about spreading some of the info of a single pixel over its neighbors, the deconvolution is about removing the blur component from neighboring pixels and adding it back to the original pixel. The blurring component is mathematically modeled as a convolution, hence the inverse is called deconvolution.

One of the difficulties is about how to discriminate between signal and noise. One preferrably sharpens the signal, not the noise.