onfloor = place_meeting(x, y + 1, obj_Wall);

if (destroyed = 1)
{
	part_particles_create(ps, x, y, global.pt_PoisonSpurt, 20);
	instance_destroy();
}

if (destroyed = 0) image_angle = point_direction(x, y, x + hspeed, y + vspeed);

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

part_particles_create(ps, x, y, global.pt_Poison, 1);