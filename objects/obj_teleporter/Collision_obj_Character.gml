obj_teleporter.primary = 0;
if (activated = 0)
{
	if ((obj_pupil.ammo/obj_pupil.maxammo) <= 0.5) obj_pupil.ammo = round(obj_pupil.maxammo/2)
	instance_destroy(obj_Enemyremade);
}

activated = 1;
primary = 1;
other.homex = x;
other.homey = y;
if (orb.savedweapon = -1) orb.savedweapon = global.weapon;
if (orb.savedpowerup = -1) orb.savedpowerup = global.powerup;
if (orb.savedgravityx = -42) orb.savedgravityx = global.gravityx;
if (orb.savedgravityy = -42) orb.savedgravityy = global.gravityy;
if (orb.savedgravitydir = -42) orb.savedgravitydir = global.gravitydir;

if (primary = 1)
{
	other.homeweapon = orb.savedweapon;
	other.homepowerup = orb.savedpowerup;
	other.homegravityx = orb.savedgravityx;
	other.homegravityy = orb.savedgravityy;
	other.homegravitydir = orb.savedgravitydir;
}