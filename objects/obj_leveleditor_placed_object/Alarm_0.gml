#region /* Initialize Object */
if (global.actually_play_edited_level == false)
{
	if (global.world_editor == false)
	{
		var grid = global.object_grid;
		var grid_height = ds_grid_height(grid) - 1;
		
		var grid_object_index = -1;
		for (var i = 0; i < grid_height; i++)
		{
			if (object == grid[# 0, i])
			{
				grid_object_index = i;
				break;
			}
		}
		
		if (grid_object_index != -1)
		{
			sprite_index = grid[# 1, grid_object_index];
			mask_index = grid[# 3, grid_object_index];
			draw_xscale = grid[# 4, grid_object_index];
			draw_yscale = draw_xscale;
			draw_angle = grid[# 5, grid_object_index];
			image_blend = grid[# 6, grid_object_index];
			default_blend = image_blend;
			image_alpha = grid[# 7, grid_object_index];
		}
		
		draw_item_on_top = noone;
		draw_item_with_spring = false;
		
		switch (object)
		{
			case LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE:
			case LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_2:
			case LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_3:
			case LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_4:
			case LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_5:
			case LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_6:
			case LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_7:
			case LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_8:
			case LEVEL_OBJECT_ID.ID_ONEWAY:
			case LEVEL_OBJECT_ID.ID_ONEWAY2:
			case LEVEL_OBJECT_ID.ID_ONEWAY3:
			case LEVEL_OBJECT_ID.ID_ONEWAY4:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_OFFSET_TIME:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_DOWN:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_DOWN_OFFSET_TIME:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_LEFT:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_LEFT_OFFSET_TIME:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_RIGHT:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_RIGHT_OFFSET_TIME:
				draw_rotate_arrow = true;
				break;
			case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_10_BASIC_COLLECTIBLES:
			case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_10_BASIC_COLLECTIBLES:
			case LEVEL_OBJECT_ID.ID_MELON_BLOCK_10_BASIC_COLLECTIBLES:
			case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_8_BASIC_COLLECTIBLES:
			case LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_8_BASIC_COLLECTIBLES:
			case LEVEL_OBJECT_ID.ID_BUCKET_8_BASIC_COLLECTIBLES:
				draw_item_on_top = global.resource_pack_sprite_basic_collectible;
				break;
			case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_HEART_BALLOON:
			case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_HEART_BALLOON:
			case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_HEART_BALLOON:
			case LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_HEART_BALLOON:
			case LEVEL_OBJECT_ID.ID_BUCKET_HEART_BALLOON:
				draw_item_on_top = spr_heart;
				break;
				
			case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_ONE_UP:
			case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_ONE_UP:
			case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_ONE_UP:
			case LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_ONE_UP:
			case LEVEL_OBJECT_ID.ID_BUCKET_ONE_UP:
				draw_item_on_top = spr_1up;
				break;
				
			case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_TWO_UP:
			case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_TWO_UP:
			case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_TWO_UP:
			case LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_TWO_UP:
			case LEVEL_OBJECT_ID.ID_BUCKET_TWO_UP:
				draw_item_on_top = spr_2up;
				break;
			case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_THREE_UP:
			case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_THREE_UP:
			case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_THREE_UP:
			case LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_THREE_UP:
			case LEVEL_OBJECT_ID.ID_BUCKET_THREE_UP:
				draw_item_on_top = spr_3up;
				break;
			case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_BIG_COLLECTIBLE:
			case LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_BIG_COLLECTIBLE:
			case LEVEL_OBJECT_ID.ID_BUCKET_BIG_COLLECTIBLE:
				draw_item_on_top = global.resource_pack_sprite_big_collectible;
				break;
			case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_INVINCIBILITY_POWERUP:
			case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_INVINCIBILITY_POWERUP:
			case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_INVINCIBILITY_POWERUP:
			case LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_INVINCIBILITY_POWERUP:
			case LEVEL_OBJECT_ID.ID_BUCKET_INVINCIBILITY_POWERUP:
				draw_item_on_top = global.resource_pack_sprite_invincibility_powerup;
				break;
			case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING:
			case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING:
			case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_INVINCIBILITY_POWERUP_COIL_SPRING:
			case LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_INVINCIBILITY_POWERUP_COIL_SPRING:
			case LEVEL_OBJECT_ID.ID_BUCKET_INVINCIBILITY_POWERUP_COIL_SPRING:
				draw_item_with_spring = true;
				draw_item_on_top = global.resource_pack_sprite_invincibility_powerup;
				break;
			case LEVEL_OBJECT_ID.ID_SPRING:
				draw_angle = point_direction(x, y, second_x, second_y) - 90;
				draw_leveleditor_arrow = true;
				break;
			case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW:
			case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST:
			case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER:
				draw_angle = point_direction(x, y, x, second_y) - 90;
				draw_leveleditor_arrow = true;
				break;
			case LEVEL_OBJECT_ID.ID_ARROW_SIGN:
			case LEVEL_OBJECT_ID.ID_ARROW_SIGN_SMALL:
				draw_angle = point_direction(x, y, second_x, second_y);
				draw_leveleditor_arrow = true;
				break;
			case LEVEL_OBJECT_ID.ID_DOOR:
				draw_leveleditor_arrow = true;
			case LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL:
			case LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND:
			case LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND_COIL_SPRING:
			case LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_COIL_SPRING:
			case LEVEL_OBJECT_ID.ID_BASIC_ENEMY:
			case LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND:
			case LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND_COIL_SPRING:
			case LEVEL_OBJECT_ID.ID_BASIC_ENEMY_COIL_SPRING:
			case LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY:
			case LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY_COIL_SPRING:
			case LEVEL_OBJECT_ID.ID_BOSS:
				global.part_limit_entity ++;
				global.part_limit_entity_text_alpha = 1;
				if (global.part_limit_entity > 100)
				{
					instance_destroy();
				}
				break;
		}
	}
	else
	{
		if (object == 1){sprite_index = spr_wall;mask_index = spr_wall;}
		if (object == 2){sprite_index = spr_noone; mask_index = spr_wall;}
		if (object == 3){sprite_index = spr_map_exit;mask_index = spr_wall;}
		if (object == 4){sprite_index = spr_noone; mask_index = spr_wall;}
		if (object == 5){sprite_index = spr_noone; mask_index = spr_wall;}
		if (object == 6){sprite_index = spr_noone; mask_index = spr_wall;}
		if (object == 7){sprite_index = spr_noone; mask_index = spr_wall;}
	}
	global.part_limit ++;
	global.part_limit_text_alpha = 1;
}
#endregion /* Initialize Object END */