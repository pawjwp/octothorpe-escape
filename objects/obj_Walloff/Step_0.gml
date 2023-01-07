//Transparent when purple
if (solidworld = 0)
{
	if (global.world = 1)
	{
		sprite_index = spr_partial_wall1;
	} else
	{
		var new = instance_create_layer(x, y, "Barriers", obj_Wall);
		new.solidworld = 0;
		new.sprite_index = spr_wall0;
		instance_destroy();
	}
}

//Transparent when green
if (solidworld = 1)
{
	if (global.world = 0)
	{
		sprite_index = spr_partial_wall0;
	} else
	{
		var new = instance_create_layer(x, y, "Barriers", obj_Wall);
		new.solidworld = 1;
		new.sprite_index = spr_wall1;
		instance_destroy();
	}
}