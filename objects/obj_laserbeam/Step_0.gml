if mouse_check_button(mb_left) and (global.weapon = 3)
{
	sprite_index = spr_laserbeam;
//	part_particles_create(obj_pupil.ps, obj_pupil.beam.x + lengthdir_x(obj_pupil.length, obj_pupil.image_angle), obj_pupil.beam.y + lengthdir_y(obj_pupil.length, obj_pupil.image_angle), obj_pupil.pt_flash, 1)
} else sprite_index = -1;