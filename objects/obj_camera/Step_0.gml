if (global.pause) exit;

if (instance_exists(follow))
{
	xgoal = follow.x;
	ygoal = follow.y;
}

//Get view information
var camx = camera_get_view_x(camera);				//vpos_x
var camy = camera_get_view_y(camera);				//vpos_y
var camw = camera_get_view_width(camera);			//view_w
var camh = camera_get_view_height(camera);			//view_h
var halfw = camera_get_view_width(camera) * 0.5;	//vpos_w
var halfh = camera_get_view_height(camera) * 0.5;	//vpos_h

//Update view information
var newx = lerp(camx, xgoal - halfw, moverate);
var newy = lerp(camy, ygoal - halfh, moverate);
var neww = lerp(camw, zoomfactor * defaultcamwidth, zoomrate);
var newh = lerp(camh, zoomfactor * defaultcamheight, zoomrate);

if keyboard_check_released(ord("K"))
{
	neww = 1440;
	newh = 810;
}

//Set new view information
camera_set_view_pos(camera, newx, newy);
camera_set_view_size(camera, neww, newh);

//Shift after zooming
var shiftx = camera_get_view_x(camera) - (neww - camw) * 0.5;
var shifty = camera_get_view_y(camera) - (newh - camh) * 0.5;

camera_set_view_pos(camera, shiftx, shifty);

//Clamp to room
var clampx = clamp(camera_get_view_x(camera), 0, room_width - camera_get_view_width(camera));
var clampy = clamp(camera_get_view_y(camera), 0, room_height - camera_get_view_height(camera));
camera_set_view_pos(camera, clampx, clampy);

//https://forum.yoyogames.com/index.php?threads/guide-meet-the-new-camera-system.12269/