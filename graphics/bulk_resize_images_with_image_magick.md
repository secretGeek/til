# Bulk resize images with image magick

When I need to resize images, in bulk (or even one at a time) and I want them to stay sharp, i use ImageMagick

	> magick human_resource_machine.png -resize 200 -unsharp 0x6+0.5+0 human_resource_machine_200.png

This gives the file a width of 200 pixels, and a height in proportion to the current aspect ratio.

It also applies an `unsharp` filter, which sharpens the image (go figure!)	

ImageMagick is here (and is in my `path`)

	C:\Program Files\ImageMagick-7.0.7-Q16\magick.exe

# See also

* [Set path](../powershell/PATH.md)