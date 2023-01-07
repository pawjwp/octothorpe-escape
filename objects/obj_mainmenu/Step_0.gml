if (menu_control)
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	if (keyboard_check_pressed(vk_down))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	if (keyboard_check_released(vk_enter))
	{
		menu_action = menu_cursor;
		activator_pressed = 0;
	}
	if (keyboard_check_pressed(vk_enter)) activator_pressed = 1;
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	var mouse_x_gui = device_mouse_x_to_gui(0);
	if (mouse_y_gui < menu_end_height) and (mouse_y_gui > menu_start_height) and (mouse_x_gui > 704) and (mouse_x_gui < 1216)
	{
		menu_cursor = (mouse_y_gui - menu_start_height) div (menu_distance);
		if (mouse_check_button_pressed(mb_left)) activator_pressed = 1;
		if (mouse_check_button_released(mb_left))
		{
			menu_action = menu_cursor;
		}
	}
}


if (mouse_check_button_released(mb_left))
	{
		activator_pressed = 0;
	}

if (menu_action != -1)
{
	switch (menu_action)
	{
		case 0: default: //New game
			room_goto(rm_1);
			global.pause = 0;
			global.guistatus = 1;
			instance_destroy();//No idea why this works
			exit;
		case 1: //Level Select
			break;
			menu_action = - 1;
		case 2: //Settings
			menu_action = - 1;
			break;
		case 3: //End game
			game_end();
	}
}

if (newwall = 0)
{
	newwall = instance_create_layer(x, y, "Barriers", obj_Wall)
	with (newwall)
	{
		image_xscale = ((1216 - 704)/(16*2));
		image_yscale = ((obj_mainmenu.menu_end_height - obj_mainmenu.menu_start_height)/(16*2));
		x = 704/2;
		y = (obj_mainmenu.menu_start_height/2) - image_yscale;
		visible = 0;
		charabove = 0;
	}
}

menu_end_height = (menu_start_height) + (menu_distance * menu_items)

image_yscale = ((obj_mainmenu.menu_end_height - obj_mainmenu.menu_start_height)/(16*2));
y = (obj_mainmenu.menu_start_height/2) - image_yscale;
newwall.y = (menu_start_height/2) - newwall.image_yscale;
if (newwall.charabove) and (newwall.spacebelow) menu_start_height = menu_start_height + (5/60);//set to 5/60