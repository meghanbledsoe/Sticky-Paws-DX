var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var clear_prompt_x = 164;

#region /* Show Enter Level Key */
if (can_move)
&& (can_enter_level >= 30)
&& (point_distance(xx, yy, x, y) < 30)
&& (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
&& (speed == 0)
&& (instance_nearest(x, y, obj_level).clear_rate != "closed")
&& (!global.pause)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(64, get_window_height - 20, l10n_text("Play"), global.default_text_size, c_black, c_white, 1);
	
	if (gamepad_is_connected(global.player_slot[1]))
	&& (global.controls_used_for_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons)
	{
		scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.accept], 32, get_window_height - 20, 0.5, c_white, 1);
	}
	else
	if (global.player_can_play[1])
	{
		if (global.player_[inp.key][1][1][action.accept] > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.accept], 32, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
		}
		else
		if (global.player_[inp.key][1][2][action.accept] > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.accept], 32, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
		}
	}
	else
	if (global.player_can_play[2])
	{
		if (global.player_[inp.key][2][1][action.accept] > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][1][action.accept], 32, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
		}
		else
		if (global.player_[inp.key][2][2][action.accept] > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][2][action.accept], 32, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
		}
	}
	else
	if (global.player_can_play[3])
	{
		if (global.player_[inp.key][3][1][action.accept] > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][1][action.accept], 32, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
		}
		else
		if (global.player_[inp.key][3][2][action.accept] > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][2][action.accept], 32, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
		}
	}
	else
	if (global.player_can_play[4])
	{
		if (global.player_[inp.key][4][1][action.accept] > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][1][action.accept], 32, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
		}
		else
		if (global.player_[inp.key][4][2][action.accept] > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][2][action.accept], 32, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
		}
	}
	
	#region /* Click the play button in world map */
	if (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, display_get_gui_height() - 42, 140, display_get_gui_height()))
	|| (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
	{
		draw_set_alpha(0.5);
		draw_roundrect_color_ext(0, display_get_gui_height() - 42, 140, display_get_gui_height(), 50, 50, c_white, c_white, false);
		draw_set_alpha(1);
	}
	#endregion /* Click the play button in world map END */
	
}
#endregion /* Show Enter Level Key END */

#region /* Show Clear Level Key in debug */
if (global.debug_screen)
{
	if (can_move)
	&& (can_enter_level >= 30)
	&& (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
	&& (speed == 0)
	&& (instance_nearest(x, y, obj_level).clear_rate = "enter")
	&& (!global.pause)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(clear_prompt_x + 32, get_window_height - 20, l10n_text("Clear"), global.default_text_size, c_black, c_white, 1);
		if (gamepad_is_connected(global.player_slot[1]))
		&& (global.controls_used_for_navigation == "gamepad")
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.back], clear_prompt_x, get_window_height - 20, 0.5, c_white, 1);
		}
		else
		if (global.player_can_play[1])
		{
			if (global.player_[inp.key][1][1][action.back] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.back], clear_prompt_x, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
			}
			else
			if (global.player_[inp.key][1][2][action.back] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.back], clear_prompt_x, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
			}
		}
		else
		if (global.player_can_play[2])
		{
			if (global.player_[inp.key][2][1][action.back] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][1][action.back], clear_prompt_x, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
			}
			else
			if (global.player_[inp.key][2][2][action.back] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][2][action.back], clear_prompt_x, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
			}
		}
		else
		if (global.player_can_play[3])
		{
			if (global.player_[inp.key][3][1][action.back] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][1][action.back], clear_prompt_x, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
			}
			else
			if (global.player_[inp.key][3][2][action.back] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][2][action.back], clear_prompt_x, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
			}
		}
		else
		if (global.player_can_play[4])
		{
			if (global.player_[inp.key][4][1][action.back] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][1][action.back], clear_prompt_x, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
			}
			else
			if (global.player_[inp.key][4][2][action.back] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][2][action.back], clear_prompt_x, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
			}
		}
		
		#region /* Click the clear button in world map */
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 141, display_get_gui_height() - 42, 140 + 140, display_get_gui_height()))
		{
			draw_set_alpha(0.5);
			draw_roundrect_color_ext(141, display_get_gui_height() - 42, 140 + 140, display_get_gui_height(), 50, 50, c_white, c_white, false);
			draw_set_alpha(1);
		}
		#endregion /* Click the clear button in world map END */
		
	}
}
#endregion /* Show Clear Level Key in debug END */

#region /* Show Level Info */
if (iris_xscale > 10)
&& (move_delay > 10)
&& (point_distance(xx, yy, x, y) < 30)
&& (instance_exists(obj_level)) /* Must check if obj_level exists or not */
&& (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
&& (instance_nearest(x, y, obj_level).level_number != 0)
{
	if (instance_nearest(x, y, obj_level).clear_rate == "enter")
	|| (instance_nearest(x, y, obj_level).clear_rate == "clear")
	{
		var show_level_info_x = 180;
		var show_level_info_y = 200;
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		if (global.show_defeats_counter)
		&& (instance_nearest(x, y, obj_level).number_of_defeats > 0)
		{
			total_defeats_y = -64;
			times_cleared_y = -96;
			best_score_y = -128;
			best_time_y = -160;
			show_big_collectibles_y = -192;
		}
		else
		{
			total_defeats_y = 0;
			times_cleared_y = -64;
			best_score_y = -96;
			best_time_y = -128;
			show_big_collectibles_y = -160;
		}
		
		if (global.show_defeats_counter)
		&& (instance_nearest(x, y, obj_level).number_of_defeats > 0)
		|| (instance_nearest(x, y, obj_level).number_of_clears > 0)
		|| (instance_nearest(x, y, obj_level).level_score > 0)
		|| (instance_nearest(x, y, obj_level).timeattack_realmillisecond < 999999999)
		&& (instance_nearest(x, y, obj_level).timeattack_realmillisecond > 0)
		|| (instance_nearest(x, y, obj_level).big_collectible1)
		|| (instance_nearest(x, y, obj_level).big_collectible2)
		|| (instance_nearest(x, y, obj_level).big_collectible3)
		|| (instance_nearest(x, y, obj_level).big_collectible4)
		|| (instance_nearest(x, y, obj_level).big_collectible5)
		{
			draw_set_alpha(0.9);
			draw_roundrect_color_ext(show_level_info_x - 140, show_level_info_y - abs(show_big_collectibles_y) - 16, show_level_info_x + 140, show_level_info_y - 52, 50, 50, c_black, c_black, false);
			draw_set_alpha(1);
		}
		
		#region /* Total number of defeats */
		if (global.show_defeats_counter)
		&& (instance_nearest(x, y, obj_level).number_of_defeats > 0)
		{
			scr_draw_text_outlined(show_level_info_x, show_level_info_y + total_defeats_y, l10n_text("Total Defeats") + ": " + string(instance_nearest(x, y, obj_level).number_of_defeats), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Total number of defeats END */
		
		#region /* Number of times played */
		if (instance_nearest(x, y, obj_level).number_of_clears > 0)
		{
			scr_draw_text_outlined(show_level_info_x, show_level_info_y + times_cleared_y, l10n_text("Times Passed") + ": " + string(instance_nearest(x, y, obj_level).number_of_clears), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Number of times played END */
		
		#region /* Show High Score */
		if (instance_nearest(x, y, obj_level).level_score > 0)
		{
			scr_draw_text_outlined(show_level_info_x, show_level_info_y + best_score_y, l10n_text("Best Score") + ": " + string(instance_nearest(x, y, obj_level).level_score), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Show High Score END */
		
		#region /* Show Fastest Time */
		if (instance_nearest(x, y, obj_level).timeattack_realmillisecond < 999999999)
		&& (instance_nearest(x, y, obj_level).timeattack_realmillisecond > 0)
		{
			scr_draw_text_outlined(show_level_info_x, show_level_info_y + best_time_y, l10n_text("Best Time") + ": " + string(instance_nearest(x, y, obj_level).timeattack_minute) + ":" +
			string(string_replace_all(string_format(instance_nearest(x, y, obj_level).timeattack_second, 2, 0), " ", "0")) + "." +
			string(string_replace_all(string_format(instance_nearest(x, y, obj_level).timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Show Fastest Time END */
		
		#region /* Show Big Collectible */
		if (instance_nearest(x, y, obj_level).big_collectible1)
		|| (instance_nearest(x, y, obj_level).big_collectible2)
		|| (instance_nearest(x, y, obj_level).big_collectible3)
		|| (instance_nearest(x, y, obj_level).big_collectible4)
		|| (instance_nearest(x, y, obj_level).big_collectible5)
		{
			if (instance_nearest(x, y, obj_level).big_collectible1)
			&& (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, show_level_info_x - 48, show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			if (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, show_level_info_x - 48, show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			if (instance_nearest(x, y, obj_level).big_collectible2)
			&& (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, show_level_info_x - 24, show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			if (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, show_level_info_x - 24, show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			if (instance_nearest(x, y, obj_level).big_collectible3)
			&& (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, show_level_info_x, show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			if (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, show_level_info_x, show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			if (instance_nearest(x, y, obj_level).big_collectible4)
			&& (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, show_level_info_x + 24, show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			if (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, show_level_info_x + 24, show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			if (instance_nearest(x, y, obj_level).big_collectible5)
			&& (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, show_level_info_x + 48, show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			if (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, show_level_info_x + 48, show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
		}
		#endregion /* Show Big Collectible END */
		
	}
}
#endregion /* Show Level Info END */

scr_draw_darken_screen_when_window_is_unfocused();
scr_draw_cursor_mouse();

#region /* Have a black screen at the first frame so transitions look natural */
if (black_screen_at_start_delay < 1)
{
	if (global.enable_transitions)
	{
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
	}
	black_screen_at_start_delay ++;
}
#endregion /* Have a black screen at the first frame so transitions look natural END */

#region /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see */
if (iris_yscale <= 0.002)
|| (brand_new_file)
&& (can_enter_level_automatically)
{
	if (global.enable_transitions)
	{
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
	}
	
	scr_draw_loading(1); /* Draw loading screen when transitioning to other rooms */
	
}
#endregion /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see END */