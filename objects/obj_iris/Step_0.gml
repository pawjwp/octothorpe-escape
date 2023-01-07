//If paused, stop
if (global.pause) exit;

//Move pupil to eye
if (global.gravitydir = 0)
{
	x = follow.x-(1 * global.gravityx);
	y = follow.y-(20 * global.gravityy);
}
if (global.gravitydir = 1)
{
	x = follow.x-(20 * global.gravityx);
	y = follow.y-(1 * global.gravityy);
}

//No powerup //Replace later with a global.currentpowerupcolor
if (global.powerup = 0)
{
image_blend = c_white;
}

//First powerup
if (global.powerup = 1)
{
	image_blend = $7FFF7F;
}

//Second powerup
if (global.powerup = 2)
{
	image_blend = $FFDF7F;
}

//Second powerup
if (global.powerup = 3)
{
	image_blend = $9F7F5F;
}