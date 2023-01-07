if (global.world = 1)
{
	part_type_color3(global.pt_Portal1, 65407, 16776960, 65407);
	part_type_color3(global.pt_Portal2, 65407, 16776960, 65407);
	part_type_color3(global.pt_Portal3, 65407, 16776960, 65407);
} else
{
	part_type_color3(global.pt_Portal1, 16711807, 16776960, 16711807);
	part_type_color3(global.pt_Portal2, 16711807, 16776960, 16711807);
	part_type_color3(global.pt_Portal3, 16711807, 16776960, 16711807);
}
part_particles_create(ps, x, y, global.pt_Portal1, 2);
part_particles_create(ps, x, y, global.pt_Portal2, 2);
part_particles_create(ps, x, y, global.pt_Portal3, 2);