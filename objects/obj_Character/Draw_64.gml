if (global.guistatus != 0)
{
	if (global.livesenabled) draw_healthbar(32, 56, 256, 88, (100/maxhp) * hp, $3f3f3f, $ff0000, barcolor, 0, true, true);
	if (global.ammoenabled) if (global.weapon != 0) draw_healthbar(32, 104, 256, 136, (100/obj_pupil.maxammo) * obj_pupil.ammo, $1f1f1f, obj_pupil.finaleyecolor, obj_pupil.finaleyecolor, 0, true, true);
	draw_set_font(fnt_arial)
	draw_set_halign(fa_left)
	draw_set_valign(fa_center)
	draw_set_color(barcolor);
	if (global.livesenabled) draw_text_transformed(260, 72, string(hp) + " Lives Remaining", .25, .25, 0);
	draw_set_color(obj_pupil.finaleyecolor);
	if (global.ammoenabled) if (global.weapon = 3) weaponcharge = string(round((obj_pupil.ammo/obj_pupil.maxammo) * 100)) + "%";
	if (global.ammoenabled) if (global.weapon != 0) and (global.weapon != 3) weaponcharge = string(obj_pupil.ammo) + "/" + string(obj_pupil.maxammo);
	if (global.ammoenabled) if (global.weapon != 0) draw_text_transformed(260, 120, weaponcharge, .25, .25, 0);
}