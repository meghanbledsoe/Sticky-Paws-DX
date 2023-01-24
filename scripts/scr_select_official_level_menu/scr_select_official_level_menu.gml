function scr_select_official_level_menu()
{
	if (window_get_width() >= 1670)
	{
		row = 4;
	}
	else
	if (window_get_width() >= 1276)
	{
		row = 3;
	}
	else
	if (window_get_width() >= 882)
	{
		row = 2;
	}
	else
	if (window_get_width() >= 488)
	{
		row = 1;
	}
	column = clamp(floor(global.select_level_index / row), 0, floor(ds_list_size(global.all_loaded_main_levels)))
	
	#region /* Navigate Menu */
	
	#region /* Key Up */
	if (key_up)
	or (mouse_wheel_up())
	{
		if (can_input_level_name == false)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (menu != "back_from_level_editor")
		{
			if (global.select_level_index - row < 0)
			and (global.controls_used_for_menu_navigation != "mouse")
			and (show_level_editor_corner_menu == true)
			{
				menu_delay = 3;
				menu = "back_from_level_editor";
			}
			else
			if (global.select_level_index - row > - 1)
			{
				global.select_level_index -= clamp(row, 0, ds_list_size(global.all_loaded_main_levels - 2 / row));
				menu_delay = 3;
				if (mouse_wheel_up())
				{
					scroll_to = scroll - 1;
				}
				else
				{
					scroll_to = floor(global.select_level_index / row);
				}
				lerp_on = true;
			}
		}
	}
	#endregion /* Key Up END */
	
	else
	
	#region /* Key Down */
	if (key_down)
	or (mouse_wheel_down())
	{
		if (can_input_level_name == false)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (menu != "back_from_level_editor")
		{
			if (global.select_level_index + row > ds_list_size(global.thumbnail_sprite) - 1)
			and (global.controls_used_for_menu_navigation != "mouse")
			and (show_level_editor_corner_menu == true)
			{
				menu_delay = 3;
				menu = "back_from_level_editor";
			}
			else
			if (global.select_level_index + row < ds_list_size(global.thumbnail_sprite))
			{
				global.select_level_index += clamp(row, 0, ds_list_size(global.all_loaded_main_levels - 2 / row));
				menu_delay = 3;
				if (mouse_wheel_down())
				{
					scroll_to = scroll + 1
				}
				else
				{
					scroll_to = floor(global.select_level_index / row);
				}
				lerp_on = true;
			}
		}
	}
	#endregion /* Key Down END */
	
	else
	
	#region /* Key Left */
	if (key_left)
	and (can_input_level_name == false)
	and (menu_delay == 0)
	and (menu_joystick_delay <= 0)
	and (menu != "back_from_level_editor")
	{
		if (global.select_level_index - 1 < 0)
		{
			global.select_level_index = ds_list_size(global.thumbnail_sprite) - 1;
		}
		else
		{
			global.select_level_index -= 1;
		}
		menu_delay = 3;
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
	}
	#endregion /* Key Left END */
	
	else
	
	#region /* Key Right */
	if (key_right)
	and (can_input_level_name == false)
	and (menu_delay == 0)
	and (menu_joystick_delay <= 0)
	and (menu != "back_from_level_editor")
	{
		if (global.select_level_index + 1 > ds_list_size(global.thumbnail_sprite) - 1)
		{
			global.select_level_index = 0;
		}
		else
		{
			global.select_level_index += 1;
		}
		menu_delay = 3;
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
	}
	#endregion /* Key Right END */
	
	#region /* Key A */
	if (key_a_pressed)
	or (mouse_check_button_pressed(mb_left))
	{
		if (menu == "level_editor_play")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			scroll_to = floor(global.select_level_index / row);
			lerp_on = true;
			menu_delay = 3;
			global.level_name = "";
			keyboard_string = "";
			can_input_level_name = true;
		}
	}
	#endregion /* Key A END */
	
	#endregion /* Navigate Menu END */
	
	scr_draw_level_editor_thumbnail(global.all_loaded_main_levels, true);
	
	column = floor(global.select_level_index / row); /* Do this code again here so the sub menu doesn't get misaligned */
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, window_get_width(), 116, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	if (window_get_width() <= 1350)
	{
		scr_draw_text_outlined(window_get_width() / 2 + 128, 50, l10n_text("Select Template Level"), global.default_text_size * 2, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(window_get_width() / 2, 50, l10n_text("Select Template Level"), global.default_text_size * 2, c_black, c_white, 1);
	}
	
	//scr_draw_text_outlined(window_get_width() / 2, 50, l10n_text("Select Template Level"), global.default_text_size * 2, c_black, c_white, 1);
	scr_draw_text_outlined(window_get_width() / 2, 100, l10n_text("These are official levels from the game. Learn how these levels were made!"), global.default_text_size, c_black, c_white, 1);
	
	#region /* Back Button */
	draw_menu_button(0, 0, l10n_text("Back"), "back_from_level_editor", "back_from_level_editor");
	draw_sprite_ext(spr_icons_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
	
	if (menu == "back_from_level_editor")
	and (key_a_pressed)
	and (menu_delay == 0)
	and (can_input_level_name == false)
	or (key_b_pressed)
	and (menu_delay == 0)
	and (can_input_level_name == false)
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, 0, 320, 42))
	and (mouse_check_button_pressed(mb_left))
	{
		can_input_level_name = false;
		menu_delay = 3;
		open_sub_menu = false;
		can_navigate = true;
		select_custom_level_menu_open = false;
		level_editor_template_select = false;
		scr_load_custom_level_initializing();
		global.select_level_index = 0;
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
		menu = "load_custom_level";
	}
	if (menu == "back_from_level_editor")
	and (key_up)
	and (menu_delay == 0)
	and (menu_joystick_delay <= 0)
	{
		menu_delay = 3;
		can_navigate = true;
		select_custom_level_menu_open = true;
		menu = "level_editor_play";
		if (global.select_level_index - row < 0)
		{
			global.select_level_index = ds_list_size(global.thumbnail_sprite) - 1;
		}
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
	}
	if (menu == "back_from_level_editor")
	and (key_down)
	and (menu_delay == 0)
	and (menu_joystick_delay <= 0)
	{
		menu_delay = 3;
		can_navigate = true;
		select_custom_level_menu_open = true;
		menu = "level_editor_play";
		global.select_level_index = 0;
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
	}
	#endregion /* Back Button END */
	
	#region /* Input Level Name */
	
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	
	#region /* Opaque transparent black box */
	if (can_input_level_name == true)
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	#endregion /* Opaque transparent black box END */
	
	#region /* Box where name is written on */
	if (can_input_level_name == true)
	{
		draw_set_alpha(1);
		draw_rectangle_color(394 * (global.select_level_index - column * row) + 300 - 3 - 150, 226 * (column - scroll) + 569 - 3 - 16, 394 * (global.select_level_index - column * row) + 300 - 3 + 150, 226 * (column - scroll) + 569 - 3 + 16, c_white, c_white, c_white, c_white, false);
	
		draw_set_alpha(1);
		draw_rectangle_color(394 * (global.select_level_index - column * row) + 300 - 3 - 150, 226 * (column - scroll) + 569 - 3 - 16, 394 * (global.select_level_index - column * row) + 300 - 3 + 150, 226 * (column - scroll) + 569 - 3 + 16, c_black, c_black, c_black, c_black, true);
	}
	#endregion /* Box where name is written on END */
	
	#region /* Inputed Name Text */
	if (can_input_level_name == true)
	{
		if (name_enter_blink< 1)
		{
			scr_draw_text_outlined(394 * (global.select_level_index - column * row) + 300, 226 * (column - scroll) + 569 - 3, string(global.level_name) + "|", global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(394 * (global.select_level_index - column * row) + 300, 226 * (column - scroll) + 569 - 3, string(global.level_name), global.default_text_size, c_black, c_white, 1);
		}
	}
	#endregion /* Inputed Name Text END */
	
	#region /* INPUT LEVEL NAME NOW */
	if (can_input_level_name == true)
	{
		keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_words, true); /* Show virtual keyboard on mobile devices */
		
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		var _key = keyboard_lastchar;
		if (ord(_key) != ord("\\"))
		and (ord(_key) != ord("/"))
		and (ord(_key) != ord(":"))
		and (ord(_key) != ord("*"))
		and (ord(_key) != ord("?"))
		and (ord(_key) != ord("\""))
		and (ord(_key) != ord("<"))
		and (ord(_key) != ord(">"))
		and (ord(_key) != ord("|"))
		{
			global.level_name = keyboard_string;
		}
		else
		{
			keyboard_string = string_copy(global.level_name, 1, 120);
		}
		
		#region /* Limit Name Input Length for Level */
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		if (string_length(global.level_name) >= 120)
		{
			scr_draw_text_outlined(394 * (global.select_level_index - column * row) + 400, 226 * (column - scroll) + 606, "120/ 120", global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(394 * (global.select_level_index - column * row) + 400, 226 * (column - scroll) + 606, string(string_length(global.level_name)) + "/ 120", global.default_text_size, c_black, c_ltgray, 1);
		}
		
		#region /* OK and Cancel buttons under name input */
		if (keyboard_string != "")
		{
			draw_menu_button(394 * (global.select_level_index - column * row) + 100, 226 * (column - scroll) + 606 + 32, l10n_text("OK"), "level_editor_enter_name_ok", "level_editor_enter_name_ok");
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_face1, 394 * (global.select_level_index - column * row) + 440, 226 * (column - scroll) + 606 + 21 + 32, 0.5, c_white, 1);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				draw_sprite_ext(spr_keyboard_keys, vk_enter, 394 * (global.select_level_index - column * row) + 440, 226 * (column - scroll) + 606 + 21 + 32, 0.5, 0.5, 0, c_white, 1);
			}
		}
		draw_menu_button(394 * (global.select_level_index - column * row) + 100, 226 * (column - scroll) + 606 + 74, l10n_text("Cancel"), "level_editor_enter_name_cancel", "level_editor_enter_name_cancel");
		if (gamepad_is_connected(0))
		and (global.controls_used_for_menu_navigation == "controller")
		{
			scr_draw_gamepad_buttons(gp_face2, 394 * (global.select_level_index - column * row) + 440, 226 * (column - scroll) + 606 + 74 + 22, 0.5, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, vk_escape, 394 * (global.select_level_index - column * row) + 440, 226 * (column - scroll) + 606 + 74 + 22, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /* OK and Cancel buttons under name input END */
		
		if (string_length(global.level_name) > 120)
		{
			global.level_name = string_copy(global.level_name, 1, 120);
		}
		#endregion /* Limit Name Input Length for Name END */
		
	}
	#endregion /* INPUT LEVEL NAME NOW END */
	
	#region /* Name Enter Blinking */
	name_enter_blink+= 0.05;
	if (name_enter_blink > 1.5)
	{
		name_enter_blink = 0;
	}
	#endregion /* Name Enter Blinking END */
	
	#region /* Press Enter to make new level from template */
	if (keyboard_check_pressed(vk_enter))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	and (keyboard_string != "")
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - column * row) + 100, 226 * (column - scroll) + 606 + 32, 394 * (global.select_level_index - column * row) + 100 + 370, 226 * (column - scroll) + 606 + 32 + 42))
	and (mouse_check_button_pressed(mb_left))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	and (keyboard_string != "")
	or (gamepad_button_check_pressed(0, gp_face1))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	and (keyboard_string != "")
	or (gamepad_button_check_pressed(1, gp_face1))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	and (keyboard_string != "")
	or (gamepad_button_check_pressed(2, gp_face1))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	and (keyboard_string != "")
	or (gamepad_button_check_pressed(3, gp_face1))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	and (keyboard_string != "")
	{
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
		global.create_level_from_template = true;
		can_navigate = false;
		menu_delay = 9999;
		
		#region /* Create directories */
		if (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name)))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name));
		}
		if (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds"))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds");
		}
		if (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data"))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/data");
		}
		if (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/sound"))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/sound");
		}
		if (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets"))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets");
		}
		#endregion /* Create directories END */
		
		#region /* Copy files from official levels to level editor */
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background1.png"))
		{
			file_copy(
			"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background1.png",
			working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/background1.png");
		}
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background2.png"))
		{
			file_copy(
			"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background2.png",
			working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/background2.png");
		}
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background3.png"))
		{
			file_copy(
			"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background3.png",
			working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/background3.png");
		}
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background4.png"))
		{
			file_copy(
			"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background4.png",
			working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/background4.png");
		}
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground1.png"))
		{
			file_copy(
			"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground1.png",
			working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/foreground1.png");
		}
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png"))
		{
			file_copy(
			"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png",
			working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/foreground_above_static_objects.png");
		}
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground2.png"))
		{
			file_copy(
			"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground2.png",
			working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/foreground2.png");
		}
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png"))
		{
			file_copy(
			"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png",
			working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/foreground_secret.png");
		}
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience.ogg"))
		{
			file_copy(
			"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience.ogg",
			working_directory + "/custom_levels/" + string(global.level_name) + "/sound/ambience.ogg");
		}
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/clear_jingle.ogg"))
		{
			file_copy(
			"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/clear_jingle.ogg",
			working_directory + "/custom_levels/" + string(global.level_name) + "/sound/clear_jingle.ogg");
		}
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music.ogg"))
		{
			file_copy(
			"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music.ogg",
			working_directory + "/custom_levels/" + string(global.level_name) + "/sound/music.ogg");
		}
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png"))
		{
			file_copy(
			"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png",
			working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets/tileset_default.png");
		}
		#endregion /* Copy files from official levels to level editor END */
		
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				iris_zoom = 0;
			}
		}
		can_input_level_name = false;
	}
	#endregion /* Press Enter to make new level from template END */
	
	#region /* Press Escape to back out from level from scratch menu */
	if (keyboard_check_pressed(vk_escape))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - column * row) + 100, 226 * (column - scroll) + 606 + 74, 394 * (global.select_level_index - column * row) + 100 + 370, 226 * (column - scroll) + 606 + 74 + 42))
	and (mouse_check_button_pressed(mb_left))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (mouse_check_button_pressed(mb_right))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (gamepad_button_check_pressed(0, gp_face2))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (gamepad_button_check_pressed(1, gp_face2))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (gamepad_button_check_pressed(2, gp_face2))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (gamepad_button_check_pressed(3, gp_face2))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	{
		menu_delay = 3;
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				iris_zoom = 0;
			}
		}
		can_input_level_name = false;
		menu = "level_editor_play";
	}
	#endregion /* Press Escape to back out from level from scratch menu END */
	
	#endregion /* Input Level Name END */
	
	#region /* Enter Template Level */
	if (iris_xscale <= 0.001)
	and (global.character_select_in_this_menu == "level_editor")
	{
		if (asset_get_type("room_leveleditor") == asset_room)
		{
			sprite_delete(title_screen_background);
			
			#region /* Update All Backgrounds */
			
			sprite_delete(global.custom_background1);
			sprite_delete(global.custom_background2);
			sprite_delete(global.custom_background3);
			sprite_delete(global.custom_background4);
			sprite_delete(global.custom_foreground1);
			sprite_delete(global.custom_foreground_above_static_objects);
			sprite_delete(global.custom_foreground2);
			sprite_delete(global.custom_foreground_secret);
			
			#region /* Update Background1 */
			/* BMP small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background1.bmp")){global.custom_background1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background1.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_vtiled(0, true);}else
			/* BMP big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background1.bmp")){global.custom_background1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background1.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background1.png")){global.custom_background1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background1.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background1.png")){global.custom_background1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background1.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background1.gif")){global.custom_background1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background1.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background1.gif")){global.custom_background1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background1.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background1.jpg")){global.custom_background1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background1.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background1.jpg")){global.custom_background1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background1.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			{
				global.custom_background1 = noone;
			}
			#endregion /* Update Background1 END */
			
			#region /* Update Background2 */
			/* BMP small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background2.bmp")){global.custom_background2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background2.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_vtiled(0, true);}else
			/* BMP big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background2.bmp")){global.custom_background2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background2.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background2.png")){global.custom_background2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background2.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background2.png")){global.custom_background2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background2.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background2.gif")){global.custom_background2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background2.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background2.gif")){global.custom_background2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background2.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background2.jpg")){global.custom_background2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background2.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background2.jpg")){global.custom_background2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background2.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			{
				global.custom_background2 = noone;
			}
			#endregion /* Update Background2 END */
			
			#region /* Update Background3 */
			/* BMP small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background3.bmp")){global.custom_background3 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background3.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_vtiled(0, true);}else
			/* BMP big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background3.bmp")){global.custom_background3 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background3.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background3.png")){global.custom_background3 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background3.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background3.png")){global.custom_background3 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background3.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background3.gif")){global.custom_background3 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background3.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background3.gif")){global.custom_background3 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background3.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background3.jpg")){global.custom_background3 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background3.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background3.jpg")){global.custom_background3 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background3.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			{
				global.custom_background3 = noone;
			}
			#endregion /* Update Background3 END */
			
			#region /* Update Background4 */
			/* BMP small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background4.bmp")){global.custom_background4 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background4.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_vtiled(0, true);}else
			/* BMP big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background4.bmp")){global.custom_background4 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background4.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background4.png")){global.custom_background4 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background4.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background4.png")){global.custom_background4 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background4.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background4.gif")){global.custom_background4 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background4.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background4.gif")){global.custom_background4 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background4.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG small letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background4.jpg")){global.custom_background4 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background4.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG big letter File */if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background4.jpg")){global.custom_background4 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Background4.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			{
				global.custom_background4 = noone;
			}
			#endregion /* Update Background4 END */
						
			#region /* Update Foreground1 */
			
			#region /* BMP small letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP small letter File END */
			
			#region /* BMP big letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP big letter File END */
			
			#region /* PNG small letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground1.png"))
			{
				global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG small letter File END */
			
			#region /* PNG big letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground1.png"))
			{
				global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG big letter File END */
			
			#region /* GIF small letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF small letter File END */
			
			#region /* GIF big letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF big letter File END */
			
			#region /* JPG small letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG small letter File END */
			
			#region /* JPG big letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG big letter File END */
			
			{
				global.custom_foreground1 = noone;
			}
			
			#endregion /* Update Foreround1 END */
			
			#region /* Update Foreground above static objects official */
			
			#region /* BMP small letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.bmp"))
			{
				global.custom_foreground_above_static_objects = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP small letter File END */
			
			#region /* BMP big letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.bmp"))
			{
				global.custom_foreground_above_static_objects = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP big letter File END */
			
			#region /* PNG small letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png"))
			{
				global.custom_foreground_above_static_objects = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG small letter File END */
			
			#region /* PNG big letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.png"))
			{
				global.custom_foreground_above_static_objects = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG big letter File END */
			
			#region /* GIF small letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.gif"))
			{
				global.custom_foreground_above_static_objects = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF small letter File END */
			
			#region /* GIF big letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.gif"))
			{
				global.custom_foreground_above_static_objects = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF big letter File END */
			
			#region /* JPG small letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.jpg"))
			{
				global.custom_foreground_above_static_objects = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG small letter File END */
			
			#region /* JPG big letter File */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.jpg"))
			{
				global.custom_foreground_above_static_objects = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG big letter File END */
			
			{
				global.custom_foreground_above_static_objects = noone;
			}
			
			#endregion /* Update Foreround above static objects official END */
			
			#region /* Update Foreground2 */
			
			#region /* BMP small letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP small letter File END */
			
			#region /* BMP big letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP big letter File END */
			
			#region /* PNG small letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground2.png")
			{
				global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG small letter File END */
			
			#region /* PNG big letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground2.png")
			{
				global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG big letter File END */
			
			#region /* GIF small letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground2.gif")
			{
				global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF small letter File END */
			
			#region /* GIF big letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground2.gif")
			{
				global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF big letter File END */
			
			#region /* JPG small letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG small letter File END */
			
			#region /* JPG big letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG big letter File END */
			
			{
				global.custom_foreground2 = noone;
			}
			
			#endregion /* Update Foreround2 END */
			
			#region /* Update Foreground secret */
			
			#region /* BMP small letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_secret.bmp")
			{
				global.custom_foreground_secret = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_secret.bmp", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /* BMP small letter File END */
			
			#region /* BMP big letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.bmp")
			{
				global.custom_foreground_secret = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.bmp", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /* BMP big letter File END */
			
			#region /* PNG small letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png")
			{
				global.custom_foreground_secret = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /* PNG small letter File END */
			
			#region /* PNG big letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.png")
			{
				global.custom_foreground_secret = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.png", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /* PNG big letter File END */
			
			#region /* GIF small letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_secret.gif")
			{
				global.custom_foreground_secret = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_secret.gif", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /* GIF small letter File END */
			
			#region /* GIF big letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.gif")
			{
				global.custom_foreground_secret = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.gif", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /* GIF big letter File END */
			
			#region /* JPG small letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_secret.jpg")
			{
				global.custom_foreground_secret = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_secret.jpg", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /* JPG small letter File END */
			
			#region /* JPG big letter File */
			if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.jpg")
			{
				global.custom_foreground_secret = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.jpg", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			else
			#endregion /* JPG big letter File END */
			
			{
				global.custom_foreground_secret = noone;
			}
			
			#endregion /* Update Foreround secret END */
			
			#endregion /* Update All Backgrounds END */
			
			#region /* Level Tileset File */
			sprite_delete(global.custom_tileset);
			
			if (global.character_select_in_this_menu == "level_editor")
			and (global.create_level_from_template >= true)
			and (global.level_name != "")
			and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets/tileset_default.png"))
			{
				global.custom_tileset = sprite_add(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets/tileset_default.png", 0, false, false, 0, 0);
			}
			else
			{
				global.custom_tileset = noone;
			}
			#endregion /* Level Tileset File END */
			
			room_goto(room_leveleditor);
		}
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
	}
	#endregion /* Enter Template Level END */
	
}