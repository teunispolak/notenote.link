Under the assumtion that the combination of anomalies (lens blur, defraction, AA Anti Aliasing filter or OLPF Optical LowPass Filter, motion blur) results in a Gaussian blur shape (the central limit theorem?), the following route can be taken to define and analyse the effect:

Slanted Edge --> Edge Spread Function --> Line Spread Function --> MTF

The combination of imperfections _convolutes_ the original signal;  _deconvolution_ is the process to rebuild the orignal signal.

Calculate Sigma from the Edge Spread Function

Sigma defines the Point Spread Function and sigma is used to calculate the deconvolution kernel. This kernel is a matrix which is used to restore the original signal.






Resolution, lens performance
A simple model for sharpness in digital cameras - strollswithmydog

Acutance, deconvolution