newmax = 10;
new = newmax;

bouncerx = 0;
bouncery = 16;
bounceroffset = 0;
bouncerdir = 32;
bouncer = instance_create_layer(x + bounceroffset + bouncerx, y + bouncery, "Bullets", obj_bouncer);

poisonx = 0;
poisony = -16;
poisonoffset = 0;
poisondir = 32;
poison = instance_create_layer(x + poisonoffset + poisonx, y + poisony, "Bullets", obj_poison);

stillpoisonx = 128;
stillpoisony = 0;
stillpoisondir = 1;
stillpoisonoffset = 0;
stillpoison = instance_create_layer(x + stillpoisonx, y + stillpoisony, "Bullets", obj_poison);
stillpoison2 = instance_create_layer(x + stillpoisonx, y + stillpoisony, "Bullets", obj_poison);
stillpoison3 = instance_create_layer(x + stillpoisonx, y + stillpoisony, "Bullets", obj_poison);
stillpoison4 = instance_create_layer(x + stillpoisonx, y + stillpoisony, "Bullets", obj_poison);
stillpoison5 = instance_create_layer(x + stillpoisonx, y + stillpoisony, "Bullets", obj_poison);
stillpoison6 = instance_create_layer(x + stillpoisonx, y + stillpoisony, "Bullets", obj_poison);
stillpoison7 = instance_create_layer(x + stillpoisonx, y + stillpoisony, "Bullets", obj_poison);
stillpoison8 = instance_create_layer(x + stillpoisonx, y + stillpoisony, "Bullets", obj_poison);
stillpoison.grv = 0;
stillpoison2.grv = 0;
stillpoison3.grv = 0;
stillpoison4.grv = 0;
stillpoison5.grv = 0;
stillpoison6.grv = 0;
stillpoison7.grv = 0;
stillpoison8.grv = 0;

teleporter = instance_create_layer(x - 96, y + 32, "Obstacles", obj_teleporter);
teleporter.image_xscale = 2;
teleporter.image_yscale = 2;
teleporter.orb.fake = 1;
teleporter.orb.offset = 32;
teleporter.orb.fakepowerupcolor = $000000;
teleporter.orb.fakeweaponcolor = $000000;

portal = instance_create_layer(x + 256, y, "Particles", obj_portal);