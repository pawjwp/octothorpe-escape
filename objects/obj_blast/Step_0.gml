if (global.world = 0) and (destroyed != 1) sprite_index = spr_blast;

if (fireballparticles)
{
	image_alpha = 0;
	//if (destroyed = 0) part_particles_create(); else part_particles_create();
}

if (destroyed = 1)
{
	sprite_index = spr_blastend;
	speed = 0;
}

if (destroyed = 0) image_angle = point_direction(x, y, x+hspeed, y+vspeed );

vspeed = vspeed + grv;

//Vertical collision
	//Normal
	if (place_meeting(x,y+vspeed,obj_Wall))
	{
		while (!place_meeting(x,y+sign(vspeed),obj_Wall))
		{
			y = y + sign(vspeed);
		}
			destroyed = 1;
	}

//Horizontal collision
	//Normal
	if (place_meeting(x+(hspeed),y,obj_Wall))
	{
		while (!place_meeting(x+sign(hspeed),y,obj_Wall))
		{
			x = x + sign(hspeed);
		}
			destroyed = 1;
	}