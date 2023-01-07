if (sprite_index = spr_poisonblob)
{
	with (other)
	{
		hp = hp - .025
		poisontime = 120;
	}
	destroyed = 1;
}