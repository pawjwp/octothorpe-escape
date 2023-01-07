dir = 1;
image_alpha = 0;
savedweapon = -1;
savedpowerup = -1;
savedgravityx = -42;
savedgravityy = -42;
savedgravitydir = -42;
fake = 0; //for particle demo
fakepowerupcolor = global.powerupcolor[0];
fakeweaponcolor = global.weaponcolor[0];
offset = 16;
ps = part_system_create();
part_system_layer(ps, "Barriers");

//TeleporterEmit
pt_TeleporterEmit = part_type_create();
part_type_shape(pt_TeleporterEmit, pt_shape_pixel);
part_type_sprite(pt_TeleporterEmit, spr_teleporteremit_off, 1, 1, 0);
part_type_color3(pt_TeleporterEmit, $ffffff, $ff7fbf, $ff007f);
part_type_blend(pt_TeleporterEmit, 1);
part_type_life(pt_TeleporterEmit, 40, 100);
part_type_speed(pt_TeleporterEmit, 0, 0.15, 0.005, 0);
part_type_direction(pt_TeleporterEmit, 0, 360, 0, 0); //set increase to 5 if removing gravity

//TeleporterEmit
pt_TeleporterPowerup = part_type_create();
part_type_shape(pt_TeleporterPowerup, pt_shape_pixel);
part_type_sprite(pt_TeleporterPowerup, spr_teleporteremit_small, 1, 1, 0);
part_type_color1(pt_TeleporterPowerup, $000000);
part_type_blend(pt_TeleporterPowerup, 1);
part_type_life(pt_TeleporterPowerup, 50, 100);
part_type_speed(pt_TeleporterPowerup, 0, 0.15, 0.0, 0);
part_type_direction(pt_TeleporterPowerup, 0, 360, 0, 0);

//TeleporterEmit
pt_TeleporterWeapon = part_type_create();
part_type_shape(pt_TeleporterWeapon, pt_shape_pixel);
part_type_sprite(pt_TeleporterWeapon, spr_teleporteremit_small, 1, 1, 0);
part_type_color1(pt_TeleporterWeapon, $000000);
part_type_blend(pt_TeleporterWeapon, 1);
part_type_life(pt_TeleporterWeapon, 50, 100);
part_type_speed(pt_TeleporterWeapon, 0, 0.15, 0.0, 0);
part_type_direction(pt_TeleporterWeapon, 0, 360, 0, 0);