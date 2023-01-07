draw_set_color(c_black);
draw_set_font(fnt_arial);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

for (var i = 0; i < menu_items; i = i + 1)
{
	var text = menu[i];
	if (menu_cursor == i) var col = c_white; else col = c_gray;
	var yy = (menu_start_height) + (menu_distance * (i + 1)) - (menu_distance / 2);
	if (menu_cursor = i)
	{
		if (activator_pressed) draw_sprite(spr_button_pressed,0,960,yy); else draw_sprite(spr_button_hovered,0,960,yy); 
	} else draw_sprite(spr_button,0,960,yy);
	draw_text_transformed(960,yy,text,0.5,0.5,0);
}