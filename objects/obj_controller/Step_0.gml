//Control
if keyboard_check_pressed(vk_lalt)
{
	if (global.debug = 0) global.debug = 1; else global.debug = 0
}

if keyboard_check(ord("T")) and (!global.pause)
{
	global.weapon=0;
}

if keyboard_check_pressed(ord("E")) and (!global.pause)
{
	if (global.world = 0) global.world = 1; else global.world = 0
}

if keyboard_check_released(ord("R")) and (global.debug)
{
	global.resetting = 1;
}

if keyboard_check_released(vk_pagedown) or (keyboard_check_released(ord("["))) and (global.debug) and room_previous(room) != -1
{
	if (room_exists(room_previous(room))) room_goto_previous();
}

if keyboard_check_released(vk_pageup) or (keyboard_check_released(ord("]"))) and (global.debug) and room_next(room) != -1
{
	if (room_exists(room_next(room))) room_goto_next();
}

if keyboard_check_pressed(vk_add) and (global.debug=1)
{
	if keyboard_check(vk_control) or keyboard_check(vk_rcontrol) or keyboard_check(vk_lcontrol)
	{
		obj_camera.zoomfactor = obj_camera.zoomfactor / 2;
	} else
	{
		if (obj_camera.zoomfactor <= 1)
		{
			obj_camera.zoomfactor = obj_camera.zoomfactor / 2;
		} else obj_camera.zoomfactor = obj_camera.zoomfactor - 1;
	}
}

if keyboard_check_pressed(vk_subtract) and (global.debug=1)
{
	if keyboard_check(vk_control) or keyboard_check(vk_rcontrol) or keyboard_check(vk_lcontrol)
	{
		obj_camera.zoomfactor = obj_camera.zoomfactor * 2;
	} else
	{
		if (obj_camera.zoomfactor <= 1)
		{
			obj_camera.zoomfactor = obj_camera.zoomfactor * 2;
		} else obj_camera.zoomfactor = obj_camera.zoomfactor + 1;
	}
}

if keyboard_check_pressed(ord("Z"))
{
	obj_camera.zoomfactor = 2;
	obj_camera.zoomrate = 0.042;
}
if keyboard_check_released(ord("Z"))
{
	obj_camera.zoomfactor = 1;
	obj_camera.zoomrate = 0.1;
}

if (global.resetting)
{
	instance_destroy(obj_Charactercorpse);
	global.resetting = 0;
	room_restart();
}

if keyboard_check_direct(vk_control) and keyboard_check_pressed(vk_tab) and (global.debug = 1)
{
	if (debugteleport = 0) debugteleport = 1; else debugteleport = 0;
}

if mouse_check_button(mb_left) and (debugteleport = 1)
{
	obj_Character.x = mouse_x;
	obj_Character.y = mouse_y;
}

if (keyboard_check(vk_f11)) window_set_fullscreen(true);

global.currentweaponcolor = global.weaponcolor[global.weapon];
global.currentpowerupcolor = global.powerupcolor[global.powerup];
