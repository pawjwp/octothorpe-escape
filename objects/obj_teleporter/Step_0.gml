if (!activated)
{
	part_type_sprite(orb.pt_TeleporterEmit, spr_teleporteremit_off, 1, 1, 0);
	part_type_color3(orb.pt_TeleporterEmit, $ffffff, $ffffff, $ffffff);
} else
{
	if (primary)
	{
		part_type_sprite(orb.pt_TeleporterEmit, spr_teleporteremit, 1, 1, 0);
		if (global.world = 0) part_type_color3(orb.pt_TeleporterEmit, $ffffff, $7fbfff, $00ff7f);
		if (global.world = 1) part_type_color3(orb.pt_TeleporterEmit, $ffffff, $bf7fff, $ff007f);
	} else
	{
		part_type_sprite(orb.pt_TeleporterEmit, spr_teleporteremit_middle, 1, 1, 0);
		if (global.world = 0) part_type_color3(orb.pt_TeleporterEmit, $ffffff, $bfbfff, $7fffbf);
		if (global.world = 1) part_type_color3(orb.pt_TeleporterEmit, $ffff00, $dfbfff, $ff7fbf);
	}
}

if (global.world = 0) image_blend = $00ff7f;
if (global.world = 1) image_blend = $ff007f;
if(orb.fake) image_blend = $000000;