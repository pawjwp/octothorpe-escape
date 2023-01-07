if (new = newmax)
{
	//bouncer
	bouncer.destroyed = 1;
	bouncer = instance_create_layer(x + bounceroffset + bouncerx, y + bouncery, "Bullets", obj_bouncer);
	bouncer.grv = 0;
	bounceroffset = bounceroffset + bouncerdir;
	if (bounceroffset >= 32) bouncerdir = -32;
	if (bounceroffset <= -32) 
	{
		bounceroffset = 32;
		//bouncerdir = 32;
	}
	//poison
	poison.destroyed = 1;
	poison = instance_create_layer(x + poisonoffset + poisonx, y + poisony, "Bullets", obj_poison);
	poison.grv = 0;
	poisonoffset = poisonoffset + poisondir;
	if (poisonoffset >= 32) poisondir = -32;
	if (poisonoffset <= -32) 
	{
		poisonoffset = 32;
		//poisondir = 32;
	}
	new = 0;
}

bouncer.destroyed = 0;
poison.destroyed = 0;
stillpoison.destroyed = 0;
stillpoisonoffset = stillpoisonoffset + stillpoisondir;
if (stillpoisonoffset >= 32) stillpoisondir = -.75;
if (stillpoisonoffset <= -32) stillpoisondir = .75;
if (stillpoisonoffset != 0) stillpoisonoffsetroot = sqrt(2 * (sqr(abs(stillpoisonoffset)))); else stillpoisonoffsetroot = 0;
stillpoison.x = x + stillpoisonx + stillpoisonoffset;
stillpoison.y = y + stillpoisony + stillpoisonoffset;
stillpoison2.x = x + stillpoisonx + stillpoisonoffset;
stillpoison2.y = y + stillpoisony - stillpoisonoffset;
stillpoison3.x = x + stillpoisonx - stillpoisonoffset;
stillpoison3.y = y + stillpoisony + stillpoisonoffset;
stillpoison4.x = x + stillpoisonx - stillpoisonoffset;
stillpoison4.y = y + stillpoisony - stillpoisonoffset;
stillpoison5.x = x + stillpoisonx + stillpoisonoffsetroot;
stillpoison5.y = y + stillpoisony;
stillpoison6.x = x + stillpoisonx - stillpoisonoffsetroot;
stillpoison6.y = y + stillpoisony;
stillpoison7.x = x + stillpoisonx;
stillpoison7.y = y + stillpoisony + stillpoisonoffsetroot;
stillpoison8.x = x + stillpoisonx;
stillpoison8.y = y + stillpoisony - stillpoisonoffsetroot;

new = new + 1;

if (teleporter.orb.fakeweaponcolor = $000000) teleporter.orb.fakeweaponcolor = $00ffff;
if (teleporter.orb.fakepowerupcolor = $000000) teleporter.orb.fakepowerupcolor = $ff0000;
if (color_get_hue(teleporter.orb.fakeweaponcolor) >= 255) teleporter.orb.fakeweaponcolor = make_color_hsv(0, 255, 255);
if (color_get_hue(teleporter.orb.fakepowerupcolor) >= 255) teleporter.orb.fakepowerupcolor = make_color_hsv(0, 255, 255);
teleporter.orb.fakeweaponcolor = make_color_hsv(color_get_hue(teleporter.orb.fakeweaponcolor) + .2, 255, 255);
teleporter.orb.fakepowerupcolor = make_color_hsv(color_get_hue(teleporter.orb.fakepowerupcolor) + .2, 255, 255);