if (block_type = "brick_block")
and (empty = false)
{
	if (asset_get_type("spr_brick_block") == asset_sprite)
	{
		sprite_index = spr_brick_block;
	}
	can_break_this_block = false;
}
else
if (block_type = "question_block")
and (empty = false)
{
	if (asset_get_type("spr_question_block") == asset_sprite)
	{
		sprite_index = spr_question_block;
	}
	can_break_this_block = false;
}
else
if (block_type = "melon_block")
and (empty = false)
{
	if (asset_get_type("spr_melon_block") == asset_sprite)
	{
		sprite_index = spr_melon_block;
	}
	can_break_this_block = true;
}