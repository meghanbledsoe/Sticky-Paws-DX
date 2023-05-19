function scr_set_default_remapping_player2_keyboard(save_default_controls_to_config = false)
{
	
	#region /* Player 2 Key Remapping (everything should be set to noone) */
	
	#region /* Player 2 Key 1 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.key][2][1][action.dive] = noone;
	global.player_[inp.key][2][1][action.jump] = noone;
	global.player_[inp.key][2][1][action.double_jump] = noone;
	global.player_[inp.key][2][1][action.crouch] = noone;
	global.player_[inp.key][2][1][action.crouch_toggle] = noone;
	global.player_[inp.key][2][1][action.sprint] = noone;
	global.player_[inp.key][2][1][action.sprint_toggle] = noone;
	global.player_[inp.key][2][1][action.left] = noone;
	global.player_[inp.key][2][1][action.right] = noone;
	global.player_[inp.key][2][1][action.down] = noone;
	global.player_[inp.key][2][1][action.up] = noone;
	global.player_[inp.key][2][1][action.tongue] = noone;
	global.player_[inp.key][2][1][action.zoom_in] = noone;
	global.player_[inp.key][2][1][action.zoom_out] = noone;
	global.player_[inp.key][2][1][action.accept] = noone;
	global.player_[inp.key][2][1][action.back] = noone;
	#endregion /* Player 2 Key 1 defaults END */
	
	#region /* Player 1 Key 2 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.key][2][2][action.dive] = noone;
	global.player_[inp.key][2][2][action.jump] = noone;
	global.player_[inp.key][2][2][action.double_jump] = noone;
	global.player_[inp.key][2][2][action.crouch] = noone;
	global.player_[inp.key][2][2][action.crouch_toggle] = noone;
	global.player_[inp.key][2][2][action.sprint] = noone;
	global.player_[inp.key][2][2][action.sprint_toggle] = noone;
	global.player_[inp.key][2][2][action.left] = noone;
	global.player_[inp.key][2][2][action.right] = noone;
	global.player_[inp.key][2][2][action.down] = noone;
	global.player_[inp.key][2][2][action.up] = noone;
	global.player_[inp.key][2][2][action.tongue] = noone;
	global.player_[inp.key][2][2][action.zoom_in] = noone;
	global.player_[inp.key][2][2][action.zoom_out] = noone;
	global.player_[inp.key][2][2][action.accept] = noone;
	global.player_[inp.key][2][2][action.back] = noone;
	#endregion /* Player 2 Key 2 defaults END */
	
	global.player2_up_is_also_jump = false;
	global.player2_double_tap_to_run = true;
	global.player2_sprint_toggle = false;
	global.player2_double_tap_to_dive = false;
	global.player2_cancel_dive_by_pressing_jump_or_dive_button = false;
	global.player2_cancel_dive_by_pressing_opposite_direction = false;
	global.player2_down_and_jump_to_groundpound = false;
	global.player2_wall_jump_setting = 1;
	global.player2_drop_from_rope = 1;
	global.player2_show_controls = 1;
	#endregion /* Player 2 Keyboard Remapping (everything should be set to noone) END */
	
	#region /* After setting the keyboard controls back to default, save these settings in config */
	if (save_default_controls_to_config == true)
	{
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "player2_key_dive", global.player_[inp.key][2][1][action.dive]);
		ini_write_real("config", "player2_key2_dive", global.player_[inp.key][2][2][action.dive]);
		ini_write_real("config", "player2_key_jump", global.player_[inp.key][2][1][action.jump]);
		ini_write_real("config", "player2_key2_jump", global.player_[inp.key][2][2][action.jump]);
		ini_write_real("config", "player2_key_double_jump", global.player_[inp.key][2][1][action.double_jump]);
		ini_write_real("config", "player2_key2_double_jump", global.player_[inp.key][2][2][action.double_jump]);
		ini_write_real("config", "player2_key_crouch", global.player_[inp.key][2][1][action.crouch]);
		ini_write_real("config", "player2_key2_crouch", global.player_[inp.key][2][2][action.crouch]);
		ini_write_real("config", "player2_key_crouch_toggle", global.player_[inp.key][2][1][action.crouch_toggle]);
		ini_write_real("config", "player2_key2_crouch_toggle", global.player_[inp.key][2][2][action.crouch_toggle]);
		ini_write_real("config", "player2_key_sprint", global.player_[inp.key][2][1][action.sprint]);
		ini_write_real("config", "player2_key2_sprint", global.player_[inp.key][2][2][action.sprint]);
		ini_write_real("config", "player2_key_sprint_toggle", global.player_[inp.key][2][1][action.sprint_toggle]);
		ini_write_real("config", "player2_key2_sprint_toggle", global.player_[inp.key][2][2][action.sprint_toggle]);
		ini_write_real("config", "player2_key_left", global.player_[inp.key][2][1][action.left]);
		ini_write_real("config", "player2_key2_left", global.player_[inp.key][2][2][action.left]);
		ini_write_real("config", "player2_key_right", global.player_[inp.key][2][1][action.right]);
		ini_write_real("config", "player2_key2_right", global.player_[inp.key][2][2][action.right]);
		ini_write_real("config", "player2_key_down", global.player_[inp.key][2][1][action.down]);
		ini_write_real("config", "player2_key2_down", global.player_[inp.key][2][2][action.down]);
		ini_write_real("config", "player2_key_up", global.player_[inp.key][2][1][action.up]);
		ini_write_real("config", "player2_key2_up", global.player_[inp.key][2][2][action.up]);
		ini_write_real("config", "player2_key_tongue", global.player_[inp.key][2][1][action.tongue]);
		ini_write_real("config", "player2_key2_tongue", global.player_[inp.key][2][2][action.tongue]);
		ini_write_real("config", "player2_key_zoom_in", global.player_[inp.key][2][1][action.zoom_in]);
		ini_write_real("config", "player2_key2_zoom_in", global.player_[inp.key][2][2][action.zoom_in]);
		ini_write_real("config", "player2_key_zoom_out", global.player_[inp.key][2][1][action.zoom_out]);
		ini_write_real("config", "player2_key2_zoom_out", global.player_[inp.key][2][2][action.zoom_out]);
		ini_write_real("config", "player2_key_accept", global.player_[inp.key][2][1][action.accept]);
		ini_write_real("config", "player2_key2_accept", global.player_[inp.key][2][2][action.accept]);
		ini_write_real("config", "player2_key_back", global.player_[inp.key][2][1][action.back]);
		ini_write_real("config", "player2_key2_back", global.player_[inp.key][2][2][action.back]);
		ini_write_real("config", "player2_up_is_also_jump", global.player2_up_is_also_jump);
		ini_write_real("config", "player2_double_tap_to_run", global.player2_double_tap_to_run);
		ini_write_real("config", "player2_sprint_toggle", global.player2_sprint_toggle);
		ini_write_real("config", "player2_double_tap_to_dive", global.player2_double_tap_to_dive);
		ini_write_real("config", "player2_cancel_dive_by_pressing_jump_or_dive_button", global.player2_cancel_dive_by_pressing_jump_or_dive_button);
		ini_write_real("config", "player2_cancel_dive_by_pressing_opposite_direction", global.player2_cancel_dive_by_pressing_opposite_direction);
		ini_write_real("config", "player2_down_and_jump_to_groundpound", global.player2_down_and_jump_to_groundpound);
		ini_write_real("config", "player2_wall_jump_setting", global.player2_wall_jump_setting);
		ini_write_real("config", "player2_drop_from_rope", global.player2_drop_from_rope);
		ini_write_real("config", "player2_show_controls", global.player2_show_controls);
		ini_close();
	}
	#endregion /* After setting the keyboard controls back to default, save these settings in config END */
	
}