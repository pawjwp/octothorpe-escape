if (global.world = 0) sprite_index = spr_wall0; else sprite_index = spr_wall1;


//Transparent when purple
if (solidworld = 0)
{
	if (global.world = 0)
	{
		sprite_index = spr_wall0;
	} else
	{
		var new = instance_create_layer(x, y, "Barriers", obj_Walloff);
		new.solidworld = 0;
		new.sprite_index = spr_partial_wall1;
		instance_destroy();
	}
}

//Transparent when green
if (solidworld = 1)
{
	if (global.world = 1)
	{
		sprite_index = spr_wall1;
	} else
	{
		var new = instance_create_layer(x, y, "Barriers", obj_Walloff);
		new.solidworld = 1;
		new.sprite_index = spr_partial_wall0;
		instance_destroy();
	}
}

//if (charabove != -1) charabove = (place_meeting(x, y + 1, obj_Character));
if (charabove != -1)
{
	charabove = (place_meeting(x, y - 1, obj_Character));
	spacebelow = !(place_meeting(x, y + 1, obj_Wall))
}