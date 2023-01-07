hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 2;
offedge = 0;
hp = 3;
maxhp = 3;
poisontime = 0;
freezetime = 0;
dir = 1;
image_index = random_range(0, 15);
state = e_state.idle;
colobj[0] = obj_Wall;
colobj[1] = obj_Enemy;
colobj[2] = obj_teleporter;
follow = obj_Character;
activationtime = 0;
deactivated = 0;
oldhp = 3;
healthbartimer = 0;
damagetimer = 0;
shocktimer = 0;
startx = x;
starty = y;
disabled = 0;
jumptimer = 0;
stasis = 0;

//poisonfield = instance_create_layer(x,y,"Obstacles",obj_poisonfield);
//poisonfield.active = 0;

//NewEffect Particle System
ps = part_system_create();
part_system_layer(ps, "Particles");

//Poisoned
global.pt_Poisoned = part_type_create();
part_type_shape(global.pt_Poisoned, pt_shape_pixel);
part_type_sprite(global.pt_Poisoned, spr_poisoneffect, 1, 1, 0);
part_type_size(global.pt_Poisoned, 1, 1, -0.01, 0);
part_type_scale(global.pt_Poisoned, 1, 1);
part_type_orientation(global.pt_Poisoned, 0, 360, 0, 0, 0);
part_type_color1(global.pt_Poisoned, 16777215);
part_type_alpha3(global.pt_Poisoned, 1, 0.5, 0.25);
part_type_blend(global.pt_Poisoned, 0);
part_type_life(global.pt_Poisoned, 0, 100);
part_type_speed(global.pt_Poisoned, 0, 0, 0, 0);
part_type_direction(global.pt_Poisoned, 0, 360, 0, 0);
part_type_gravity(global.pt_Poisoned, 0.01, 90);

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