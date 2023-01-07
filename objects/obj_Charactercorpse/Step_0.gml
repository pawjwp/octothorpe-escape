onfloor = place_meeting(x + global.gravityx, y + global.gravityy, obj_Wall);

if ((obj_Character.x - 1) < x) and (x < (obj_Character.x + 1)) x = obj_Character.x; else //if x is within 1 of the goal, set x to goal, otherwise, set x to add 10% of the distance to the goal
{
	x = x - ((x - obj_Character.x) * 0.1);
}

if ((obj_Character.y - 1) < y) and (y < (obj_Character.y + 1)) y = obj_Character.y; else
{
	y = y - ((y - obj_Character.y) * 0.1);
}

if (x = obj_Character.x) and (y = obj_Character.y)
{
	obj_camera.follow = obj_Character;
	obj_pupil.follow = obj_Character;
	obj_iris.follow = obj_Character;
	obj_Character.charcontrol = 1;
	obj_Character.image_alpha = 1;
	obj_Character.dead = 0;
	if (object_exists(obj_Enemyremade))
	{
		with (obj_Enemyremade) active = 1;
	}
	instance_destroy();
}

//((obj_Charactercorpse.x - obj_Character.x)^2) + ((obj_Charactercorpse.y - obj_Character.y)^2);

if (global.world = 0)
{
	if (sprite_index = spr_Character1) sprite_index = spr_Character0;
	if (sprite_index = spr_Character1_fall) sprite_index = spr_Character0_fall;
	if (sprite_index = spr_Character1_jump) sprite_index = spr_Character0_jump;
}
if (global.world = 1)
{
	if (sprite_index = spr_Character0) sprite_index = spr_Character1;
	if (sprite_index = spr_Character0_fall) sprite_index = spr_Character1_fall;
	if (sprite_index = spr_Character0_jump) sprite_index = spr_Character1_jump;
}

#region //Decrepit
/*
if (!onfloor) 
{
	if (sign(vsp) > 0) 
	{
		if (global.world = 0) sprite_index = spr_Character0_fall; else sprite_index = spr_Character1_fall;
	} else
	{
		if (global.world = 0) sprite_index = spr_Character0_jump; else sprite_index = spr_Character1_jump;
	}
} else
{
	if (global.world = 0)
	{
		sprite_index = spr_Character0;
	} else 
	{
		sprite_index = spr_Character1;
	}
}

//Collision
//Horizontal collision
	if (place_meeting(x+hsp,y,obj_Wall))
	{
		while (!place_meeting(x+sign(hsp),y,obj_Wall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}

x = x + hsp

//Vertical collision
	if (place_meeting(x,y+vsp,obj_Wall))
	{
		while (!place_meeting(x,y+sign(vsp),obj_Wall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}

y = y + vsp*/
#endregion