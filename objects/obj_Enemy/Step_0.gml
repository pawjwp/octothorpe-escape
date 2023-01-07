//If paused, stop
if (global.pause) or (disabled) exit;

if instance_exists(obj_attractor)
{
	follow = obj_attractor;
	followdistance = 896;
}
if (!instance_exists(obj_attractor)) and (obj_Character.hiding)
{
	follow = obj_Character;
	followdistance = 0;
}
if (!instance_exists(obj_attractor)) and !(obj_Character.hiding)
{
	follow = obj_Character;
	followdistance = 192;
}

switch (state)
{
	case e_state.idle:
	{
		hsp = 0;
		if (distance_to_object(follow) < followdistance) state = e_state.chase;
	}
	break;
	case e_state.chase:
	{
		if (abs(follow.x - x) > 2)
		{
			dir = sign(follow.x - x);
			hsp = dir * walksp;
		} else hsp = 0;
		if (stasis = 0) and (distance_to_object(follow) > (followdistance + 64)) state = e_state.idle;
		if ((abs(follow.x - x)) <= 5)
		{
			if (jumptimer > 6) or (jumptimer = 999) jumptimer = 6;
		}
		if (jumptimer <= 0)
		{
			if (onfloor) and (freezetime <= 5) vsp = vsp - 8;
			jumptimer = 999;
		}
		if (jumptimer != 999) jumptimer = jumptimer - 1;
	}
	break;
}

onfloor = place_meeting(x,y+1,obj_Wall)

//Calculate movement
vsp = vsp + grv;

#region //Collision
//Horizontal collision
for (var i = 0; i < array_length_1d(colobj); i ++)
{
	if (place_meeting(x+hsp,y,colobj[i]))
	{
		if (i != 1)
		{
			while (!place_meeting(x+sign(hsp),y,colobj[i])) //This causes freeze in very specific unknown conditions when colliding with other enemy objects
			{
				x = x + sign(hsp);
			}
		}
		hsp = 0;
		break;
	}
}

x = x + hsp

for (var i = 0; i < array_length_1d(colobj); i ++)
{
	if (place_meeting(x,y+vsp,colobj[i]))
	{
		if (i != 1)
		{
			while (!place_meeting(x,y+sign(vsp),colobj[i]))
			{
				y = y + sign(vsp);
			}
		}
		vsp = 0;
		break;
	}

}

y = y + vsp
#endregion

//Animation
if (!onfloor) 
{
	if (sign(vsp) > 0) 
	{
		if (global.world = 0) sprite_index = spr_enemy; else sprite_index = spr_enemy; //Change to falling sprite if needed
	}
	else
	{
		if (global.world = 0) sprite_index = spr_enemy; else sprite_index = spr_enemy; //Change to jumping sprite if needed
	}
}
else
{
	if (global.world = 0) sprite_index = spr_enemy; else sprite_index = spr_enemy;
}

if (hsp !=0) image_xscale = sign(hsp);


//Sprite speed
image_speed = abs(1.5*hsp) + 1;

//Effects
if (poisontime <= 0)
{
//	poisonfield.active = 0;
//	poisonfield.shrink = 1;
}
if (poisontime >= 0)
{
	poisontime = poisontime - 1;
}
if (poisontime >= 1)
{
//	poisonfield.active = 1;
	if (poisontime mod 1 = 0) //Set first number to 6 to perform operations 10 times per second
	{
		var xp = random_range(x - 12, x + 12);
		var yp = random_range(y - 32, y + 16);
		part_particles_create(ps, xp, yp, global.pt_Poisoned, 1);
		hp = hp - .025; //When above is mod 6 = 0, .035 does 1 health over 180 ticks
	}
//	with (obj_Enemy)
//	{
//		dist = point_distance(x,y,other.x,other.y);
//		if (dist <= 24)
//			{
//			other.poisontime = 300;
//			}
//	}
}

if (freezetime >= 0) freezetime = freezetime - 1;
walksp = 2 - (2 * freezetime / 240);

if (deactivated)
{
	deactivated = 0;
	newdeactivator = instance_create_layer(x, y, "Enemy", obj_enemy_activator);
	newdeactivator.activationtime = activationtime;
	newdeactivator.target = self;
	instance_deactivate_object(self);
}

if (place_meeting(x, y, obj_Character))
{
	shocktimer = 90;
}

if (healthbartimer > 0) healthbartimer = healthbartimer - 1;
if (damagetimer > 0) damagetimer = damagetimer - 1;
if (oldhp != hp) healthbartimer = 120;
if (oldhp != hp) damagetimer = 5;
oldhp = hp;

if (obj_Character.dead = 1)
{
	clone = instance_create_layer(x, y, "Enemy", obj_Enemyreset);
	disabled = 1;
	vsp = 0;
	hsp = 0;
	clone.image_angle = image_angle;
	clone.image_index = image_index;
	clone.sprite_index = sprite_index;
	clone.image_xscale = image_xscale;
	clone.image_yscale = image_yscale;
	clone.image_alpha = 0.5;
	image_alpha = 0;
	x = startx;
	y = starty;
	clone.xgoal = x;
	clone.ygoal = y;
	clone.original = self;
	hp = maxhp;
}
/*
poisonfield.x = x;
poisonfield.y = y;

if (poisonfield.active = 1)
{
	instance_activate_object(poisonfield);
}

if (poisonfield.active = 0)
{
	instance_deactivate_object(poisonfield);
}
*/
if (hp <= 0)
{
//	poisonfield.shrink = 1;
	instance_change(obj_Enemycorpse, true);
}// else poisonfield.shrink = 0;