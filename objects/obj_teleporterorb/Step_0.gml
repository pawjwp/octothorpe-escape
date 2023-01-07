/*part_particles_create(ps, x, y, pt_TeleporterEmit, 1);
if (sign(dir) = 1) part_type_gravity(pt_TeleporterEmit, .01, 270);
if (sign(dir) = -1)	part_type_gravity(pt_TeleporterEmit, .01, 90);
if (dir = 1) ygoal = maxy; else ygoal = miny
y = y - ((y - ygoal) * (0.025));
if ((ygoal - 2) < y) and (y < (ygoal + 2)) dir = -dir;*/

part_particles_create(ps, x, mainy, pt_TeleporterEmit, 1);
if (sign(dir) = 1) part_type_gravity(pt_TeleporterEmit, speed, 270);
if (sign(dir) = -1)	part_type_gravity(pt_TeleporterEmit, speed, 90);
if (dir = 1) ygoal = maxy; else ygoal = miny
mainy = mainy - ((mainy - ygoal) * (0.03));
if ((ygoal - 3) < mainy) and (mainy < (ygoal + 3)) dir = -dir;

if (fake = 0) if (savedpowerup != -1) part_type_color1(pt_TeleporterPowerup, global.powerupcolor[savedpowerup]);
if (fake = 1) if (savedpowerup != -1) part_type_color1(pt_TeleporterPowerup, fakepowerupcolor);
if (savedpowerup != -1) part_particles_create(ps, x + offset, righty, pt_TeleporterPowerup, 1);
if (dir = -1) rightygoal = maxy; else rightygoal = miny
righty = righty - ((righty - rightygoal) * (0.01));

if (fake = 0) if (savedweapon != -1) part_type_color1(pt_TeleporterWeapon, global.weaponcolor[savedweapon]);
if (fake = 1) if (savedweapon != -1) part_type_color1(pt_TeleporterWeapon, fakeweaponcolor);
if (savedweapon != -1) part_particles_create(ps, x - offset, lefty, pt_TeleporterWeapon, 1);
if (dir = -1) leftygoal = maxy; else leftygoal = miny
lefty = lefty - ((lefty - leftygoal) * (0.01));