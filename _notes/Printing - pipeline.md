---
title: Pipeline
season: summer
toc: false
category: printing
tags: printing
---


Apply inner or image dimensions excluding border, inner print format ratio

	Handpick
	    Raw file
	
	Edit to taste
		Phocus
		Darktable
		Photoshop - the tiff
	
	Soft proof with straight printer profile
	Edit soft proof copy on EIZO CG210 to taste: saturation, contrast
	
		Resample to 720 ppi and required image width or height, excluding border 
		Use ProPhotoRGB
		Output Sharpen for Print
		Add canvas if image not to be centered. Use image size, excluding border
		Export
		
			Calculate image gamut
			Prepare gamut chart (viewgamut)
			
				Apply printer profile, image gamut, and, if required, abstract profile
				
					Select papersize: borderless, thus creating white border if image smaller than paper
					
					Print; do not use options to fit to paper