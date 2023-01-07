hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 5;
jumped = 0;
jumpcount = 1;
offedge = 0;
hp = 10;
maxhp = 10;
weaponcharge = 0;
homex = x;
homey = y;
charcontrol = 1;
dead = 0;
global.gravityx = 0;
global.gravityy = 1;
global.gravitydir = 0; //0 for vertical gravity and 1 for horizontal gravity
global.world = 0;

homeweapon = 0;
homepowerup = 0;
homegravityx = 0;
homegravityy = 1;
homegravitydir = 0;
//global.powerupobject[4] = obj_movement_enemyinvulnerability;

//Double-jumping
//if (onfloor)
//{
//	jumped = 0;
//}
//
//if (jumped = 0) and (key_jump) and (!onfloor) and (global.powerup = 2)
//{
//	jumped = 1;
//	vsp = -8;
//}
//Jumping
//if (onfloor) and (key_jump)
//{
//	vsp = -8;
//}