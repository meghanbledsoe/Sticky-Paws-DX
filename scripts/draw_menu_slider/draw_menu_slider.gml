/// @function draw_menu_slider(x, y, string, menu_index, menu_takes_you_to, variable_to_change)
/// @description draw_menu_button(x, y, string, menu_index, variable_to_change)
/// @param x
/// @param y
/// @param string
/// @param menu_index
/// @param variable_to_change
/// @param bar_color
/// @param variable_to_change

function draw_menu_slider(x_position, y_position, string_text, menu_index, variable_to_change, bar_color)
{
	var length_variable = 320;
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position- 16, x_position + 320, y_position + 16))
	and (global.controls_used_for_menu_navigation == "mouse")
	and (menu_delay == 0)
	and (open_dropdown == false)
	{
		menu = menu_index;
		can_navigate_settings_sidebar = false;
	}
	
	#region /* Draw Bar */
	if (menu == menu_index)
	{
		draw_rectangle_color(x_position- 2, y_position- 16 - 2, x_position + 320 + 2, y_position + 16 + 2, c_black, c_black, c_black, c_black, false);
		
		#region /* Click to change value */
		if (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button(mb_left))
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position- 32, y_position- 32, x_position + 352, y_position + 32)) /* Within the length of the slider */
			{
				if (menu == "volume_main"){global.volume_main = clamp((mouse_get_x -x_position) /(length_variable), 0, 1);if (!audio_is_playing(snd_basic_collectible)){audio_play_sound(snd_basic_collectible, 0, 0, global.volume_main);}}else
				if (menu == "volume_music"){global.volume_music = clamp((mouse_get_x -x_position) /(length_variable), 0, 1);if (!audio_is_playing(snd_basic_collectible)){audio_play_sound(snd_basic_collectible, 0, 0, global.volume_music * global.volume_main);}}else
				if (menu == "volume_melody"){global.volume_melody = clamp((mouse_get_x -x_position) /(length_variable), 0, 1);if (!audio_is_playing(snd_basic_collectible)){audio_play_sound(snd_basic_collectible, 0, 0, global.volume_melody * global.volume_main);}}else
				if (menu == "volume_sound"){global.volume_sound = clamp((mouse_get_x -x_position) /(length_variable), 0, 1);if (!audio_is_playing(snd_basic_collectible)){audio_play_sound(snd_basic_collectible, 0, 0, global.volume_sound * global.volume_main);}}else
				if (menu == "volume_ambient"){global.volume_ambient = clamp((mouse_get_x -x_position) /(length_variable), 0, 1);if (!audio_is_playing(snd_basic_collectible)){audio_play_sound(snd_basic_collectible, 0, 0, global.volume_ambient * global.volume_main);}}else
				if (menu == "volume_footstep"){global.volume_footstep = clamp((mouse_get_x -x_position) /(length_variable), 0, 1);if (!audio_is_playing(snd_basic_collectible)){audio_play_sound(snd_basic_collectible, 0, 0, global.volume_footstep * global.volume_main);}}else
				if (menu == "volume_voices"){global.volume_voice = clamp((mouse_get_x -x_position) /(length_variable), 0, 1);if (!audio_is_playing(snd_basic_collectible)){audio_play_sound(snd_basic_collectible, 0, 0, global.volume_voice * global.volume_main);}}else
				
				if (menu == "background_brightness_gameplay")
				{
					global.background_brightness_gameplay = clamp((mouse_get_x -x_position) /(length_variable), 0, 1)*(1-(- 1)) + (- 1);
					variable_to_change = clamp((mouse_get_x -x_position) /(length_variable), 0, 1)*(1-(- 1)) + (- 1);
				}
				else
				if (menu == "background_brightness_menu")
				{
					global.background_brightness_menu = clamp((mouse_get_x -x_position) /(length_variable), 0, 1)*(1-(- 1)) + (- 1);
					variable_to_change = clamp((mouse_get_x -x_position) /(length_variable), 0, 1)*(1-(- 1)) + (- 1);
				}
				else
				{
					variable_to_change = clamp((mouse_get_x -x_position) /(length_variable), 0, 1);
				}
			}
		}
		#endregion /* Click to change value */
		
	}
	if (menu_index = "background_brightness_gameplay")
	or (menu_index = "background_brightness_menu")
	{
		draw_rectangle_color(x_position, y_position- 16, x_position + 320, y_position + 16, c_black, c_white, c_white, c_black, false);
		if (menu_index = "background_brightness_gameplay")
		{
			if (variable_to_change < 0)
			{
				draw_rectangle_color(x_position + (variable_to_change -(- 1)) /(1-(- 1))* 320 - 2, y_position- 16, x_position + (variable_to_change -(- 1)) /(1-(- 1))* 320 + 2, y_position + 16, c_white, c_white, c_white, c_white, false);
			}
			else
			{
				draw_rectangle_color(x_position + (variable_to_change -(- 1)) /(1-(- 1))* 320 - 2, y_position- 16, x_position + (variable_to_change -(- 1)) /(1-(- 1))* 320 + 2, y_position + 16, c_black, c_black, c_black, c_black, false);
			}
		}
		else
		if (menu_index = "background_brightness_menu")
		{
			if (variable_to_change < 0)
			{
				draw_rectangle_color(x_position + (variable_to_change -(- 1)) /(1-(- 1))* 320 - 2, y_position- 16, x_position + (variable_to_change - (- 1)) /(1-(- 1))* 320 + 2, y_position + 16, c_white, c_white, c_white, c_white, false);
			}
			else
			{
				draw_rectangle_color(x_position + (variable_to_change -(- 1)) /(1-(- 1))* 320 - 2, y_position- 16, x_position + (variable_to_change -(- 1)) /(1-(- 1))* 320 + 2, y_position + 16, c_black, c_black, c_black, c_black, false);
			}
		}
	}
	else
	{
		draw_rectangle_color(x_position, y_position- 16, x_position + 320, y_position + 16, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
		draw_rectangle_color(x_position, y_position- 16, x_position + variable_to_change * 320, y_position + 16,bar_color,bar_color,bar_color,bar_color, false);
	}
	#endregion /* Draw Bar END */
	
	#region /* Show a menu cursor when the option is highlighted */
	if (menu == menu_index)
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position- 16, y_position, 1, 1, 0, c_white, 1);
	}
	#endregion /* Show a menu cursor when the option is highlighted END */
	
	#region /* Clicking the menu button */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position + 32, y_position + 2, x_position + 320, y_position + 41))
	and (global.controls_used_for_menu_navigation == "mouse")
	and (mouse_check_button_released(mb_left))
	and (menu != "assist_enable")
	and (menu_delay == 0)
	or (point_in_rectangle(mouse_get_x, mouse_get_y, x_position + 32, y_position + 2, x_position + 320, y_position + 41))
	and (global.controls_used_for_menu_navigation == "mouse")
	and (mouse_check_button_released(mb_left))
	and (global.assist_enable == true)
	and (menu == "assist_enable")
	and (menu_delay == 0)
	{
		menu = menu_index;
		can_navigate_settings_sidebar = false;
		open_dropdown = false;
		menu_delay = 3;
	}
	#endregion /* Clicking the menu button END */
	
	#region /* Text above the menu button */
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x_position, y_position- 32, string(string_text) + ": " + string(variable_to_change * 100) + "%", global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
	#endregion /* Text above the menu button END */
	
}