activationtime = activationtime - 1;
if (activationtime <= 0)
{
	instance_activate_object(target);
	instance_destroy();
}