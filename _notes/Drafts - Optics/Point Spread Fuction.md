Point Spread Function

The Point Spread Function (PSF) is a mathematical function that describes the distortion in terms of the pathway a theoretical point source of light (or other waves) takes through the instrument.[3] Usually, such a point source contributes a small area of fuzziness to the final image. If this function can be determined, it is then a matter of computing its inverse or complementary function, and de-convolving the acquired image with that. 

In practice, finding the true PSF is impossible, and usually an approximation of it is used, theoretically calculated[4] or based on some experimental estimation. Real optics may also have different PSFs at different focal and spatial locations, and the PSF may be non-linear. The accuracy of the approximation of the PSF will dictate the final result. Different algorithms can be employed to give better results, at the price of being more computationally intensive. 

Zeiss document contains an example

How to estimate a PSF
In photography, the distortion of an image is the result of multiple factors: motion blur, defocus, diffraction, lens aberrations, antia-aliasing (AA) filter or Optical LowPass Filter (OLPF) - just to name a few. The individual distortions are not individually estimated and subsequently combined, but the PSF is estimated from the overall, end-to-end distortion, considering the optical system from lens to sensor image as a single source of distortion. As a consequence of this end-to-end distortion being caused by multiple smaller distortions, the end-to-end distortion is of a Gaussian nature.

The PSF is estimated from images of a so-called slanted edge (see [[Slanted Edge]]). The slanted edge is photographed from a tripod at various apertures and the images' diffusion pattern at the slanted edge is used to estimate the amount of distortion for each aperture individually.

As an alternative, het verhaal met die white noise en foto's op twee afstanden. This method however is not used widely (yet?).

en het verhaal op strollswithmydog over de Nikon D4?
http://www.strollswithmydog.com/what-radius-to-use-for-deconvolution-capture-sharpening/

op strollswithmydog staat ook een uitgebreid verhaal over  slanted edge
http://www.strollswithmydog.com/the-slanted-edge-method/

plus een praktijkvoorbeeld
https://www.strollswithmydog.com/how-to-get-mtf-curves-for-your-camera-and-lens/

slanted edges op dpreview voor Sony DSC RX100
https://www.dpreview.com/reviews/sony-cybershot-dsc-rx100/9



