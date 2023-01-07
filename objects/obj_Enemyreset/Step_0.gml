if ((original.x - 1) < x) and (x < (original.x + 1)) x = original.x; else //if x is within 1 of the goal, set x to goal, otherwise, set x to add 10% of the distance to the goal
{
	x = x - ((x - original.x) * 0.1);
}

if ((original.y - 1) < y) and (y < (original.y + 1)) y = original.y; else
{
	y = y - ((y - original.y) * 0.1);
}

if (x = original.x) and (y = original.y)
{
	original.image_alpha = 1;
	original.disabled = 0;
	instance_destroy();
}