global.world = 0;
global.debug = 0;
global.music = 1;
global.guistatus = 0; //0: gui off, 1: gui limited
global.finishedlevels = 0;
global.resetting = 0;
global.ammoenabled = 0;
global.livesenabled = 0;
debugteleport = 0;

enum e_state
{
	idle,
	patrol,
	chase
}

global.currentweaponcolor = $000000;

global.weaponobject[0] = 0;
global.weaponobject[1] = obj_weapon_fireball;
global.weaponobject[2] = obj_weapon_bouncer;
global.weaponobject[3] = obj_weapon_laser;
global.weaponobject[4] = obj_weapon_poison;
global.weaponobject[5] = obj_weapon_freeze;
global.weaponobject[6] = obj_weapon_attractor;
global.weaponobject[7] = obj_weapon_deactivator;

global.powerupobject[0] = 0;
global.powerupobject[1] = obj_movement_flight;
global.powerupobject[2] = obj_movement_doublejump;
global.powerupobject[3] = obj_movement_moonbounce;
global.powerupobject[4] = obj_movement_enemyinvulnerability;

global.weaponcolor[0] = $000000;
global.weaponcolor[1] = $007fff;
global.weaponcolor[2] = $7f7f7f;
global.weaponcolor[3] = $0000ff;
global.weaponcolor[4] = $00ff7f;
global.weaponcolor[5] = $ffff9f;
global.weaponcolor[6] = $bfff00;
global.weaponcolor[7] = $bf00ff;

global.powerupcolor[0] = $000000;
global.powerupcolor[1] = $00ff00;
global.powerupcolor[2] = $ffbf00;
global.powerupcolor[3] = $9f7f5f;
global.powerupcolor[4] = $3f3f7f;


#region //Particles
//Portal1
global.pt_Portal1 = part_type_create();
part_type_shape(global.pt_Portal1, pt_shape_pixel);
part_type_size(global.pt_Portal1, 1, 1, 0, 0);
part_type_scale(global.pt_Portal1, 1, 1);
part_type_orientation(global.pt_Portal1, 0, 360, 1, 0, 0);
part_type_color3(global.pt_Portal1, 65407, 16776960, 65407);
part_type_alpha1(global.pt_Portal1, 1);
part_type_blend(global.pt_Portal1, 0);
part_type_life(global.pt_Portal1, 0, 200);
part_type_speed(global.pt_Portal1, 0.05, 0.10, 0.01, 0);
part_type_direction(global.pt_Portal1, 0, 0, 4, 20);
part_type_gravity(global.pt_Portal1, 0, 0);

//Portal2
global.pt_Portal2 = part_type_create();
part_type_shape(global.pt_Portal2, pt_shape_pixel);
part_type_size(global.pt_Portal2, 1, 1, 0, 0);
part_type_scale(global.pt_Portal2, 1, 1);
part_type_orientation(global.pt_Portal2, 0, 360, 1, 0, 0);
part_type_color3(global.pt_Portal2, 65407, 16776960, 65407);
part_type_alpha1(global.pt_Portal2, 1);
part_type_blend(global.pt_Portal2, 0);
part_type_life(global.pt_Portal2, 0, 200);
part_type_speed(global.pt_Portal2, 0.05, 0.10, 0.01, 0);
part_type_direction(global.pt_Portal2, 120, 120, 4, 20);
part_type_gravity(global.pt_Portal2, 0, 0);

//Portal3
global.pt_Portal3 = part_type_create();
part_type_shape(global.pt_Portal3, pt_shape_pixel);
part_type_size(global.pt_Portal3, 1, 1, 0, 0);
part_type_scale(global.pt_Portal3, 1, 1);
part_type_orientation(global.pt_Portal3, 0, 360, 1, 0, 0);
part_type_color3(global.pt_Portal3, 65407, 16776960, 65407);
part_type_alpha1(global.pt_Portal3, 1);
part_type_blend(global.pt_Portal3, 0);
part_type_life(global.pt_Portal3, 0, 200);
part_type_speed(global.pt_Portal3, 0.05, 0.10, 0.01, 0);
part_type_direction(global.pt_Portal3, 240, 240, 4, 20);
part_type_gravity(global.pt_Portal3, 0, 0);

//Fire
global.pt_Explosion = part_type_create();
part_type_shape(global.pt_Explosion, pt_shape_pixel);
part_type_sprite(global.pt_Explosion, spr_explosion, 1, 1, 0);
part_type_size(global.pt_Explosion, 1, 1, 0, 0);
part_type_scale(global.pt_Explosion, 1, 1);
part_type_orientation(global.pt_Explosion, 0, 360, 0, 0, 0);
part_type_color1(global.pt_Explosion, 16777215);
part_type_alpha1(global.pt_Explosion, 1);
part_type_blend(global.pt_Explosion, 0);
part_type_life(global.pt_Explosion, 20, 30);
part_type_speed(global.pt_Explosion, 0.25, 0.5, 0, 0);
part_type_direction(global.pt_Explosion, 0, 360, 0, 0);
part_type_gravity(global.pt_Explosion, 0.01, 270);

//Shrapnel
global.pt_ShrapnelBit = part_type_create();
part_type_shape(global.pt_ShrapnelBit, pt_shape_pixel);
part_type_size(global.pt_ShrapnelBit, 1, 1, 0, 0);
part_type_scale(global.pt_ShrapnelBit, 1, 1);
part_type_orientation(global.pt_ShrapnelBit, 0, 360, 0, 0, 0);
part_type_color3(global.pt_ShrapnelBit, 986895, 2039583, 3092271);
part_type_alpha3(global.pt_ShrapnelBit, 1, 0.75, 0.5);
part_type_blend(global.pt_ShrapnelBit, 0);
part_type_life(global.pt_ShrapnelBit, 15, 20);
part_type_speed(global.pt_ShrapnelBit, 0.50, 1, 0, 0);
part_type_direction(global.pt_ShrapnelBit, 0, 360, 0, 0);
part_type_gravity(global.pt_ShrapnelBit, 0.01, 270);

//Poison
global.pt_Poison = part_type_create();
part_type_shape(global.pt_Poison, pt_shape_pixel);
part_type_sprite(global.pt_Poison, spr_poisoneffect, 1, 1, 0);
part_type_size(global.pt_Poison, 1, 1, 0, 0);
part_type_scale(global.pt_Poison, 1, 1);
part_type_orientation(global.pt_Poison, 0, 360, 0, 0, 0);
part_type_color1(global.pt_Poison, 16777215);
part_type_alpha1(global.pt_Poison, 1);
part_type_blend(global.pt_Poison, 0);
part_type_life(global.pt_Poison, 10, 20);
part_type_speed(global.pt_Poison, 0.1, 0.2, 0, 0);
part_type_direction(global.pt_Poison, 240, 300, 0, 0);
part_type_gravity(global.pt_Poison, 0.05, 270);

//PoisonSpurt
global.pt_PoisonSpurt = part_type_create();
part_type_shape(global.pt_PoisonSpurt, pt_shape_pixel);
part_type_sprite(global.pt_PoisonSpurt, spr_poisoneffect, 1, 1, 0);
part_type_size(global.pt_PoisonSpurt, 1, 1, 0, 0);
part_type_scale(global.pt_PoisonSpurt, 1, 1);
part_type_orientation(global.pt_PoisonSpurt, 0, 360, 0, 0, 0);
part_type_color1(global.pt_PoisonSpurt, 16777215);
part_type_alpha1(global.pt_PoisonSpurt, 1);
part_type_blend(global.pt_PoisonSpurt, 0);
part_type_life(global.pt_PoisonSpurt, 15, 25);
part_type_speed(global.pt_PoisonSpurt, 0.2, 0.5, 0, 0);
part_type_direction(global.pt_PoisonSpurt, 0, 360, 0, 0);
part_type_gravity(global.pt_PoisonSpurt, 0.01, 270);
#endregion