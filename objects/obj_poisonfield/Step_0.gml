if (shrink = 1)
{
	image_xscale = (image_xscale * .95);
	image_yscale = (image_yscale * .95);
	if (image_xscale <= .1) instance_destroy();
}