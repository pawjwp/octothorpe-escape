if (active = 1)
{
	instance_create_layer(x, y, "Enemy", obj_Enemy);
	instance_destroy();
}

if (instance_exists(obj_Charactercorpse)) image_alpha = 1 + ((sqr(((obj_Charactercorpse.x - obj_Character.x)^2) + ((obj_Charactercorpse.y - obj_Character.y)^2))) / (sqr(((obj_Charactercorpse.x - chardeathx)^2) + ((obj_Charactercorpse.y - chardeathy)^2)))*-1);