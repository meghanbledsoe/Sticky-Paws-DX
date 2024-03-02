function scr_draw_information_menu()
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var fixed_player = 1;
	
	#region /* Information menu */
	if (information_menu_open != "") {
		if (information_menu_open != "credits" && instance_exists(obj_credits)) {
			instance_destroy(obj_credits);
		}
		
		draw_set_alpha(0.5);
		var information_background_color = make_color_hsv((current_time * 0.01) mod 255, 127, 255);
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height() * 0.75, information_background_color, information_background_color, c_black, c_black, false);
		draw_set_alpha(0.5);
		draw_rectangle_color(0, display_get_gui_height() * 0.75 + 1, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		if (key_left)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "about")
			{
				menu_delay = 3;
				menu = "links";
				information_menu_open = "links";
			}
			else
			if (menu == "whats_new")
			{
				menu_delay = 3;
				menu = "about";
				information_menu_open = "about";
			}
			else
			if (menu == "backups")
			{
				menu_delay = 3;
				menu = "whats_new";
				information_menu_open = "whats_new";
			}
			else
			if (menu == "credits")
			{
				menu_delay = 3;
				menu = "backups";
				information_menu_open = "backups";
			}
			else
			if (menu == "links")
			{
				menu_delay = 3;
				menu = "credits";
				information_menu_open = "credits";
			}
		}
		if (key_right)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "about")
			{
				menu = "whats_new";
				information_menu_open = "whats_new";
			}
			else
			if (menu == "whats_new")
			{
				menu = "backups";
				information_menu_open = "backups";
			}
			else
			if (menu == "backups")
			{
				menu = "credits";
				information_menu_open = "credits";
			}
			else
			if (menu == "credits")
			{
				menu = "links";
				information_menu_open = "links";
			}
			else
			if (menu == "links")
			{
				menu = "about";
				information_menu_open = "about";
			}
			menu_delay = 3;
		}
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "about")
			|| (menu == "whats_new")
			|| (menu == "backups")
			|| (menu == "credits")
			{
				menu_delay = 3;
				menu = "information_back";
			}
			else
			if (menu == "about_online_level_list")
			{
				menu_delay = 3;
				menu = "about";
			}
			else
			if (menu == "about_link_to_website")
			{
				menu_delay = 3;
				menu = "about_online_level_list";
			}
			else
			if (menu == "about_link_to_website_guide")
			{
				menu_delay = 3;
				menu = "about_link_to_website";
			}
			else
			if (menu == "about_link_to_update_schedule")
			{
				menu_delay = 3;
				menu = "about_link_to_website_guide";
			}
			else
			if (menu == "information_back")
			&& (information_menu_open == "about")
			{
				menu_delay = 3;
				menu = "about_link_to_update_schedule";
			}
			else
			if (menu == "information_back")
			&& (information_menu_open == "whats_new")
			{
				menu_delay = 3;
				menu = "changelog_history";
			}
			else
			if (menu == "changelog_history")
			{
				menu_delay = 3;
				menu = "whats_new";
			}
			else
			if (menu == "information_back")
			&& (information_menu_open == "backups")
			{
				menu_delay = 3;
				if (global.enable_option_for_pc)
				{
					menu = "backup_open_custom_character_folder";
				}
				else
				{
					menu = "backups";
				}
			}
			else
			if (menu == "backup_open_custom_levels_folder")
			{
				menu_delay = 3;
				menu = "backups";
			}
			else
			if (menu == "backup_open_custom_character_folder")
			{
				menu_delay = 3;
				if (global.enable_option_for_pc)
				{
					menu = "backup_open_custom_levels_folder";
				}
				else
				{
					menu = "backups";
				}
			}
		}
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "information_back")
			{
				menu_delay = 3;
				if (information_menu_open == "about")
				{
					menu = "about";
				}
				else
				if (information_menu_open == "whats_new")
				{
					menu = "whats_new";
				}
				else
				if (information_menu_open == "backups")
				{
					menu = "backups";
				}
				else
				if (information_menu_open == "credits")
				{
					menu = "credits";
				}
				else
				if (information_menu_open == "links")
				{
					menu = "links";
				}
			}
			else
			if (menu == "about")
			{
				menu_delay = 3;
				menu = "about_online_level_list";
			}
			else
			if (menu == "about_online_level_list")
			{
				menu_delay = 3;
				menu = "about_link_to_website";
			}
			else
			if (menu == "about_link_to_website")
			{
				menu_delay = 3;
				menu = "about_link_to_website_guide";
			}
			else
			if (menu == "about_link_to_website_guide")
			{
				menu_delay = 3;
				menu = "about_link_to_update_schedule";
			}
			else
			if (menu == "about_link_to_update_schedule")
			{
				menu_delay = 3;
				menu = "information_back";
			}
			else
			if (menu == "whats_new")
			{
				menu_delay = 3;
				menu = "changelog_history";
			}
			else
			if (menu == "changelog_history")
			{
				menu_delay = 3;
				menu = "information_back";
			}
			else
			if (menu == "backups")
			{
				menu_delay = 3;
				if (global.enable_option_for_pc)
				{
					menu = "backup_open_custom_levels_folder";
				}
				else
				{
					menu = "information_back";
				}
			}
			else
			if (menu == "backup_open_custom_levels_folder")
			{
				menu_delay = 3;
				if (global.enable_option_for_pc)
				{
					menu = "backup_open_custom_character_folder";
				}
				else
				{
					menu = "information_back";
				}
			}
			else
			if (menu == "backup_open_custom_character_folder")
			{
				menu_delay = 3;
				menu = "information_back";
			}
		}
		
		#region /* About, What's New, Backups, Credits, and Back tabs */
		
		/* About tab button */
		draw_menu_button_sprite(spr_menu_button, 0, 0, 0, 0, 0.5, 1, 185, 42, l10n_text("About"), "about", "about", false);
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 185, 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "about")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			information_menu_open = "about";
			menu_delay = 3;
		}
		
		/* What's New tab button */
		if (!latest_whats_new_read)
		{
			var whats_new_alpha = scr_wave(0, 1, 1);
		}
		else
		{
			var whats_new_alpha = 1;
		}
		draw_menu_button_sprite(spr_menu_button, 185, 0, 0, 0, 0.5, 1, 185, 42, l10n_text("What's New?"), "whats_new", "whats_new", false,,whats_new_alpha);
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 185, 0, 185 * 2, 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "whats_new")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			information_menu_open = "whats_new";
			menu_delay = 3;
		}
		
		/* Backups tab button */
		draw_menu_button_sprite(spr_menu_button, 185 * 2, 0, 0, 0, 0.5, 1, 185, 42, l10n_text("Backups"), "backups", "backups", false);
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 185 * 2, 0, 185 * 3, 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "backups")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			information_menu_open = "backups";
			menu_delay = 3;
		}
		
		/* Credits tab button */
		draw_menu_button_sprite(spr_menu_button, 185 * 3, 0, 0, 0, 0.5, 1, 185, 42, l10n_text("Credits"), "credits", "credits", false);
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 185 * 3, 0, 185 * 4, 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "credits")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			information_menu_open = "credits";
			menu_delay = 3;
		}
		
		/* Links tab button */
		draw_menu_button_sprite(spr_menu_button, 185 * 4, 0, 0, 0, 0.5, 1, 185, 42, l10n_text("Links"), "links", "links", false);
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 185 * 4, 0, 185 * 5, 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "links")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			information_menu_open = "links";
			menu_delay = 3;
		}
		
		/* Back from Information Menu */
		draw_menu_button(display_get_gui_width() - 370, display_get_gui_height() - 42, l10n_text("Back"), "information_back", "information_back");
		draw_sprite_ext(spr_icon_back, 0, display_get_gui_width() - 354, display_get_gui_height() - 21, 1, 1, 0, c_white, 1);
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 370, display_get_gui_height() - 42, display_get_gui_width(), display_get_gui_height()))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "information_back")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (instance_exists(obj_credits))
			{
				instance_destroy(obj_credits);
			}
			information_menu_open = "";
			menu = "information";
			menu_delay = 3;
		}
		
		#endregion /* About, What's New, Backups, Credits, and Back tabs */
		
		if (information_menu_open == "about") /* About tab */
		{
			var welcome_to_game_y = 32 * 2;
			var this_is_a_game_y = 32 * 3;
			var to_share_levels_y = 32 * 4;
			var to_browse_levels_y = 32 * 5;
			var online_level_list_button_y = 32 * 6 + 5;
			var check_out_website_y = 42 * 6;
			var check_out_guide_y = 42 * 8;
			var check_out_update_schedule_y = 42 * 10;
			
			draw_set_halign(fa_center);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, welcome_to_game_y, l10n_text("Welcome to " + string(global.game_name) + "!"), global.default_text_size, c_black, c_white, 1);
			draw_set_halign(fa_left);
			scr_draw_text_outlined(32, this_is_a_game_y, l10n_text("This is a game that allows you to create your own levels"), global.default_text_size, c_black, c_white, 1);
			
			scr_draw_text_outlined(32, to_share_levels_y, l10n_text("To share levels press the Upload button in level editor"), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(32, to_browse_levels_y, l10n_text("To browse levels press the Online Level List button in level editor"), global.default_text_size, c_black, c_white, 1);
			draw_menu_button(32, online_level_list_button_y, l10n_text("Online Level List"), "about_online_level_list", "about_online_level_list");
			
			#region /* Click Online Level List button in About tab */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 32, online_level_list_button_y, 370 + 32, online_level_list_button_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (menu == "about_online_level_list")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.online_enabled)
				{
					/* Go to online level list, so you can browse all uploaded levels, instead of just searching for specific levels */
					select_custom_level_menu_open = false;
					content_type = "level"; /* Need to set the "content type" to "level", so Async - HTTP Event is running correctly */
					global.selected_online_download_index = 1;
					menu = "online_download_list_load";
					information_menu_open = "";
					var any_player_can_play = false;
					for(var i = 1; i <= global.max_players; i += 1) {
						if (global.player_can_play[i]) { /* Check if any player can play */
					        any_player_can_play = true;
					        break; /* exit the loop if any player can play */
					    }
					}
					if (!any_player_can_play) { /* If no player can play, set "player can play" to true */
					    global.player_can_play[fixed_player] = true;
					}
				}
				else
				{
					information_menu_open = ""; /* Disable information menu so you can't accidentally navigate information menu when navigating online caution menu */
					content_type = "level"; /* Need to set the "content type" to "level", so Async - HTTP Event is running correctly */
					caution_online_takes_you_to = "online_download_list_load";
					caution_online_takes_you_back_to = "about_online_level_list";
					menu = "caution_online_proceed";
					menu_delay = 3;
				}
			}
			#endregion /* Click Online Level List button in About tab END */
			
			if (global.link_to_website != "")
			{
				draw_set_halign(fa_left);
				scr_draw_text_outlined(32, check_out_website_y + 20, l10n_text("Check out our website") + ":", global.default_text_size, c_black, c_white, 1);
				draw_menu_button(string_width(l10n_text("Check out our website") + ":"), check_out_website_y, string(global.link_to_website), "about_link_to_website", "about_link_to_website");
				if (point_in_rectangle(mouse_get_x, mouse_get_y, string_width(l10n_text("Check out our website") + ":"), check_out_website_y, 370 + string_width(l10n_text("Check out our website") + ":"), check_out_website_y + 42))
				&& (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (menu == "about_link_to_website")
				&& (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					url_open(global.link_to_website);
					menu_delay = 3;
				}
			}
			
			if (global.link_to_website_guide != "")
			{
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(32, check_out_guide_y, l10n_text("Check out the guide") + ":", global.default_text_size, c_black, c_white, 1);
				draw_menu_button_sprite(spr_menu_button, 32, check_out_guide_y + 20, 0, 0, 2, 1, 370 * 2, 42, string(global.link_to_website_guide), "about_link_to_website_guide", "about_link_to_website_guide");
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 32, check_out_guide_y + 20, 32 + (370 * 2), check_out_guide_y + 20 + 42))
				&& (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (menu == "about_link_to_website_guide")
				&& (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					url_open(global.link_to_website_guide);
					menu_delay = 3;
				}
			}
			
			if (global.link_to_update_schedule != "")
			{
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(32, check_out_update_schedule_y, l10n_text("Check out the update schedule") + ":", global.default_text_size, c_black, c_white, 1);
				draw_menu_button_sprite(spr_menu_button, 32, check_out_update_schedule_y + 20, 0, 0, 2.1, 1, 370 * 2.1, 42, string(global.link_to_update_schedule), "about_link_to_update_schedule", "about_link_to_update_schedule");
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 32, check_out_update_schedule_y + 20, 32 + (370 * 2.1), check_out_update_schedule_y + 20 + 42))
				&& (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (menu == "about_link_to_update_schedule")
				&& (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					url_open(global.link_to_update_schedule);
					menu_delay = 3;
				}
			}
			
			draw_set_halign(fa_left);
			draw_sprite_ext(spr_heart, 0, 48, display_get_gui_height() - 64, 1, 1, 0, c_white, 1);
			scr_draw_text_outlined(48 + 16 + 8, display_get_gui_height() - 64, l10n_text("This is a game made with love"), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(32, display_get_gui_height() - 32, l10n_text("Check out credits for more info"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (information_menu_open == "whats_new") /* What's New tab */
		{
			
			/* Update config file so the game knows that you've read the latest what's new tab */
			if (menu_delay == 1)
			{
				latest_whats_new_read = true;
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_string("config", "latest_whats_new_version", "v" + scr_get_build_date());
				ini_write_string("config", "latest_whats_new_text", string(global.whats_new));
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			
			var build_version_y = 32 * 2;
			var whats_new_date_y = 32 * 2;
			var changelog_history_y = 32 * 3;
			var whats_new_text_y = 32 * 5;
			
			draw_set_halign(fa_left);
			scr_draw_text_outlined(8, build_version_y, l10n_text("Build version") + ": v" + scr_get_build_date() + " " + l10n_text("is here!"), global.default_text_size, c_black, c_white, 1);
			
			var day = date_get_day(GM_build_date);
			var month = date_get_month(GM_build_date);
			var year = date_get_year(GM_build_date);
			var hour = date_get_hour(GM_build_date);
			var minute = date_get_minute(GM_build_date);
			var second = date_get_second(GM_build_date);
			draw_set_halign(fa_right);
			scr_draw_text_outlined(display_get_gui_width() - 8, whats_new_date_y, l10n_text("Build date") + ": " + string(year) + "-" + string(month) + "-" + string(day) + " " + string(hour) + ":" + string(minute) + ":" + string(second), global.default_text_size, c_black, c_white, 1);
			
			if (global.link_to_changelog_history != "")
			{
				draw_menu_button_sprite(spr_menu_button, string_width(l10n_text("Changelog History") + ":"), changelog_history_y - 8, 0, 0, 1.9, 1, 370 * 1.9, 42, string(global.link_to_changelog_history), "changelog_history", "changelog_history");
				draw_set_halign(fa_left);
				scr_draw_text_outlined(32, changelog_history_y + 10, l10n_text("Changelog History") + ":", global.default_text_size, c_black, c_white, 1);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, string_width(l10n_text("Changelog History") + ":"), changelog_history_y - 8, string_width(l10n_text("Changelog History") + ":") + (370 * 1.9), changelog_history_y + 42 - 8))
				&& (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (menu == "changelog_history")
				&& (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					url_open(global.link_to_changelog_history);
					menu_delay = 3;
				}
			}
			
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			scr_draw_text_outlined(32, whats_new_text_y, global.whats_new, global.default_text_size, c_black, c_white, 1);
			draw_set_valign(fa_middle);
		}
		else
		if (information_menu_open == "backups") /* Backups tab */
		{
			draw_set_halign(fa_center);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 32 * 2, l10n_text("Keep your levels safe!"), global.default_text_size, c_black, c_white, 1);
			
			draw_set_halign(fa_left);
			scr_draw_text_outlined(32, 32 * 4, l10n_text("To prevent losing your custom levels and characters you should upload content and then save\nyour level IDs and character IDs somewhere safe"), global.default_text_size * 0.9, c_black, c_white, 1);
			scr_draw_text_outlined(32, 32 * 7, l10n_text("The game includes an autosave feature that automatically saves your level every 5 minutes"), global.default_text_size * 0.9, c_black, c_white, 1);
			scr_draw_text_outlined(32, 32 * 8, l10n_text("It also saves your level every time you playtest"), global.default_text_size, c_black, c_white, 1);
			if (global.enable_option_for_pc)
			{
				scr_draw_text_outlined(32, 32 * 10, l10n_text("Your custom levels are saved in this folder") + ":", global.default_text_size, c_black, c_white, 1);
				
				#region /* Open Custom Levels Folder */
				var draw_open_custom_levels_folder_y = 32 * 11;
				draw_menu_button(32, draw_open_custom_levels_folder_y, l10n_text("Open Custom Levels Folder"), "backup_open_custom_levels_folder", "backup_open_custom_levels_folder");
				draw_sprite_ext(spr_icon_folder, 0, 32 + 16, draw_open_custom_levels_folder_y + 21, 1, 1, 0, c_white, 1);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 32, draw_open_custom_levels_folder_y + 2, 32 + 370, draw_open_custom_levels_folder_y + 41))
				&& (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (menu == "backup_open_custom_levels_folder")
				&& (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_open_folder(game_save_id + "\custom_levels")
				}
				#endregion /* Open Custom Levels Folder END */
				
				draw_set_halign(fa_left);
				scr_draw_text_outlined(32, 32 * 13, l10n_text("Your custom characters are saved in this folder") + ":", global.default_text_size, c_black, c_white, 1);
				
				#region /* Open Custom Levels Folder */
				var draw_open_custom_levels_folder_y = 32 * 14;
				draw_menu_button(32, draw_open_custom_levels_folder_y, l10n_text("Open Custom Character Folder"), "backup_open_custom_character_folder", "backup_open_custom_character_folder");
				draw_sprite_ext(spr_icon_folder, 0, 32 + 16, draw_open_custom_levels_folder_y + 21, 1, 1, 0, c_white, 1);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 32, draw_open_custom_levels_folder_y + 2, 32 + 370, draw_open_custom_levels_folder_y + 41))
				&& (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (menu == "backup_open_custom_character_folder")
				&& (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_open_folder(game_save_id + "\custom_characters")
				}
				#endregion /* Open Custom Levels Folder END */
				
			}
		}
		else
		if (information_menu_open == "credits") /* Credits tab */ 
		{
			
			#region /* Play Credits */
			if (!instance_exists(obj_credits))
			{
				instance_create_depth(x, y, 0, obj_credits);
			}
			#endregion /* Play Credits END */
			
		}
		else if (information_menu_open == "links") { /* Links tab */ 
			scr_draw_links_menu();
		}
	}
	#endregion /* Information menu END */
	
}