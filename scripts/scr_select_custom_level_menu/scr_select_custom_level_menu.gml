function scr_select_custom_level_menu()
{
	if (os_type == os_linux)
	{
		var show_delete_button = false;
	}
	else
	{
		var show_delete_button = true;
	}
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
	column = clamp(floor(global.select_level_index / row), 0, floor(ds_list_size(global.all_loaded_custom_levels)))
	
	#region /* Navigate Menu */
	
	#region /* Key Up */
	if (key_up)
	or (mouse_wheel_up())
	{
		if (can_input_level_name == false)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (open_sub_menu == false)
		and (menu != "back_from_level_editor")
		and (menu != "open_custom_levels_folder")
		{
			if (global.select_level_index - row < 0)
			and (global.controls_used_for_menu_navigation != "mouse")
			{
				menu_delay = 3;
				menu = "open_custom_levels_folder";
			}
			else
			if (global.select_level_index - row > - 1)
			{
				global.select_level_index -= clamp(row, 0, ds_list_size(global.all_loaded_custom_levels - 2 / row));
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
		and (open_sub_menu == false)
		and (menu != "back_from_level_editor")
		and (menu != "open_custom_levels_folder")
		{
			if (global.select_level_index + row > ds_list_size(global.thumbnail_sprite) - 1)
			and (global.controls_used_for_menu_navigation != "mouse")
			{
				menu_delay = 3;
				menu = "back_from_level_editor";
			}
			else
			if (global.select_level_index + row < ds_list_size(global.thumbnail_sprite))
			{
				global.select_level_index += clamp(row, 0, ds_list_size(global.all_loaded_custom_levels - 2 / row));
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
	and (open_sub_menu == false)
	and (menu != "back_from_level_editor")
	and (menu != "open_custom_levels_folder")
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
	and (open_sub_menu == false)
	and (menu != "back_from_level_editor")
	and (menu != "open_custom_levels_folder")
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
	
	else
	
	#region /* Key A Pressed */
	if (key_a_pressed)
	or (mouse_check_button_pressed(mb_left))
	{
		if (can_input_level_name == false)
		and (open_sub_menu == false)
		and (menu_delay == 0)
		and (menu != "back_from_level_editor")
		and (menu != "open_custom_levels_folder")
		{
		
			#region /* Create New Level */
			if (global.select_level_index == 0)
			{
				scroll_to = floor(global.select_level_index / row);
				lerp_on = true;
				menu = "level_editor_create_from_scratch";
				menu_delay = 3;
				open_sub_menu = true;
			}
			#endregion /* Create New Level END */
		
			else
		
			#region /* Open sub menu for levels */
			if (global.select_level_index >= 1)
			{
				scroll_to = floor(global.select_level_index / row);
				lerp_on = true;
				menu = "level_editor_play";
				menu_delay = 3;
				open_sub_menu = true;
			}
			#endregion /* Open sub menu for levels END */
		
		}
	}
	#endregion /* Key A Pressed END */
	
	else
	
	#region /* Key B Pressed */
	if (key_b_pressed)
	and (can_input_level_name == false)
	and (menu_delay == 0)
	{
		if (open_sub_menu == true)
		{
			menu_delay = 3;
			open_sub_menu = false;
			menu = "level_editor_play";
		}
	}
	#endregion /* Key B Pressed END */
	
	#endregion /* Navigate Menu END */
	
	scr_draw_level_editor_thumbnail(global.all_loaded_custom_levels, false);
	
	column = floor(global.select_level_index / row); /* Do this code again here so the sub menu doesn't get misaligned */
	
	#region /* Draw sub menu (code must be here to be above everything else) */
	if (open_sub_menu == true)
	{
		
		#region /* Navigate Sub Menu */
		if (key_up)
		and (can_input_level_name == false)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		{
			if (menu == "level_editor_play")
			{
				menu = "level_editor_selected_back";
			}
			else
			if (menu == "level_editor_make")
			{
				menu = "level_editor_play";
			}
			else
			if (menu == "level_editor_upload")
			{
				menu = "level_editor_make";
			}
			else
			if (menu == "level_editor_edit_name")
			{
				menu = "level_editor_upload";
			}
			else
			if (menu == "level_editor_edit_description")
			{
				menu = "level_editor_edit_name";
			}
			else
			if (menu == "level_editor_selected_back")
			{
				if (show_delete_button == true)
				{
					menu = "level_editor_delete";
				}
				else
				{
					menu = "level_editor_make";
				}
			}
			else
			if (menu == "level_editor_create_from_scratch")
			{
				menu = "level_editor_create_from_back";
			}
			else
			if (menu == "level_editor_create_from_template")
			{
				menu = "level_editor_create_from_scratch";
			}
			else
			if (menu == "level_editor_create_from_back")
			{
				menu = "level_editor_create_from_template";
			}
			else
			if (menu == "level_editor_delete")
			{
				menu = "level_editor_edit_description";
			}
			else
			if (menu == "level_editor_delete_no")
			{
				menu = "level_editor_delete_yes";
			}
			else
			if (menu == "level_editor_delete_yes")
			{
				menu = "level_editor_delete_no";
			}
			menu_delay = 3;
		}
		else
		if (key_down)
		and (can_input_level_name == false)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		{
			if (menu == "level_editor_play")
			{
				menu = "level_editor_make";
			}
			else
			if (menu == "level_editor_make")
			{
				menu = "level_editor_upload";
			}
			else
			if (menu == "level_editor_upload")
			{
				menu = "level_editor_edit_name";
			}
			else
			if (menu == "level_editor_edit_name")
			{
				menu = "level_editor_edit_description";
			}
			else
			if (menu == "level_editor_edit_description")
			{
				if (show_delete_button == true)
				{
					menu = "level_editor_delete";
				}
				else
				{
					menu = "level_editor_selected_back";
				}
			}
			else
			if (menu == "level_editor_selected_back")
			{
				menu = "level_editor_play";
			}
			else
			if (menu == "level_editor_create_from_scratch")
			{
				menu = "level_editor_create_from_template";
			}
			else
			if (menu == "level_editor_create_from_template")
			{
				menu = "level_editor_create_from_back";
			}
			else
			if (menu == "level_editor_create_from_back")
			{
				menu = "level_editor_create_from_scratch";
			}
			else
			if (menu == "level_editor_delete")
			{
				menu = "level_editor_selected_back";
			}
			else
			if (menu == "level_editor_delete_no")
			{
				menu = "level_editor_delete_yes";
			}
			else
			if (menu == "level_editor_delete_yes")
			{
				menu = "level_editor_delete_no";
			}
			menu_delay = 3;
		}
		#endregion /* Navigate Sub Menu END */
		
		if (show_delete_button == true)
		{
			var play_y = 0;
			var make_y = 42;
			var upload_y = 42 * 2;
			var edit_name_y = 42 * 3;
			var edit_description_y = 42 * 4;
			var delete_y = 42 * 5;
			var back_y = 42 * 6;
		}
		else
		{
			var play_y = 0;
			var make_y = 42;
			var upload_y = 42 * 2;
			var edit_name_y = 42 * 3;
			var edit_description_y = 42 * 4;
			var delete_y = -99999;
			var back_y = 42 * 5;
		}
		
		#region /* Show Sub Menu Buttons */
		if (can_input_level_name == false)
		{
			if (menu == "level_editor_play")
			or (menu == "level_editor_make")
			or (menu == "level_editor_upload")
			or (menu == "level_editor_edit_name")
			or (menu == "level_editor_edit_description")
			or (menu == "level_editor_delete")
			or (menu == "level_editor_selected_back")
			{
				draw_rectangle_color(394 * (global.select_level_index - column * row) + 100 - 3, 226 * (column - scroll) + 455 - 3, 394 * (global.select_level_index - column * row) + 100 + 384 + 3, 226 * (column - scroll) + 475 + back_y + 47 + 3, c_white, c_white, c_white, c_white, false);
				draw_menu_button(394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (play_y) - 3, l10n_text("Play"), "level_editor_play", "level_editor_play");
				draw_menu_button(394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (make_y) - 3, l10n_text("Make"), "level_editor_make", "level_editor_make");
				draw_menu_button(394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (upload_y) - 3, l10n_text("Upload"), "level_editor_upload", "level_editor_upload");
				draw_menu_button(394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (edit_name_y) - 3, l10n_text("Edit Name"), "level_editor_edit_name", "level_editor_edit_name");
				draw_menu_button(394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (edit_description_y) - 3, l10n_text("Edit Description"), "level_editor_edit_description", "level_editor_edit_description");
				draw_menu_button(394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (delete_y) - 3, l10n_text("Delete"), "level_editor_delete", "level_editor_delete_no");
				draw_menu_button(394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (back_y) - 3, l10n_text("Back"), "level_editor_selected_back", "level_editor_selected_back");
				draw_sprite_ext(spr_icons_pen, 0, 394 * (global.select_level_index - column * row) + 110 - 3 + 20, 226 * (column - scroll) + 475 + (edit_name_y) - 3 + 21, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_icons_pen, 0, 394 * (global.select_level_index - column * row) + 110 - 3 + 20, 226 * (column - scroll) + 475 + (edit_description_y) - 3 + 21, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, 394 * (global.select_level_index - column * row) + 110 - 3 + 20, 226 * (column - scroll) + 475 + (back_y) - 3 + 21, 1, 1, 0, c_white, 1);
			}
			else
			if (menu == "level_editor_create_from_scratch")
			or (menu == "level_editor_create_from_template")
			or (menu == "level_editor_create_from_back")
			{
				draw_rectangle_color(394 * (global.select_level_index - column * row) + 100 - 3, 226 * (column - scroll) + 455 - 3, 394 * (global.select_level_index - column * row) + 100 + 384 + 3, 226 * (column - scroll) + 408+ 216 + 3, c_white, c_white, c_white, c_white, false);
				draw_menu_button(394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 - 3, l10n_text("Create from Scratch"), "level_editor_create_from_scratch", "level_editor_create_from_scratch");
				draw_menu_button(394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 522 - 3, l10n_text("Create from Template"), "level_editor_create_from_template", "level_editor_create_from_template"); /* + 47 on y */
				draw_menu_button(394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 569 - 3, l10n_text("Back"), "level_editor_create_from_back", "level_editor_create_from_back");
				draw_sprite_ext(spr_icons_back, 0, 394 * (global.select_level_index - column * row) + 110 - 3 + 20, 226 * (column - scroll) + 569 - 3 + 21, 1, 1, 0, c_white, 1);
			}
			else
			if (menu == "level_editor_delete_no")
			or (menu == "level_editor_delete_yes")
			{
				draw_rectangle_color(394 * (global.select_level_index - column * row) + 100 - 3, 226 * (column - scroll) + 455 - 3, 394 * (global.select_level_index - column * row) + 100 + 384 + 3, 226 * (column - scroll) + 408+ 216 + 3, c_red, c_red, c_red, c_red, false);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(394 * (global.select_level_index - column * row) + 300 - 3, 226 * (column - scroll) + 485 - 3, l10n_text("Delete Level") + "?", global.default_text_size * 1.2, c_white, c_black, 1);
				draw_menu_button(394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 522 - 3, l10n_text("No"), "level_editor_delete_no", "level_editor_delete"); /* + 47 on y */
				draw_menu_button(394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 569 - 3, l10n_text("Yes"), "level_editor_delete_yes", "level_editor_delete_yes");
				draw_sprite_ext(spr_icons_back, 0, 394 * (global.select_level_index - column * row) + 110 - 3 + 20, 226 * (column - scroll) + 522 - 3 + 21, 1, 1, 0, c_white, 1);
				if (window_get_width() <= 1350)
				{
					scr_draw_text_outlined(window_get_width() / 2, window_get_height() - 32, string_replace_all(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "\\", "/"), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
				}
				else
				{
					scr_draw_text_outlined(window_get_width() / 2, window_get_height() - 32, string_replace_all(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "\\", "/"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
				}
			}
		}
		#endregion /* Show Sub Menu Buttons END */
		
		#region /* Pressing the Create from Scratch button */
		if (menu == "level_editor_create_from_scratch")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 - 3, 394 * (global.select_level_index - column * row) + 110 - 3 + 370, 226 * (column - scroll) + 475 - 3 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			or (key_a_pressed)
			{
				menu_delay = 3;
				keyboard_string = "";
				can_input_level_name = true;
			}
		}
		#endregion /* Pressing the Create from Scratch button END */
		
		#region /* Pressing the Create from Back button */
		if (menu == "level_editor_create_from_back")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 569 - 3, 394 * (global.select_level_index - column * row) + 110 - 3 + 370, 226 * (column - scroll) + 569 - 3 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			or (key_a_pressed)
			{
				menu_delay = 3;
				open_sub_menu = false;
				menu = "level_editor_play";
			}
		}
		#endregion /* Pressing the Create from Back button END */
		
		#region /* Pressing the Back button when selecting level */
		if (menu == "level_editor_selected_back")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (back_y) - 3, 394 * (global.select_level_index - column * row) + 110 - 3 + 370, 226 * (column - scroll) + 475 + (back_y) - 3 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			or (key_a_pressed)
			{
				menu_delay = 3;
				open_sub_menu = false;
				menu = "level_editor_play";
			}
		}
		#endregion /* Pressing the Back button when selecting level END */
		
		#region /* Pressing the Play button */
		if (menu == "level_editor_play")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (play_y)- 3, 394 * (global.select_level_index - column * row) + 110 - 3 + 370, 226 * (column - scroll) + 475 + (play_y)- 3 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			or (key_a_pressed)
			{
				global.doing_clear_check = false;
				global.actually_play_edited_level = true;
				global.play_edited_level = true;
				can_navigate = false;
				menu_delay = 9999;
				if (asset_get_type("obj_camera") == asset_object)
				and (instance_exists(obj_camera))
				{
					with(obj_camera)
					{
						iris_zoom = 0;
					}
				}
			}
		}
		#endregion /* Pressing the Play button END */
		
		#region /* Pressing the Make button */
		if (menu == "level_editor_make")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (make_y) - 3, 394 * (global.select_level_index - column * row) + 110 - 3 + 370, 226 * (column - scroll) + 475 + (make_y) - 3 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			or (key_a_pressed)
			{
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_navigate = false;
				menu_delay = 9999;
				if (asset_get_type("obj_camera") == asset_object)
				and (instance_exists(obj_camera))
				{
					with(obj_camera)
					{
						iris_zoom = 0;
					}
				}
			}
		}
		#endregion /* Pressing the Make button END */
		
		#region /* Pressing the Edit Name button */
		if (menu == "level_editor_edit_name")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (edit_name_y) - 3, 394 * (global.select_level_index - column * row) + 110 - 3 + 370, 226 * (column - scroll) + 475 + (edit_name_y) - 3 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (level_editor_edit_name = false)
			or (key_a_pressed)
			and (level_editor_edit_name = false)
			{
				level_editor_edit_name = true;
				can_input_level_name = true;
				can_navigate = true;
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.level_name = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index));
				keyboard_string = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index));
				old_level_name = global.level_name; /* Need to remember original name of level, so that renaming level doesn't actually happen if you haven't edited the name */
				global.play_edited_level = false;
				menu_delay = 3;
			}
		}
		#endregion /* Pressing the Edit Name button END */
		
		#region /* Key A Pressed */
		if (key_a_pressed)
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			
			#region /* Pressing the Delete button */
			if (menu == "level_editor_delete")
			and (show_delete_button == true)
			{
				menu_delay = 3;
				menu = "level_editor_delete_no";
			}
			#endregion /* Pressing the Delete button END */
			
			else
			
			#region /* Pressing the No Delete button */
			if (menu == "level_editor_delete_no")
			{
				menu_delay = 3;
				if (show_delete_button == true)
				{
					menu = "level_editor_delete"
				}
				else
				{
					menu = "level_editor_selected_back";
				}
			}
			#endregion /* Pressing the No Delete button END */
			
		}
		#endregion /* Key A Pressed END */
		
		#region /* Pressing the Create from Template button */
		if (key_a_pressed)
		and (can_input_level_name == false)
		and (menu_delay == 0)
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 522 - 3, 394 * (global.select_level_index - column * row) + 110 - 3 + 320, 226 * (column - scroll) + 522 - 3 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			if (menu == "level_editor_create_from_template")
			{
				file_found = "";
				file_load_timer = 0;
				level_find_pos = 0;
				ds_list_clear(global.thumbnail_sprite);
				menu_delay = 3;
				menu = "load_official_level_template";
			}
		}
		#endregion /* Pressing the Create from Template button END */
		
		#region /* Pressing the Yes Delete button */
		if (key_a_pressed)
		and (can_input_level_name == false)
		and (menu_delay == 0)
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 569 - 3, 394 * (global.select_level_index - column * row) + 110 - 3 + 320, 226 * (column - scroll) + 569 - 3 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			if (menu == "level_editor_delete_yes")
			{
				if (directory_exists(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))))
				{
					directory_destroy(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)));
				}
				scr_load_custom_level_initializing();
				can_input_player1_name = false;
				can_input_player2_name = false;
				can_input_player3_name = false;
				can_input_player4_name = false;
				can_navigate = true;
				menu_delay = 3;
				open_sub_menu = false;
				player1_accept_selection = false;
				player2_accept_selection = false;
				player3_accept_selection = false;
				player4_accept_selection = false;
				menu = "load_custom_level";
			}
		}
		#endregion /* Pressing the Yes Delete button END */
		
	}
	#endregion /* Draw sub menu END */
	
	if (menu != "load_custom_level")
	and (menu != "load_characters")
	and (menu != "load_official_level_template")
	{
		
		#region /* Back Button */
		draw_menu_button(0, 0, l10n_text("Back"), "back_from_level_editor", "back_from_level_editor");
		draw_sprite_ext(spr_icons_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
		if (menu == "back_from_level_editor")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (open_sub_menu == false)
		and (can_input_level_name == false)
		or (key_b_pressed)
		and (menu_delay == 0)
		and (open_sub_menu == false)
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
			global.select_level_index = 0;
			scroll_to = floor(global.select_level_index / row);
			lerp_on = true;
			menu = "leveleditor";
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
			menu = "open_custom_levels_folder";
			lerp_on = true;
		}
		if (menu == "back_from_level_editor")
		{
			open_sub_menu = false;
		}
		#endregion /* Back Button END */
		
		#region /* Open Custom Levels Folder */
		draw_menu_button(0, 42, l10n_text("Open Custom Levels Folder"), "open_custom_levels_folder", "open_custom_levels_folder");
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, 42 + 2, 371, 42 + 41))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (menu == "open_custom_levels_folder")
		and (key_a_pressed)
		and (menu_delay == 0)
		{
			scr_open_folder(game_save_id + "\custom_levels")
		}
		if (menu == "open_custom_levels_folder")
		and (key_up)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			menu = "back_from_level_editor";
			lerp_on = true;
		}
		if (menu == "open_custom_levels_folder")
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
		if (menu == "open_custom_levels_folder")
		{
			open_sub_menu = false;
		}
		#endregion /* Open Custom Levels Folder END */
		
	}
	
	#region /* Enter Custom Level */
	if (iris_xscale <= 0.001)
	and (global.character_select_in_this_menu == "level_editor")
	{
		if (audio_is_playing(title_music))
		{
			audio_stop_sound(title_music);
		}
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
			/* BMP small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.bmp")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_vtiled(0, true);}else
			/* BMP big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.bmp")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.png")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.png")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.gif")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.gif")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.jpg")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.jpg")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			{
				global.custom_background1 = noone;
			}
			#endregion /* Update Background1 END */
			
			#region /* Update Background2 */
			/* BMP small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.bmp")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_vtiled(0, true);}else
			/* BMP big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.bmp")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.png")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.png")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.gif")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.gif")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.jpg")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.jpg")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			{
				global.custom_background2 = noone;
			}
			#endregion /* Update Background2 END */
			
			#region /* Update Background3 */
			/* BMP small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.bmp")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_vtiled(0, true);}else
			/* BMP big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.bmp")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.png")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.png")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.gif")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.gif")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.jpg")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.jpg")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			{
				global.custom_background3 = noone;
			}
			#endregion /* Update Background3 END */
			
			#region /* Update Background4 */
			/* BMP small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.bmp")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_vtiled(0, true);}else
			/* BMP big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.bmp")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.png")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.png")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.gif")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.gif")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.jpg")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.jpg")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			{
				global.custom_background4 = noone;
			}
			#endregion /* Update Background4 END */
						
			#region /* Update Foreground1 */
			
			#region /* BMP small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP small letter File END */
			
			#region /* BMP big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP big letter File END */
			
			#region /* PNG small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG small letter File END */
			
			#region /* PNG big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG big letter File END */
			
			#region /* GIF small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF small letter File END */
			
			#region /* GIF big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF big letter File END */
			
			#region /* JPG small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG small letter File END */
			
			#region /* JPG big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG big letter File END */
			
			{
				global.custom_foreground1 = noone;
			}
			
			#endregion /* Update Foreround1 END */
			
			#region /* Update Foreground above static objects custom level */
			
			#region /* BMP small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.bmp"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP small letter File END */
			
			#region /* BMP big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.bmp"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP big letter File END */
			
			#region /* PNG small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG small letter File END */
			
			#region /* PNG big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.png"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG big letter File END */
			
			#region /* GIF small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.gif"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF small letter File END */
			
			#region /* GIF big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.gif"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF big letter File END */
			
			#region /* JPG small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.jpg"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG small letter File END */
			
			#region /* JPG big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.jpg"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG big letter File END */
			
			{
				global.custom_foreground_above_static_objects = noone;
			}
			
			#endregion /* Update Foreround above static objects custom level END */
			
			#region /* Update Foreground2 */
			
			#region /* BMP small letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP small letter File END */
			
			#region /* BMP big letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP big letter File END */
			
			#region /* PNG small letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG small letter File END */
			
			#region /* PNG big letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG big letter File END */
			
			#region /* GIF small letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF small letter File END */
			
			#region /* GIF big letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF big letter File END */
			
			#region /* JPG small letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG small letter File END */
			
			#region /* JPG big letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG big letter File END */
			
			{
				global.custom_foreground2 = noone;
			}
			
			#endregion /* Update Foreround2 END */
			
			#region /* Update Foreground secret */
			
			#region /* BMP small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.bmp"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.bmp", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* BMP small letter File END */
			
			else
			
			#region /* BMP big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.bmp"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.bmp", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* BMP big letter File END */
			
			else
			
			#region /* PNG small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* PNG small letter File END */
			
			else
			
			#region /* PNG big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.png"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.png", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* PNG big letter File END */
			
			else
			
			#region /* GIF small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.gif"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.gif", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* GIF small letter File END */
			
			else
			
			#region /* GIF big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.gif"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.gif", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* GIF big letter File END */
			
			else
			
			#region /* JPG small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.jpg"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.jpg", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* JPG small letter File END */
			
			else
			
			#region /* JPG big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.jpg"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.jpg", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* JPG big letter File END */
			
			else
			{
				global.custom_foreground_secret = noone;
			}
			
			#endregion /* Update Foreround secret END */
			
			#endregion /* Update All Backgrounds END */
			
			#region /* Level Tileset File */
			sprite_delete(global.custom_tileset);
			
			if (global.character_select_in_this_menu == "level_editor")
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
	#endregion /* Enter Custom Level END */
	
	var draw_name_input_screen_y = 226 * (column - scroll) + 500;
	
	if (can_input_level_name == true)
	{
		global.level_name = scr_draw_name_input_screen(global.level_name, 32, c_black, 1, false, 394 * (global.select_level_index - column * row) + 300, draw_name_input_screen_y, "level_editor_enter_name_ok", "level_editor_enter_name_cancel");
	}
	
	#region /* Input Level Name */
	
	#region /* Press Enter to make new level from scratch */
	if (can_input_level_name == true)
	and (menu_delay == 0)
	and (keyboard_string != "")
	and (global.level_name != undefined)
	{
		if (keyboard_check_pressed(vk_enter))
		and (menu != "level_editor_enter_name_ok")
		and (menu != "level_editor_enter_name_cancel")
		or (keyboard_check_pressed(vk_enter))
		and (menu == "level_editor_enter_name_ok")
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
		394 * (global.select_level_index - column * row) + 300 - 185,
		draw_name_input_screen_y + 54,
		394 * (global.select_level_index - column * row) + 300 - 185 + 370,
		draw_name_input_screen_y + 54 + 42))
		and (mouse_check_button_pressed(mb_left))
		or (gamepad_button_check_pressed(0, gp_face1))
		or (gamepad_button_check_pressed(1, gp_face1))
		or (gamepad_button_check_pressed(2, gp_face1))
		or (gamepad_button_check_pressed(3, gp_face1))
		{
			if (level_editor_edit_name == true)
			and (global.level_name != old_level_name)
			{
				can_navigate = true;
				menu_delay = 3;
				scr_copy_move_files(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), string(game_save_id) + "\custom_levels\\" + string(global.level_name), true);
				scr_load_custom_level_initializing();
				menu = "load_custom_level";
				level_editor_edit_name = false;
			}
			else
			if (level_editor_edit_name == true)
			and (global.level_name == old_level_name)
			{
				menu = "level_editor_edit_name";
				level_editor_edit_name = false;
			}
			else
			if (level_editor_edit_name == false)
			{
				can_navigate = false;
				menu_delay = 9999;
				if (asset_get_type("obj_camera") == asset_object)
				and (instance_exists(obj_camera))
				{
					with(obj_camera)
					{
						iris_zoom = 0;
					}
				}
			}
			global.doing_clear_check = false;
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			can_input_level_name = false;
		}
	}
	#endregion /* Press Enter to make new level from scratch END */
	
	#region /* Press Escape to back out from level from scratch menu */
	if (keyboard_check_pressed(vk_enter))
	and (menu == "level_editor_enter_name_cancel")
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (keyboard_check_pressed(vk_escape))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
	394 * (global.select_level_index - column * row) + 300 - 185,
	draw_name_input_screen_y + 54 + 42,
	394 * (global.select_level_index - column * row) + 300 - 185 + 370,
	draw_name_input_screen_y + 54 + 42 + 42))
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
		if (level_editor_edit_name == true)
		{
			menu = "level_editor_edit_name";
			level_editor_edit_name = false;
		}
		else
		{
			menu = "level_editor_create_from_scratch";
			menu = "level_editor_create_from_scratch";
		}
	}
	#endregion /* Press Escape to back out from level from scratch menu END */
	
	#endregion /* Input Level Name END */
	
	#region /* Show the path of the custom level on the bottom of the screen */
	if (global.select_level_index >= 1)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (window_get_width() <= 1350)
		{
			scr_draw_text_outlined(window_get_width() / 2, window_get_height() - 32, string_replace_all(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "\\", "/"), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
		}
		else
		{
			scr_draw_text_outlined(window_get_width() / 2, window_get_height() - 32, string_replace_all(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "\\", "/"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
	}
	#endregion /* Show the path of the custom level on the bottom of the screen END */
	
	scr_draw_upload_level_menu(); /* Draw upload level menu above everything */
	
}