function scr_debug_screen()
{
	var fps_real_target = (os_type == os_switch) ? 60 : 600;
	var instance_count_target = 200;
	var fps_y = 64;
	var fps_real_y = 96;
	var instance_count_y = 128;
	var all_instance_count_y = 160;
	
	/* Debug information should show up on pause screen and tite screen, so you can optimize those screens too */
	if keyboard_check_pressed(vk_f3)
	|| keyboard_check(ord("F"))
	&& keyboard_check_pressed(ord("3"))
	{
		global.debug_screen = !global.debug_screen;
		if (keyboard_check(ord("O")))
		{
			show_debug_overlay(global.debug_screen);
		}
	}
	
	#region /* FPS */
	if (global.show_fps || global.debug_screen)
	{
		if (global.show_fps && global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, fps_y, 1, 1, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		if (fps >= global.max_fps)
		{
			scr_draw_text_outlined(32, fps_y, "FPS: " + string(fps) + "/" + string(global.max_fps),,, c_lime);
		}
		else
		{
			var fps_color = make_color_hsv(50 / global.max_fps * fps, 255, 255)
			scr_draw_text_outlined(32, fps_y, "FPS: " + string(fps) + "/" + string(global.max_fps),,, fps_color);
		}
	}
	#endregion /* FPS END */
	
	#region /* FPS Real */
	if (global.show_fps_real || global.debug_screen)
	{
		if (global.show_fps_real && global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, fps_real_y, 1, 1, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		#region /* FPS Real Rating */
		if (fps_real >= fps_real_target)
		{
			scr_draw_text_outlined(32, fps_real_y, "FPS Real: " + string(fps_real),,, c_lime);
			scr_draw_text_outlined(350, fps_real_y + scr_wave(-3, +3, 0.5), "GOOD >" + string(fps_real_target),,, c_lime);
		}
		else
		{
			var fps_real_color = make_color_hsv(50 / fps_real_target * fps_real, 255, 255);
			scr_draw_text_outlined(32, fps_real_y, "FPS Real: " + string(fps_real),,, fps_real_color);
			scr_draw_text_outlined(350, fps_real_y, "BAD <" + string(fps_real_target),,, fps_real_color);
		}
		#endregion /* FPS Real Rating END */
		
	}
	#endregion /* FPS Real END */
	
	#region /* Instance Count */
	if (global.show_instance_count || global.debug_screen)
	{
		if (global.show_instance_count && global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, instance_count_y, 1, 1, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(32, instance_count_y, "Instance Count: " + string(instance_count));
	}
	#endregion /* Instance Count END */
	
	#region /* All Instance Count */
	if (global.show_all_instance_count)
	{
		if (global.show_all_instance_count && global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, all_instance_count_y, 1, 1, 0, c_white, 1);
		}
		
		#region /* Show what objects are currently in the room */
		for (var i = 0; i < 100; ++i;)
		{
			var all_instance_count_color = make_color_hsv(instance_number(i), 255, 255)
			if (instance_exists(i) && instance_number(i) >= instance_count_target)
			{
				scr_draw_text_outlined(32, all_instance_count_y + (8 * i) + scr_wave(-3, +3, 0.5), string(object_get_name(i)) + ": " + string(instance_number(i)),,, all_instance_count_color);
			}
			else
			if (instance_exists(i))
			{
				scr_draw_text_outlined(32, all_instance_count_y + (8 * i), string(object_get_name(i)) + ": " + string(instance_number(i)),,, all_instance_count_color);
			}
		}
		#endregion /* Show what objects are currently in the room END */
		
	}
	#endregion /* All Instance Count END */
	
	#region /* Controller ports */
	if (os_type == os_switch)
	{
		if (!gamepad_is_connected(0))
		{
			global.player_slot[1] = 1;
			global.player_slot[2] = 2;
			global.player_slot[3] = 3;
			global.player_slot[4] = 4;
		}
		else
		{
			global.player_slot[1] = 0;
			global.player_slot[2] = 1;
			global.player_slot[3] = 2;
			global.player_slot[4] = 3;
		}
	}
	else
	{
		global.player_slot[1] = 0;
		global.player_slot[2] = 1;
		global.player_slot[3] = 2;
		global.player_slot[4] = 3;
	}
	#endregion /* Controller ports END */
	
	if (global.debug_screen)
	{
		if (keyboard_check_pressed(vk_f2))
		{
			scr_save_os_info_ini();
		}
		
		var mouse_get_x = device_mouse_x_to_gui(0);
		var mouse_get_y = device_mouse_y_to_gui(0);
		var version_y = 32;
		var player_xy_y = 160;
		var display_y = 32
		var d3d11_y = 64;
		
		#region /* Click on FPS to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, fps_y - 15, 370, fps_y + 15) && global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, fps_y - 16, 370, fps_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_released(mb_left))
			{
				global.show_fps = !global.show_fps;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "show_fps", global.show_fps);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
		}
		#endregion /* Click on FPS to toggle if it should stay on screen even after you close debug screen END */
		
		#region /* Click on FPS Real to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, fps_real_y - 15, 370, fps_real_y + 15) && global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, fps_real_y - 16, 370, fps_real_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_released(mb_left))
			{
				global.show_fps_real = !global.show_fps_real;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "show_fps_real", global.show_fps_real);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
		}
		#endregion /* Click on FPS Real to toggle if it should stay on screen even after you close debug screen END */
		
		#region /* Click on Instance Count to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, instance_count_y - 15, 370, instance_count_y + 15) && global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, instance_count_y - 16, 370, instance_count_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_released(mb_left))
			{
				global.show_instance_count = !global.show_instance_count;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "show_instance_count", global.show_instance_count);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
		}
		#endregion /* Click on Instance Count to toggle if it should stay on screen even after you close debug screen END */
		
		#region /* Click on All Instance Count to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, all_instance_count_y - 15, 370, all_instance_count_y + 15) && global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, all_instance_count_y - 16, 370, all_instance_count_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_released(mb_left))
			{
				global.show_all_instance_count = !global.show_all_instance_count;
			}
		}
		#endregion /* Click on All Instance Count to toggle if it should stay on screen even after you close debug screen END */
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 32, "F3 to toggle debug screen");
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(32, version_y, string(global.game_name) + " v" + string(scr_get_build_date()));
		
		#region /* X and Y position of player */
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player1))
		{
			var get_player = obj_camera.player1;
		}
		else
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player2))
		{
			var get_player = obj_camera.player2;
		}
		else
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player3))
		{
			var get_player = obj_camera.player3;
		}
		else
		if (instance_exists(obj_camera))
		&& (instance_exists(obj_camera.player4))
		{
			var get_player = obj_camera.player4;
		}
		else
		if (instance_exists(obj_player_map))
		{
			var get_player = obj_player_map;
		}
		else
		{
			var get_player = noone;
		}
		if (get_player != noone)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(32, player_xy_y, "X: " + string(get_player.x) + " Y: " + string(get_player.y), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* X and Y position of player END */
	
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		var _info = os_get_info();
		scr_draw_text_outlined(display_get_gui_width() - 32, display_y, "Display: " + string(window_get_width()) + "x" + string(window_get_height()), global.default_text_size, c_black, c_white, 1);
		if (_info[? "video_adapter_description"] != undefined)
		{
			scr_draw_text_outlined(display_get_gui_width() - 32, d3d11_y, string(_info[? "video_adapter_description"]), global.default_text_size, c_black, c_white, 1);
		}
		
		/* Draw the name of the current room at the bottom middle of the screen */
		draw_set_halign(fa_center);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32, "current room: " + string(global.select_level_index) + " " + string(room_get_name(room)) + " " + string(room_width) + "x" + string(room_height), global.default_text_size, c_black, c_white);
	}
	
	if (global.debug_screen)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		var debug_text_y = 320;
		
		//if (instance_exists(obj_camera))
		//{
		//	scr_draw_text_outlined(32, debug_text_y, "obj_camera.player1: " + string(obj_camera.player1), global.default_text_size, c_black, c_white);
		//	debug_text_y += 20;
		//	scr_draw_text_outlined(32, debug_text_y, "obj_camera.player2: " + string(obj_camera.player2), global.default_text_size, c_black, c_white);
		//	debug_text_y += 20;
		//	scr_draw_text_outlined(32, debug_text_y, "obj_camera.player3: " + string(obj_camera.player3), global.default_text_size, c_black, c_white);
		//	debug_text_y += 20;
		//	scr_draw_text_outlined(32, debug_text_y, "obj_camera.player4: " + string(obj_camera.player4), global.default_text_size, c_black, c_white);
		//	debug_text_y += 20;
		//}
		
		//if (gamepad_get_description(0) != "")
		//{
		//	scr_draw_text_outlined(32, debug_text_y, "gamepad(0): " + string(gamepad_get_description(0)), global.default_text_size, c_black, c_white);
		//}
		
		//debug_text_y += 20;
		//if (gamepad_get_description(1) != "")
		//{
		//	scr_draw_text_outlined(32, debug_text_y, "gamepad(1): " + string(gamepad_get_description(1)), global.default_text_size, c_black, c_white);
		//}
		//debug_text_y += 20;
		//if (gamepad_get_description(2) != "")
		//{
		//	scr_draw_text_outlined(32, debug_text_y, "gamepad(2): " + string(gamepad_get_description(2)), global.default_text_size, c_black, c_white);
		//}
		//debug_text_y += 20;
		//if (gamepad_get_description(3) != "")
		//{
		//	scr_draw_text_outlined(32, debug_text_y, "gamepad(3): " + string(gamepad_get_description(3)), global.default_text_size, c_black, c_white);
		//}
		//debug_text_y += 20;
		//if (gamepad_get_description(4) != "")
		//{
		//	scr_draw_text_outlined(32, debug_text_y, "gamepad(4): " + string(gamepad_get_description(4)), global.default_text_size, c_black, c_white);
		//}
		debug_text_y += 20;
		
		if (variable_instance_exists(self, "menu"))
		{
			scr_draw_text_outlined(32, debug_text_y, "menu: " + string(menu), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		if (variable_instance_exists(self, "menu_delay"))
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				scr_draw_text_outlined(32, debug_text_y, "menu_delay: " + string(menu_delay), global.default_text_size, c_black, c_white);
			}
			else
			{
				scr_draw_text_outlined(32, debug_text_y, "menu_delay: " + string(menu_delay), global.default_text_size, c_black, c_red);
			}
			debug_text_y += 20;
		}
		//if (variable_instance_exists(self, "menu_joystick_delay"))
		//&& (gamepad_is_connected(0))
		//{
		//	if (menu_joystick_delay == 0)
		//	{
		//		scr_draw_text_outlined(32, debug_text_y, "menu_joystick_delay: " + string(menu_joystick_delay), global.default_text_size, c_black, c_white);
		//	}
		//	else
		//	{
		//		scr_draw_text_outlined(32, debug_text_y, "menu_joystick_delay: " + string(menu_joystick_delay), global.default_text_size, c_black, c_red);
		//	}
		//	debug_text_y += 20;
		//}
		//scr_draw_text_outlined(32, debug_text_y, "character_index: " + string(global.character_index), global.default_text_size, c_black, c_white);
		//debug_text_y += 20;
		//scr_draw_text_outlined(32, debug_text_y, "search_id: " + string(global.search_id), global.default_text_size, c_black, c_white);
		//debug_text_y += 20;
		//if (instance_exists(obj_camera))
		//{
		//	scr_draw_text_outlined(32, debug_text_y, "obj_camera.hud_show_lives_timer: " + string(obj_camera.hud_show_lives_timer), global.default_text_size, c_black, c_white);
		//	debug_text_y += 20;
		//}
		scr_draw_text_outlined(32, debug_text_y, "controls_used_for_menu_navigation: " + string(global.controls_used_for_menu_navigation), global.default_text_size, c_black, c_white);
		debug_text_y += 20;
		scr_draw_text_outlined(32, debug_text_y, "temp_directory: " + string(temp_directory), global.default_text_size, c_black, c_white);
		debug_text_y += 20;
		scr_draw_text_outlined(32, debug_text_y, "cache_directory: " + string(cache_directory), global.default_text_size, c_black, c_white);
		debug_text_y += 20;
		if (global.use_cache_or_working == cache_directory)
		{
			scr_draw_text_outlined(32, debug_text_y, "use_cache_or_working: cache_directory", global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
	}
}