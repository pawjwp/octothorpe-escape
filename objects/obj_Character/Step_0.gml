//If paused, stop
if (global.pause) or (!charcontrol) exit;

//Recieve movement
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space) or keyboard_check(ord("W")) or keyboard_check(vk_up);
key_jump_pressed = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
key_jump_released = keyboard_check_released(vk_space) or keyboard_check_released(ord("W")) or keyboard_check_released(vk_up);
onfloor = place_meeting(x + global.gravityx, y + global.gravityy, obj_Wall);

//Calculate movement
var move = key_right - key_left;

if (global.gravitydir = 0) move = move * global.gravityy;
if (global.gravitydir = 1) move = move * -1;

if (global.gravitydir = 0)
{
	hsp = move * walksp * global.gravityy; //The global variable is inverted x and y
}
if (global.gravitydir = 1)
{
	vsp = move * walksp * global.gravityx; //The global variable is inverted x and y
}

vsp = vsp + (grv * global.gravityy);
hsp = hsp + (grv * global.gravityx);

//No gravity while jumping with powerup
if (global.powerup = 3)
{
	grv = 0.15;
} else if !(global.powerup = 1) grv = 0.3;

#region //Jumping
if (onfloor)
{
	jumped = 0;
	offedge = 0;
}

if !(global.powerup = 1)
{
	if (!onfloor) and (!key_jump_pressed) and (offedge = 0) offedge = 1;

	if (jumped < jumpcount) and (key_jump_pressed)
	{
		if (offedge = 1)
		{
			if (jumpcount > 1)
			{
				if (global.gravitydir = 0) vsp = -8 * global.gravityy;
				if (global.gravitydir = 1) hsp = -8 * global.gravityx;
				offedge = 1;
				jumped = jumped + 2;
			}
		} else
		{
			jumped = jumped + 1;
			if (global.gravitydir = 0) vsp = -8 * global.gravityy;
			if (global.gravitydir = 1) hsp = -8 * global.gravityx;
			offedge = 1;
		}
	}
} else
{
	if (key_jump)
	{
		if (global.gravitydir = 0) vsp = -5 * global.gravityy;
		if (global.gravitydir = 1) hsp = -5 * global.gravityx;
		grv = 0;
	}
	if (key_jump_released)
	{
		grv = 0.3;
	}
}
#endregion

if (global.powerup = 2) jumpcount = 2; else jumpcount = 1;

//if (global.powerup = 1) and (key_jump)
//{
//	if (onfloor) vsp = -8; else vsp = -5;
//}
//if (global.powerup = 1) and (key_space) and (!onfloor) and (vsp <= -5) vsp = vsp + 0.1;

#region //Collision
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
	
y = y + vsp

#endregion

#region //Animation
if (!onfloor) 
{
	if (sign(vsp) > 0) 
	{
		if (global.world = 0) sprite_index = spr_Character0_fall; else sprite_index = spr_Character1_fall;
	}
	else
	{
		if (global.world = 0) sprite_index = spr_Character0_jump; else sprite_index = spr_Character1_jump;
	}
}
else
{
	if (global.world = 0)
	{
		sprite_index = spr_Character0;
		barcolor = $003fff;
	} else 
	{
		sprite_index = spr_Character1;
		barcolor = $3f00ff;
	}
}


//Sprite speed
image_speed = (abs(hsp)/3)+.5;
image_angle = point_direction(x, y, x + global.gravityx, y + global.gravityy) + 90;
if (hsp !=0) and (global.gravityy != 0) image_xscale = sign(hsp) * global.gravityy;
if (vsp !=0) and (global.gravityx != 0)  image_xscale = sign(vsp) * global.gravityx * -1;
#endregion

#region //Powerup collision
if (place_meeting(x,y,obj_weapon_fireball))
{
	obj_pupil.maxrechargetime = 300;
	obj_pupil.rechargepoint = .1;
	var newammo = 100;
	if (global.weapon = 0) obj_pupil.ammo = ceil(newammo * (1/2)); else obj_pupil.ammo = ceil(newammo * (obj_pupil.ammo / obj_pupil.maxammo));
	obj_pupil.maxammo = newammo;
	global.weapon = 1;
}
if (place_meeting(x,y,obj_weapon_bouncer))
{
	obj_pupil.maxrechargetime = 450;
	obj_pupil.rechargepoint = .1;
	var newammo = 50;
	if (global.weapon = 0) obj_pupil.ammo = ceil(newammo * (1/2)); else obj_pupil.ammo = ceil(newammo * (obj_pupil.ammo / obj_pupil.maxammo));
	obj_pupil.maxammo = newammo;
	global.weapon = 2;
}
if (place_meeting(x,y,obj_weapon_laser))
{
	obj_pupil.maxrechargetime = 1;
	obj_pupil.rechargepoint = .25;
	var newammo = 3000;
	if (global.weapon = 0) obj_pupil.ammo = ceil(newammo * (1/2)); else obj_pupil.ammo = ceil(newammo * (obj_pupil.ammo / obj_pupil.maxammo));
	obj_pupil.maxammo = newammo;
	global.weapon = 3;
}
if (place_meeting(x,y,obj_weapon_poison))
{
	obj_pupil.maxrechargetime = 600;
	obj_pupil.rechargepoint = .1;
	var newammo = 30;
	if (global.weapon = 0) obj_pupil.ammo = ceil(newammo * (1/2)); else obj_pupil.ammo = ceil(newammo * (obj_pupil.ammo / obj_pupil.maxammo));
	obj_pupil.maxammo = newammo;
	global.weapon = 4;
}
if (place_meeting(x,y,obj_weapon_freeze))
{
	obj_pupil.maxrechargetime = 150;
	obj_pupil.rechargepoint = .1;
	var newammo = 100;
	if (global.weapon = 0) obj_pupil.ammo = ceil(newammo*  (1/2)); else obj_pupil.ammo = ceil(newammo * (obj_pupil.ammo / obj_pupil.maxammo));
	obj_pupil.maxammo = newammo;
	global.weapon = 5;
}
if (place_meeting(x,y,obj_weapon_attractor))
{
	obj_pupil.maxrechargetime = 600;
	obj_pupil.rechargepoint = .1;
	var newammo = 10;
	if (global.weapon = 0) obj_pupil.ammo = ceil(newammo * (1/2)); else obj_pupil.ammo = ceil(newammo * (obj_pupil.ammo / obj_pupil.maxammo));
	obj_pupil.maxammo = newammo;
	global.weapon = 6;
}
if (place_meeting(x,y,obj_weapon_deactivator))
{
	obj_pupil.maxrechargetime = 1800;
	obj_pupil.rechargepoint = .1;
	var newammo = 100;
	if (global.weapon = 0) obj_pupil.ammo = ceil(newammo * (1/2)); else obj_pupil.ammo = ceil(newammo * (obj_pupil.ammo / obj_pupil.maxammo));
	obj_pupil.maxammo = newammo;
	global.weapon = 7;
	obj_Character.charcontrol = 1;
}
if (place_meeting(x,y,obj_movement_flight))
{
	global.powerup = 1;
}
if (place_meeting(x,y,obj_movement_doublejump))
{
	global.powerup = 2;
}
if (place_meeting(x,y,obj_movement_moonbounce))
{
	global.powerup = 3;
}
if (place_meeting(x,y,obj_movement_gravity_down))
{
	global.gravityx = 0;
	global.gravityy = 1;
	global.gravitydir = 0; //0 for vertical gravity
}
if (place_meeting(x,y,obj_movement_gravity_up))
{
	global.gravityx = 0;
	global.gravityy = -1;
	global.gravitydir = 0; //0 for vertical gravity
}
if (place_meeting(x,y,obj_movement_gravity_left))
{
	global.gravityx = -1;
	global.gravityy = 0;
	global.gravitydir = 1; //1 for horizontal gravity
}
if (place_meeting(x,y,obj_movement_gravity_right))
{
	global.gravityx = 1;
	global.gravityy = 0;
	global.gravitydir = 1; //1 for horizontal gravity
}
#endregion
if (dead = 1)
{
	if (global.weapon != 0)
	{
		//instance_create_layer(x - (global.gravityx * 8), y - (global.gravityy * 8), "Powerups", global.weaponobject[global.weapon]);
		global.weapon = 0;
	}
	if (global.powerup != 0)
	{
		//instance_create_layer(x + (global.gravityx * 8), y + (global.gravityy * 8), "Powerups", global.powerupobject[global.powerup]);
		global.powerup = 0;
	}
	corpse = instance_create_layer(x, y, "Character", obj_Charactercorpse);
	obj_camera.follow = corpse;
	obj_pupil.follow = corpse;
	obj_iris.follow = corpse;
	charcontrol = 0;
	hp = hp - 1;
	vsp = 0;
	hsp = 0;
	corpse.image_angle = image_angle;
	corpse.image_index = image_index;
	corpse.sprite_index = sprite_index;
	corpse.image_xscale = image_xscale;
	corpse.image_yscale = image_yscale;
	corpse.image_alpha = 0.5;
	image_alpha = 0;
	if (instance_exists(obj_Enemyremade))
	{
		obj_Enemyremade.chardeathx = x;
		obj_Enemyremade.chardeathy = y;
	}
	x = homex;
	y = homey;
	corpse.xgoal = x;
	corpse.ygoal = y;
	global.weapon = homeweapon;
	global.powerup = homepowerup;
	global.gravityx = homegravityx;
	global.gravityy = homegravityy;
	global.gravitydir = homegravitydir;
	if ((obj_pupil.ammo/obj_pupil.maxammo) <= 0.5) obj_pupil.ammo = round(obj_pupil.maxammo/2)
}

if (hp <= 0)
{
	global.resetting = 1;
}

if (global.debug) hp = maxhp;

if (place_meeting(x, y, obj_teleporter)) hiding = 1; else hiding = 0;