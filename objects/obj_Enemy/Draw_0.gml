draw_self();
if (freezetime >= 1)
{
	draw_sprite_ext(spr_enemyalt, image_index, x, y, image_xscale, 1, 0, $FFFF7F, freezetime/240);
}
if (poisontime >= 1)
{
	draw_sprite_ext(spr_enemyalt, image_index, x, y, image_xscale, 1, 0, $1FDF7F, abs((hp/maxhp)-1));
}
if (healthbartimer > 0) or (position_meeting(mouse_x, mouse_y, self))
{
	draw_healthbar(x-24, y-36, x+24, y-40, (100/maxhp) * hp, $3f3f3f, obj_Character.barcolor, obj_Character.barcolor, 0, true, true);
}
if (damagetimer > 0) and (poisontime <= 0) and (freezetime <= 0)
{
	draw_sprite_ext(spr_enemyalt, image_index, x, y, image_xscale, 1, 0, $ffffff, 0.25);
}
if (!disabled)
{
	if (shocktimer > 0) and (poisontime <= 0) and (freezetime <= 0)
	{
		draw_sprite_ext(spr_enemylightning, image_index, x, y, image_xscale, 1, 0, $ffffff, 1);
	}
}
if (disabled)
{
	if (shocktimer > 0) and (poisontime <= 0) and (freezetime <= 0)
	{
		draw_sprite_ext(spr_enemylightning, image_index, clone.x, clone.y, image_xscale, 1, 0, $ffffff, 1);
	}	
}