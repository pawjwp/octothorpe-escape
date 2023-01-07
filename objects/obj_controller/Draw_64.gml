if (global.debug = 1)
{
	draw_set_font(fnt_arial);
	draw_set_color(c_white);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_text_transformed(1920 - 10, 0 + 10, "Debug on", 0.2, 0.2, 0);
	draw_text_transformed(1920 - 10, 0 + 40, "FPS: " + string(fps), 0.2, 0.2, 0);
	if (debugteleport = 1) draw_text_transformed(1920 - 10, 0 + 70, "Teleporter On", 0.2, 0.2, 0);
}