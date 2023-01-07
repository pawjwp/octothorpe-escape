draw_self();
if (freezetime >= 1)
{
	draw_sprite_ext(spr_enemydecayalt, image_index, x, y, image_xscale, 1, 0, $FFFF7F, freezetime/240);
}
if (poisontime >= 1)
{
	draw_sprite_ext(spr_enemydecayalt, image_index, x, y, image_xscale, 1, 0, $1FDF7F, abs((poisontime/180)-1));
}