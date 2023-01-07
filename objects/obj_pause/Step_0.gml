if (global.pause)
{
	instance_deactivate_object(obj_blast);
	instance_deactivate_object(obj_bouncer);
	instance_deactivate_object(obj_laserbeam);
	instance_deactivate_object(obj_poison);
	instance_deactivate_object(obj_freeze);
	instance_deactivate_object(obj_attractor);
}

if (!global.pause)
{
	instance_activate_object(obj_blast);
	instance_activate_object(obj_bouncer);
	instance_activate_object(obj_laserbeam);
	instance_activate_object(obj_poison);
	instance_activate_object(obj_freeze);
	instance_activate_object(obj_attractor);
	menu_action = -1;
	menu_control = false;
}


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
	if (keyboard_check_released(vk_enter)) or (keyboard_check_released(vk_space))
	{
		menu_action = menu_cursor;
		activator_pressed = 0;
	}
	if (keyboard_check_pressed(vk_enter)) or (keyboard_check_pressed(vk_space))	activator_pressed = 1;
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	var mouse_x_gui = device_mouse_x_to_gui(0)
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
		case 0: default: //Resume game
			global.pause = !global.pause;
			break;
		case 1: //Reset room
			global.pause = !global.pause;
			instance_destroy(obj_Charactercorpse);
			room_restart();
			break;
		case 2: //Toggle debug
			global.debug = !global.debug;
			menu_action = -1;
			break;
		case 3: //Toggle music
			global.music = !global.music;
			menu_action = -1;
			break;
		case 4: //Main menu
			room_goto(rm_menu);
			global.pause = 0;
			global.guistatus = 0;
			instance_change(obj_pause,true);
	}
}

if (global.debug = 1) menu[2] = "Debug: On"; else menu[2] = "Debug: Off";
if (global.music = 1) menu[3] = "Music: On"; else menu[3] = "Music: Off";