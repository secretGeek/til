# Detect retina display or high DPI display and send specific image



	@media
	only screen and (-webkit-min-device-pixel-ratio: 2),
	only screen and (   min--moz-device-pixel-ratio: 2),
	only screen and (     -o-min-device-pixel-ratio: 2/1),
	only screen and (        min-device-pixel-ratio: 2),
	only screen and (                min-resolution: 192dpi),
	only screen and (                min-resolution: 2dppx) { 
		.hero {
				background:url("background@2x.png");
			}
	}

## Source

* [Stackoverflow: Retina display image resolution using media queries](https://stackoverflow.com/questions/37504520/retina-display-image-resolution-using-media-queries)