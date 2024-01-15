function scr_character_portrait_for_player_step(what_player = 1)
{
	var skin_y = 192;
	var voicepack_y = 234;
	
	if (keyboard_virtual_status())
	&& (keyboard_virtual_height() != 0)
	{
		var name_input_y = display_get_gui_height() - keyboard_virtual_height() - 160;
	}
	else
	{
		var name_input_y = display_get_gui_height() * 0.5 + name_y;
	}
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Make character portraits smaller if screen size is too small to fit them */
	if (get_window_width >= 1670)
	{
		var scale_offset = 1;
	}
	else
	if (get_window_width >= 1276)
	{
		var scale_offset = 0.9;
	}
	else
	if (get_window_width >= 882)
	{
		var scale_offset = 0.8;
	}
	else
	if (get_window_width >= 488)
	{
		var scale_offset = 0.7;
	}
	else
	{
		var scale_offset = 0.6;
	}
	#endregion /* Make character portraits smaller if screen size is too small to fit them END */
	
	#region /* Set correct variables for players */
	
	#region /* If player is player 1, set all the variables to Player variables */
	if (what_player == 1)
	{
		var sprite_select_player = global.sprite_select_player[1];
		var player_key_left = global.player_[inp.key][1][1][action.left];
		var player_key_right = global.player_[inp.key][1][1][action.right];
		var player_key2_left = global.player_[inp.key][1][2][action.left];
		var player_key2_right = global.player_[inp.key][1][2][action.right];
		var player_key_up = global.player_[inp.key][1][1][action.up];
		var player_key_down = global.player_[inp.key][1][1][action.down];
		var player_key2_up = global.player_[inp.key][1][2][action.up];
		var player_key2_down = global.player_[inp.key][1][2][action.down];
		var player_key_back = global.player_[inp.key][1][1][action.back];
		var player_key2_back = global.player_[inp.key][1][2][action.back];
		var player_key_accept = global.player_[inp.key][1][1][action.accept];
		var player_key2_accept = global.player_[inp.key][1][2][action.accept];
		var player_gamepad_button_back = global.player_[inp.gp][1][1][action.back];
		var player_gamepad_button2_back = global.player_[inp.gp][1][2][action.back];
		var player_gamepad_button_accept = global.player_[inp.gp][1][1][action.accept];
		var player_gamepad_button2_accept = global.player_[inp.gp][1][2][action.accept];
	}
	#endregion /* If player is player 1, set all the variables to Player variables END */
	
	else
	
	#region /* If player is player 2, set all the variables to player 2 variables */
	if (what_player == 2)
	{
		var sprite_select_player = global.sprite_select_player[2];
		var player_key_left = global.player_[inp.key][2][1][action.left];
		var player_key_right = global.player_[inp.key][2][1][action.right];
		var player_key2_left = global.player_[inp.key][2][2][action.left];
		var player_key2_right = global.player_[inp.key][2][2][action.right];
		var player_key_up = global.player_[inp.key][2][1][action.up];
		var player_key_down = global.player_[inp.key][2][1][action.down];
		var player_key2_up = global.player_[inp.key][2][2][action.up];
		var player_key2_down = global.player_[inp.key][2][2][action.down];
		var player_key_back = global.player_[inp.key][2][1][action.back];
		var player_key2_back = global.player_[inp.key][2][2][action.back];
		var player_key_accept = global.player_[inp.key][2][1][action.accept];
		var player_key2_accept = global.player_[inp.key][2][2][action.accept];
		var player_gamepad_button_back = global.player_[inp.gp][2][1][action.back];
		var player_gamepad_button2_back = global.player_[inp.gp][2][2][action.back];
		var player_gamepad_button_accept = global.player_[inp.gp][2][1][action.accept];
		var player_gamepad_button2_accept = global.player_[inp.gp][2][2][action.accept];
	}
	#endregion /* If player is player 2, set all the variables to player 2 variables END */
	
	else
	
	#region /* If player is player 3, set all the variables to player 3 variables */
	if (what_player == 3)
	{
		var sprite_select_player = global.sprite_select_player[3];
		var player_key_left = global.player_[inp.key][3][1][action.left];
		var player_key_right = global.player_[inp.key][3][1][action.right];
		var player_key2_left = global.player_[inp.key][3][2][action.left];
		var player_key2_right = global.player_[inp.key][3][2][action.right];
		var player_key_up = global.player_[inp.key][3][1][action.up];
		var player_key_down = global.player_[inp.key][3][1][action.down];
		var player_key2_up = global.player_[inp.key][3][2][action.up];
		var player_key2_down = global.player_[inp.key][3][2][action.down];
		var player_key_back = global.player_[inp.key][3][1][action.back];
		var player_key2_back = global.player_[inp.key][3][2][action.back];
		var player_key_accept = global.player_[inp.key][3][1][action.accept];
		var player_key2_accept = global.player_[inp.key][3][2][action.accept];
		var player_gamepad_button_back = global.player_[inp.gp][3][1][action.back];
		var player_gamepad_button2_back = global.player_[inp.gp][3][2][action.back];
		var player_gamepad_button_accept = global.player_[inp.gp][3][1][action.accept];
		var player_gamepad_button2_accept = global.player_[inp.gp][3][2][action.accept];
	}
	#endregion /* If player is player 3, set all the variables to player 3 variables END */
	
	else
	
	#region /* If player is player 4, set all the variables to player 4 variables */
	if (what_player == 4)
	{
		var sprite_select_player = global.sprite_select_player[4];
		var player_key_left = global.player_[inp.key][4][1][action.left];
		var player_key_right = global.player_[inp.key][4][1][action.right];
		var player_key2_left = global.player_[inp.key][4][2][action.left];
		var player_key2_right = global.player_[inp.key][4][2][action.right];
		var player_key_up = global.player_[inp.key][4][1][action.up];
		var player_key_down = global.player_[inp.key][4][1][action.down];
		var player_key2_up = global.player_[inp.key][4][2][action.up];
		var player_key2_down = global.player_[inp.key][4][2][action.down];
		var player_key_back = global.player_[inp.key][4][1][action.back];
		var player_key2_back = global.player_[inp.key][4][2][action.back];
		var player_key_accept = global.player_[inp.key][4][1][action.accept];
		var player_key2_accept = global.player_[inp.key][4][2][action.accept];
		var player_gamepad_button_back = global.player_[inp.gp][4][1][action.back];
		var player_gamepad_button2_back = global.player_[inp.gp][4][2][action.back];
		var player_gamepad_button_accept = global.player_[inp.gp][4][1][action.accept];
		var player_gamepad_button2_accept = global.player_[inp.gp][4][2][action.accept];
	}
	#endregion /* If player is player 4, set all the variables to player 4 variables END */
	
	#endregion /* Set correct variables for players END */
	
	#region /* Display Selected Skin if skins are available */
	if (!can_input_player_name[1])
	&& (!can_input_player_name[2])
	&& (!can_input_player_name[3])
	&& (!can_input_player_name[4])
	&& (character_portrait_for_player_dir_exists_1[what_player])
	{
		if (player_menu[what_player] == "select_skin")
		|| (global.controls_used_for_navigation == "mouse")
		{
			if (player_accept_selection[what_player] == 0)
			{
				
				#region /* Player key left Skin */
				if (keyboard_check_pressed(player_key_left))
				|| (keyboard_check_pressed(player_key2_left))
				|| (gamepad_button_check_pressed(global.player_slot[what_player], gp_padl))
				|| (gamepad_axis_value(global.player_slot[what_player], gp_axislh) < -0.3)
				|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] - arrow_offset - 16, get_window_height * 0.5 + skin_y - 16, get_window_width * 0.5 + player_display_x[what_player] - arrow_offset + 16, get_window_height * 0.5 + skin_y + 16))
				&& (mouse_check_button_released(mb_left))
				&& (global.controls_used_for_navigation == "mouse")
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					&& (global.skin_for_player[what_player] > 0)
					{
						menu_delay = 3;
							
						#region /* Player character select portrait sprite */
						global.skin_for_player[what_player] --;
						global.actual_skin_for_player[what_player] = global.skin_for_player[what_player]; /* When changing skins, update "actual skin for player" to match "skin for player". Update "skin for player" first */
						menu_specific_joystick_delay[what_player] = 30;
						xx_delay[what_player] = -1;
						#endregion /* Player character select portrait sprite END */
							
						character_portrait_for_player_update_directory[what_player] = true;
						alarm[0] = 1;
						alarm[1] = 1;
					}
				}
				#endregion /* Player key left Skin END */
				
				else
				
				#region /* Player key right Skin */
				if (keyboard_check_pressed(player_key_right))
				|| (keyboard_check_pressed(player_key2_right))
				|| (gamepad_button_check_pressed(global.player_slot[what_player], gp_padr))
				|| (gamepad_axis_value(global.player_slot[what_player], gp_axislh) > +0.3)
				|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] + arrow_offset - 16, get_window_height * 0.5 + skin_y - 16, get_window_width * 0.5 + player_display_x[what_player] + arrow_offset + 16, get_window_height * 0.5 + skin_y + 16))
				&& (mouse_check_button_released(mb_left))
				&& (global.controls_used_for_navigation == "mouse")
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					&& (character_portrait_for_player_dir_exists_2[what_player])
					{
						menu_delay = 3;
							
						#region /* Player character select portrait sprite */
						global.skin_for_player[what_player] ++;
						global.actual_skin_for_player[what_player] = global.skin_for_player[what_player]; /* When changing skins, update "actual skin for player" to match "skin for player". Update "skin for player" first */
						menu_specific_joystick_delay[what_player] = 30;
						xx_delay[what_player] = +1;
						#endregion /* Player character select portrait sprite END */
							
						character_portrait_for_player_update_directory[what_player] = true;
						alarm[0] = 1;
						alarm[1] = 1;
					}
				}
				#endregion /* Player key right Skin END */
				
				#region /* Show left key for character skin select */
				if (global.skin_for_player[what_player] > 0)
				{
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] - arrow_offset - 16, get_window_height * 0.5 + skin_y - 16, get_window_width * 0.5 + player_display_x[what_player] - arrow_offset + 16, get_window_height * 0.5 + skin_y + 16))
					&& (global.controls_used_for_navigation == "mouse")
					{
						player_menu[what_player] = "select_skin";
					}
				}
				#endregion /* Show left key for character skin select END */
				
				#region /* Show right key for character skin select */
				if (character_portrait_for_player_dir_exists_2[what_player])
				{
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] + arrow_offset - 16, get_window_height * 0.5 + skin_y - 16, get_window_width * 0.5 + player_display_x[what_player] + arrow_offset + 16, get_window_height * 0.5 + skin_y + 16))
					&& (global.controls_used_for_navigation == "mouse")
					{
						player_menu[what_player] = "select_skin";
					}
				}
				#endregion /* Show right key for character skin select END */
				
			}
		}
	}
	#endregion /* Display Selected Skin if skins are available END */
	
	#region /* Display Selected Voice Pack if voice packs are available */
	if (!can_input_player_name[1])
	&& (!can_input_player_name[2])
	&& (!can_input_player_name[3])
	&& (!can_input_player_name[4])
	&& (character_portrait_for_player_dir_exists_3[what_player])
	{
		if (player_menu[what_player] == "select_voicepack")
		|| (global.controls_used_for_navigation == "mouse")
		{
			if (player_accept_selection[what_player] == 0)
			{
				
				#region /* Player key left Voice Pack */
				if (keyboard_check_pressed(player_key_left))
				|| (keyboard_check_pressed(player_key2_left))
				|| (gamepad_button_check_pressed(global.player_slot[what_player], gp_padl))
				|| (gamepad_axis_value(global.player_slot[what_player], gp_axislh) < -0.3)
				|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] - arrow_offset - 16, get_window_height * 0.5 + voicepack_y - 16, get_window_width * 0.5 + player_display_x[what_player] - arrow_offset + 16, get_window_height * 0.5 + voicepack_y + 16))
				&& (mouse_check_button_released(mb_left))
				&& (global.controls_used_for_navigation == "mouse")
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					&& (global.voicepack_for_player[what_player] > 0)
					{
						menu_delay = 3;
						global.voicepack_for_player[what_player] --;
						menu_specific_joystick_delay[what_player] = 30;
						xx[what_player] = player_display_x[what_player] -32;
						character_portrait_for_player_update_directory[what_player] = true;
						alarm[0] = 1;
					}
				}
				#endregion /* Player key left Voice Pack END */
				
				else
				
				#region /* Player key right Voice Pack */
				if (keyboard_check_pressed(player_key_right))
				|| (keyboard_check_pressed(player_key2_right))
				|| (gamepad_button_check_pressed(global.player_slot[what_player], gp_padr))
				|| (gamepad_axis_value(global.player_slot[what_player], gp_axislh) > +0.3)
				|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] + arrow_offset - 16, get_window_height * 0.5 + voicepack_y - 16, get_window_width * 0.5 + player_display_x[what_player] + arrow_offset + 16, get_window_height * 0.5 + voicepack_y + 16))
				&& (mouse_check_button_released(mb_left))
				&& (global.controls_used_for_navigation == "mouse")
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (character_portrait_for_player_dir_exists_4[what_player])
						{
							menu_delay = 3;
							global.voicepack_for_player[what_player] ++;
							menu_specific_joystick_delay[what_player] = 30;
							xx[what_player] = player_display_x[what_player] +32;
							character_portrait_for_player_update_directory[what_player] = true;
							alarm[0] = 1;
						}
					}
				}
				#endregion /* Player key right Voice Pack END */
				
				#region /* Show left key for character voicepack select */
				if (global.voicepack_for_player[what_player] > 0)
				{
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] - arrow_offset - 16, get_window_height * 0.5 + voicepack_y - 16, get_window_width * 0.5 + player_display_x[what_player] - arrow_offset + 16, get_window_height * 0.5 + voicepack_y + 16))
					&& (global.controls_used_for_navigation == "mouse")
					{
						player_menu[what_player] = "select_voicepack";
					}
				}
				#endregion /* Show left key for character voicepack select END */
				
				#region /* Show right key for character voicepack select */
				if (character_portrait_for_player_dir_exists_4[what_player])
				{
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] + arrow_offset - 16, get_window_height * 0.5 + voicepack_y - 16, get_window_width * 0.5 + player_display_x[what_player] + arrow_offset + 16, get_window_height * 0.5 + voicepack_y + 16))
					&& (global.controls_used_for_navigation == "mouse")
					{
						player_menu[what_player] = "select_voicepack";
					}
				}
				#endregion /* Show right key for character voicepack select END */
				
			}
		}
	}
	#endregion /* Display Selected Voice Pack if voice packs are available END */
	
	#region /* Show left and right arrows when selecting character */
	if (!can_input_player_name[1])
	&& (!can_input_player_name[2])
	&& (!can_input_player_name[3])
	&& (!can_input_player_name[4])
	{
		if (player_accept_selection[1] == 0)
		{
			if (gamepad_button_check_pressed(global.player_slot[1], player_gamepad_button_back))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (keyboard_check_pressed(ord("X")))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (mouse_check_button_released(mb_right))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (mouse_check_button_released(mb_side1))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (keyboard_check_pressed(vk_escape))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (keyboard_check_pressed(global.player_[inp.key][1][1][action.back]))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.back]))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				player_accept_selection[1] = -1;
				player_menu[1] = "select_character";
			}
		}
		if (player_accept_selection[2] == 0)
		{
			if (gamepad_button_check_pressed(1, player_gamepad_button_back))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (keyboard_check_pressed(global.player_[inp.key][2][1][action.back]))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (keyboard_check_pressed(global.player_[inp.key][2][2][action.back]))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				player_accept_selection[2] = -1;
				player_menu[2] = "select_character";
			}
		}
		if (player_accept_selection[3] == 0)
		{
			if (gamepad_button_check_pressed(2, player_gamepad_button_back))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (keyboard_check_pressed(global.player_[inp.key][3][1][action.back]))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (keyboard_check_pressed(global.player_[inp.key][3][2][action.back]))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				player_accept_selection[3] = -1;
				player_menu[3] = "select_character";
			}
		}
		if (!player_accept_selection[4])
		{
			if (gamepad_button_check_pressed(3, player_gamepad_button_back))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (keyboard_check_pressed(global.player_[inp.key][4][1][action.back]))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (keyboard_check_pressed(global.player_[inp.key][4][2][action.back]))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				player_accept_selection[4] = -1;
				player_menu[4] = "select_character";
			}
		}
		
		#region /* Player Show left and right arrows when selecting character */
		if (player_menu[what_player] == "select_character")
		|| (global.controls_used_for_navigation == "mouse")
		{
			if (player_accept_selection[what_player] == 0)
			{
				
				#region /* Key Left */
				if (global.character_index[what_player - 1] > 0)
				{
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] - arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x[what_player] - arrow_offset + 16, get_window_height * 0.5 + 16))
					&& (global.controls_used_for_navigation == "mouse")
					{
						player_menu[what_player] = "select_character";
					}
				}
				#endregion /* Key Left END */
				
				#region /* Key Right */
				if (global.character_index[what_player - 1] < ds_list_size(global.all_loaded_characters) - 1)
				{
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] + arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x[what_player] + arrow_offset + 16, get_window_height * 0.5 + 16))
					&& (global.controls_used_for_navigation == "mouse")
					{
						player_menu[what_player] = "select_character";
					}
				}
				#endregion /* Key Right END */
				
			}
		}
		#endregion /* Player Show left and right arrows when selecting character END */
		
	}
	#endregion /* Show left and right arrows when selecting character END */
	
	#region /* Tell the player the inputed name */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] - 150, name_input_y - 16, get_window_width * 0.5 + player_display_x[what_player] + 150, name_input_y + 16))
	&& (global.controls_used_for_navigation == "mouse")
	&& (player_accept_selection[what_player] >= 0)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		player_menu[what_player] = "select_name";
	}
	#endregion /* Tell the player the inputed name END */
	
	#region /* Tell the players what buttons to push */
	
	#region /* Tell the player what button to push to select or cancel a selection */
	if (player_menu[what_player] != "select_name")
	&& (player_menu[what_player] != "back_from_character_select")
	&& (player_menu[what_player] != "open_custom_characters_folder")
	&& (player_menu[what_player] != "manage_character")
	&& (player_menu[what_player] != "online_character_list")
	&& (!can_input_player_name[1])
	&& (!can_input_player_name[2])
	&& (!can_input_player_name[3])
	&& (!can_input_player_name[4])
	|| (global.controls_used_for_navigation == "mouse")
	&& (!can_input_player_name[1])
	&& (!can_input_player_name[2])
	&& (!can_input_player_name[3])
	&& (!can_input_player_name[4])
	{
		if (player_accept_selection[what_player] == 0)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x[what_player] + 100, get_window_height * 0.5 + 150 + 20))
			&& (global.controls_used_for_navigation == "mouse")
			{
				player_menu[what_player] = "select_character";
			}
		}
		else
		if (player_accept_selection[what_player])
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[what_player] - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x[what_player] + 100, get_window_height * 0.5 + 150 + 20))
			&& (global.controls_used_for_navigation == "mouse")
			{
				player_menu[what_player] = "select_character";
			}
		}
	}
	#endregion /* Tell the player what button to push to select or cancel a selection END */
	
	#endregion /* Tell the players what buttons to push END */
	
	if (player_menu[what_player] == "select_character")
	|| (player_menu[what_player] == "select_skin")
	|| (player_menu[what_player] == "select_voicepack")
	{
		
		#region /* Player key up Skin or Voicepack */
		if (keyboard_check_pressed(player_key_up))
		|| (keyboard_check_pressed(player_key2_up))
		|| (gamepad_button_check_pressed(global.player_slot[what_player], gp_padu))
		|| (gamepad_axis_value(global.player_slot[what_player], gp_axislv) < -0.3)
		{
			if (menu_delay == 0 && menu_joystick_delay == 0 && menu_specific_joystick_delay[what_player] == 0)
			{
				menu_delay = 3;
				menu_specific_joystick_delay[what_player] = 30;
				if (player_menu[what_player] == "select_character")
				{
					if (global.free_communication_available)
					{
						player_menu[what_player] = "online_character_list";
						menu = "online_character_list";
					}
					else
					if (global.enable_manage_characters)
					{
						player_menu[what_player] = "manage_character";
						menu = "manage_character";
					}
					else
					{
						player_menu[what_player] = "back_from_character_select";
						menu = "back_from_character_select";
					}
				}
				else
				if (player_menu[what_player] = "select_skin")
				{
					player_menu[what_player] = "select_character";
				}
				else
				if (player_menu[what_player] = "select_voicepack")
				{
					if (character_portrait_for_player_dir_exists_1[what_player])
					{
						/* Go from selecting voicepack to selecting skin */
						menu_specific_joystick_delay[what_player] = 30;
						player_menu[what_player] = "select_skin";
					}
					else
					{
						/* Go from selecting voicepack to selecting character */
						menu_specific_joystick_delay[what_player] = 30;
						player_menu[what_player] = "select_character";
					}
				}
			}
		}
		#endregion /* Player key up Skin or Voicepack END */
		
		else
		
		#region /* Player key down Skin or Voicepack */
		if (keyboard_check_pressed(player_key_down))
		|| (keyboard_check_pressed(player_key2_down))
		|| (gamepad_button_check_pressed(global.player_slot[what_player], gp_padd))
		|| (gamepad_axis_value(global.player_slot[what_player], gp_axislv) > +0.3)
		{
			if (menu_delay == 0 && menu_joystick_delay == 0 && menu_specific_joystick_delay[what_player] == 0)
			{
				menu_delay = 3;
				menu_specific_joystick_delay[what_player] = 30;
				if (player_menu[what_player] == "select_character")
				{
					if (character_portrait_for_player_dir_exists_1[what_player])
					{
						player_menu[what_player] = "select_skin";
					}
					else
					if (character_portrait_for_player_dir_exists_3[what_player])
					{
						player_menu[what_player] = "select_voicepack";
					}
					else
					{
						player_menu[what_player] = "select_name";
					}
				}
				else
				if (player_menu[what_player] = "select_skin")
				{
					if (character_portrait_for_player_dir_exists_3[what_player])
					{
						menu_specific_joystick_delay[what_player] = 30;
						player_menu[what_player] = "select_voicepack";
					}
					else
					{
						player_menu[what_player] = "select_name";
					}
				}
				else
				if (player_menu[what_player] = "select_voicepack")
				{
					player_menu[what_player] = "select_name";
				}
			}
		}
		#endregion /* Player key down Skin or Voicepack END */
		
	}
}