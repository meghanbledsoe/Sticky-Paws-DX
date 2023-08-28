function scr_player_move_pause()
{
	
	#region /* Pause */
	if (display_get_gui_width() > 0)
	&& (display_get_gui_height() > 0)
	{
		surface_resize(application_surface, display_get_gui_width(), display_get_gui_height());
	}
	
	if (keyboard_check_pressed(vk_escape))
	|| (keyboard_check(vk_tab))
	&& (keyboard_check(vk_lshift))
	|| (gamepad_button_check_pressed(global.player_slot[player], gp_start))
	|| (controller_connected)
	&& (!gamepad_is_connected(global.player_slot[player]))
	|| (global.actually_play_edited_level)
	&& (global.automatically_pause_when_window_is_unfocused)
	&& (!window_has_focus())
	{
		if (!gamepad_is_connected(global.player_slot[player]))
		&& (controller_connected)
		{
			switch_controller_support_show(); /* On Nintendo Switch, when you disconnect any controllers, show the system menu where you can change controllers and players */
		}
		
		#region /* Show all HUD elements */
		obj_camera.hud_show_lives_timer = global.hud_hide_time * 60;
		obj_camera.hud_show_deaths_timer = global.hud_hide_time * 60;
		obj_camera.hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
		obj_camera.hud_show_big_collectibles_timer = global.hud_hide_time * 60;
		obj_camera.hud_show_score_timer = global.hud_hide_time * 60;
		#endregion /* Show all HUD elements END */
		
		controller_connected = false;
		if (global.play_edited_level)
		&& (global.actually_play_edited_level == false)
		&& (global.character_select_in_this_menu == "level_editor")
		{
			obj_camera.pause_playtest = true;
			obj_camera.black_screen_gui_alpha = 1;
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			score = 0;
			
			#region /* Save Level Information when in level editor */
			if (global.level_name != "")
			{
				ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
				ini_write_real("info", "view_xview", camera_get_view_x(view_camera[view_current]));
				ini_write_real("info", "view_yview", camera_get_view_y(view_camera[view_current]));
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			#endregion /* Save Level Information when in level editor END */
			
			var time_source = time_source_create(time_source_game, 1, time_source_units_frames, function()
			{
				room_restart();
			}
			, [], 1);
			time_source_start(time_source);
		}
		else
		{
			
			#region /* What player should control the pause menu */
			if (gamepad_button_check_pressed(global.player_slot[player], gp_start))
			{
				global.pause_player = player - 1;
			}
			else
			if (global.player1_can_play)
			{
				global.pause_player = 0;
			}
			else
			if (global.player2_can_play)
			{
				global.pause_player = 1;
			}
			else
			if (global.player3_can_play)
			{
				global.pause_player = 2;
			}
			else
			if (global.player4_can_play)
			{
				global.pause_player = 3;
			}
			#endregion /* What player should control the pause menu END */
			
			global.pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 0, 0, 0);
			room_persistent = true; /* Turn ON Room Persistency */
			global.pause_room = room;
			audio_pause_all();
			global.pause = true;
			room_goto(rm_pause);
		}
	}
	else
	{
		room_persistent = false; /* Turn OFF Room Persistency */
	}
	#endregion /* Pause END */
	
}