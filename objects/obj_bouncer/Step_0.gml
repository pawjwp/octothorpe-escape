onfloor = place_meeting(x,y+3,obj_Wall);

if (destroyed = 1)
{
	speed = 0
	part_particles_create(ps, x, y, global.pt_Explosion, 30);
	part_particles_create(ps, x, y, global.pt_ShrapnelBit, 30);
	instance_destroy();
//	sprite_index = spr_bouncerend;
}

if (hspeed = 0) and (vspeed = 0) and (onfloor) destroyed = 1;

vspeed = vspeed + grv;

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
		vspeed = vspeed - (1.75 * vspeed);
		hspeed = hspeed - (0.25 * hspeed);
	}

//Horizontal collision
	//Normal
	if (place_meeting(x+hspeed,y,obj_Wall))
	{
		while (!place_meeting(x+sign(hspeed),y,obj_Wall))
		{
			x = x + sign(hspeed);
		}
		vspeed = vspeed - (0.25 * vspeed);
		hspeed = hspeed - (1.75 * hspeed);
	}

if mouse_check_button(mb_right) destroyed = 1;