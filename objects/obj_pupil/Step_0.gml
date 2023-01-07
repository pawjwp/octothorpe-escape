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

//Follow mouse
image_angle = point_direction(x,y,mouse_x,mouse_y);
if (obj_Character.charcontrol) leftdown = (mouse_check_button(mb_left));

//Delay fire
firetime = firetime - 1;

//Set color
if (weaponshift = 0)
{
	finaleyecolor = global.currentweaponcolor;
}
if (weaponshift = 1)
{
	finaleyecolor = merge_color(global.currentweaponcolor, $ffffff, 0.25);
}
if (weaponshift = -1)
{
	finaleyecolor = merge_color(global.currentweaponcolor, $000000, 0.25);
}
image_blend = finaleyecolor;

//Fireball
if (global.weapon = 1)
{
	if (leftdown) and (firetime < 0) and (ammo > 0) and (recharging = 0)
	{
		firetime = 8;
		ammo = ammo - 1;
		with (instance_create_layer(x, y,"Bullets", obj_blast))
		{
			speed = 10;
			direction = other.image_angle;
			image_angle = direction;
		}
	}
}

//Bouncer
if (global.weapon = 2)
{
	if (leftdown) and (firetime < 0) and (ammo > 0) and (recharging = 0)
	{
		firetime = 15;
		ammo = ammo - 1;
		with (instance_create_layer(x,y,"Bullets", obj_bouncer))
		{
			speed = 8;
			direction = other.image_angle;			
			image_angle = direction;
		}
	}
}

//Laser
if (global.weapon = 3)
{
	if (leftdown) and (ammo > 0) and (recharging = 0)
	{
		ammo = ammo - 10;
//		part_particles_create(ps, beam.x, beam.y, pt_flash, 1);
		length = 0;
		while !collision_point(beam.x + lengthdir_x(length, image_angle), beam.y + lengthdir_y(length, image_angle), obj_Wall, true, true)
		{
			if (length < 5000)
			{
				length += 1;
			} else break;
		}
		var target = scr_collision_line_first(x, y, x + lengthdir_x(5000, image_angle), y + lengthdir_y(5000, image_angle), obj_Enemy, false, true);
		if instance_exists(target)
		{
			var distance = point_distance(beam.x, beam.y, target.x, target.y);
			if !collision_line(x, y, x + lengthdir_x(distance, image_angle), y + lengthdir_y(distance, image_angle), obj_Wall, false, true)
			{
				length = distance;
				target.hp -= .1;
			}
		}
		beam.image_xscale = length;
		beam.image_yscale = random_range(.1, .5);
		beam.image_angle = image_angle;
//		part_particles_create(ps, beam.x + lengthdir_x(length, image_angle), beam.y + lengthdir_y(length, image_angle), pt_flash, 1)
	} else beam.image_xscale = 0;
}

//Poison
if (global.weapon = 4)
{
	if (leftdown) and (firetime < 0) and (ammo > 0) and (recharging = 0)
	{
		firetime = 15;
		ammo = ammo - 1;
		with (instance_create_layer(x,y,"Bullets", obj_poison))
		{
			speed = 8;
			direction = other.image_angle;
			image_angle = direction;
		}
	}
}

//Freeze
if (global.weapon = 5)
{
	if (leftdown) and (firetime < 0) and (ammo > 0) and (recharging = 0)
	{
		firetime = 8;
		ammo = ammo - 1;
		with (instance_create_layer(x,y,"Bullets", obj_freeze))
		{
			speed = 8;
			direction = other.image_angle;
			image_angle = direction;
		}
	}
}

//Attractor
if (global.weapon = 6)
{
	if (leftdown) and (firetime < 0) and (ammo > 0) and (recharging = 0)
	{
		firetime = 15;
		ammo = ammo - 1;
		with (instance_create_layer(x,y,"Bullets", obj_attractor))
		{
			speed = 5;
			direction = other.image_angle;
			image_angle = direction;
		}
	}
}

//Attractor
if (global.weapon = 7)
{
	if (leftdown) and (firetime < 0) and (ammo > 0) and (recharging = 0)
	{
		firetime = 8;
		ammo = ammo - 1;
		with (instance_create_layer(x,y,"Bullets", obj_deactivator))
		{
			speed = 8;
			direction = other.image_angle;
			image_angle = direction;
		}
	}
}

//Ammo recharging
if ((ammo/maxammo) <= .001) recharging = 1;
if ((ammo/maxammo) >= rechargepoint) recharging = 0;
if (recharging = 1)
{
	if (weaponshift = 0) weaponshift = 1;
	colorswaptime = colorswaptime - 1;
	if (colorswaptime <= 0)
	{
		colorswaptime = 20;
		weaponshift = -weaponshift;
	}
} else
{
	colorswaptime = 0;
	weaponshift = 0;
}
if (rechargetime <= 0)
{
	rechargetime = maxrechargetime;
	if ((ammo + 1) < maxammo) ammo = ammo + 1;
}
if (global.weapon != 0)
{
	if (!recharging) rechargetime = rechargetime - 1;
	if (recharging) rechargetime = rechargetime - 3;
}

if (global.debug) or (global.ammoenabled = 0) ammo = maxammo;