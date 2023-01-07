onfloor = place_meeting(x, y + 1, obj_Wall);

if (destroyed = 1)
{
	instance_destroy();
}

if (destroyed = 0) and !(speed > 0.01) image_angle = point_direction(x, y, x + hspeed, y + vspeed);

if (hspeed = 0) and (vspeed = 0) and (onfloor) destroyed = 1;

if ((vspeed * sign(vspeed)) < 0.31) and (onfloor) vspeed = 0;
if ((hspeed * sign(hspeed)) < 0.01) hspeed = 0;
if (onfloor) hspeed = hspeed * .98;

//Vertical collision
	//Normal
	if (place_meeting(x,y+vspeed,obj_Wall))
	{
		while (!place_meeting(x,y+sign(vspeed),obj_Wall))
		{
			y = y + sign(vspeed);
		}
		vspeed = vspeed - ((4/3) * vspeed);
		hspeed = hspeed - ((2/3) * hspeed);
	}

//Horizontal collision
	//Normal
	if (place_meeting(x+hspeed,y,obj_Wall))
	{
		while (!place_meeting(x+sign(hspeed),y,obj_Wall))
		{
			x = x + sign(hspeed);
		}
		vspeed = vspeed - ((2/3) * vspeed);
		hspeed = hspeed - ((4/3) * hspeed);
	}

if mouse_check_button(mb_right) destroyed = 1;

if (global.world = 0) sprite_index = spr_attractor0; else sprite_index = spr_attractor1;

if (speed > 0.01) speed = speed * 0.99; else speed = 0;

destroytimer = destroytimer - 1;

if (destroytimer <= 0) destroyed = 1;