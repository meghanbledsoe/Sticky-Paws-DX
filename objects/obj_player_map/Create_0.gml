active_left = false;
active_right = false;
active_up = false;
active_down = false;

/*Player 1 Key Left Hold*/ key_left = (keyboard_check(global.player1_key_left)) and (!keyboard_check(global.player1_key_right)) or(keyboard_check(vk_left)) and (!keyboard_check(vk_right)) or(keyboard_check(ord("A"))) and (!keyboard_check(ord("D"))) or(gamepad_button_check(0, gp_padl)) and (!gamepad_button_check(0, gp_padr)) or(gamepad_axis_value(0, gp_axislh) < 0);
/*Player 1 Key Right Hold*/ key_right = (keyboard_check(global.player1_key_right)) and (!keyboard_check(global.player1_key_left)) or(keyboard_check(vk_right)) and (!keyboard_check(vk_left)) or(keyboard_check(ord("D"))) and (!keyboard_check(ord("A"))) or(gamepad_button_check(0, gp_padr)) and (!gamepad_button_check(0, gp_padl)) or(gamepad_axis_value(0, gp_axislh) > 0);
/*Player 1 Key Down Hold*/ key_down = (keyboard_check(global.player1_key_down)) and (!keyboard_check(global.player1_key_up)) or(keyboard_check(vk_down)) and (!keyboard_check(vk_up)) or(keyboard_check(ord("S"))) and (!keyboard_check(ord("W"))) or(gamepad_button_check(0, gp_padd)) and (!gamepad_button_check(0, gp_padu)) or(gamepad_axis_value(0, gp_axislv) > 0);
/*Player 1 Key Up Hold*/ key_up = (keyboard_check(global.player1_key_up)) and (!keyboard_check(global.player1_key_down)) or(keyboard_check(vk_up)) and (!keyboard_check(vk_down)) or(keyboard_check(ord("W"))) and (!keyboard_check(ord("S"))) or(gamepad_button_check(0, gp_padu)) and (!gamepad_button_check(0, gp_padd)) or(gamepad_axis_value(0, gp_axislv) < 0);
/*Player 1 Key Accept Pressed*/ key_a_pressed = (gamepad_button_check_pressed(0, gp_face1)) or(keyboard_check_pressed(global.player1_key_jump)) or(keyboard_check_pressed(global.player1_key2_jump)) or(keyboard_check_pressed(vk_space)) or(keyboard_check_pressed(vk_enter)) or(keyboard_check_pressed(ord("Z")));
/*Player 1 Key Back Pressed*/ key_b_pressed = (gamepad_button_check_pressed(0, gp_face2)) or(keyboard_check_pressed(global.player1_key_dive)) or(keyboard_check_pressed(global.player1_key2_dive)) or(keyboard_check_pressed(global.player1_key_sprint)) or(keyboard_check_pressed(global.player1_key2_sprint)) or(keyboard_check_pressed(vk_backspace)) or(keyboard_check_pressed(vk_escape)) or(keyboard_check_pressed(ord("X")));

#region /*Play as custom character*/
initialize_custom_character_timer = 0;
if (global.player1_can_play = true)
{
	player = 1;
	selected_voice_pack = global.voicepack_for_player_1;
	selected_skin = global.skin_for_player_1;
}
else
if (global.player2_can_play = true)
{
	player = 2;
	selected_voice_pack = global.voicepack_for_player_2;
	selected_skin = global.skin_for_player_2;
}
else
if (global.player3_can_play = true)
{
	player = 3;
	selected_voice_pack = global.voicepack_for_player_3;
	selected_skin = global.skin_for_player_3;
}
else
if (global.player4_can_play = true)
{
	player = 4;
	selected_voice_pack = global.voicepack_for_player_4;
	selected_skin = global.skin_for_player_4;
}
else
{
	player = 1;
	selected_voice_pack = global.voicepack_for_player_1;
	selected_skin = global.skin_for_player_1;
}

alarm[0] = 1; /*Initialize custom character timer. This code needs to be initialized later than create event, but not in step event, so only initialize in alarm*/

#region /*Allow moves on world map*/
allow_free_movement = false; /*Turn this to true to move freely on the map instead of moving on paths, should be false by default*/
#endregion /*Allow moves on world map END*/

global.pause_room = noone;
depth = -100;

#region /*Mouse x and mouse y initializing*/
mouse_x_position = window_mouse_get_x();
mouse_y_position = window_mouse_get_y();
#endregion /*Mouse x and mouse y initializing END*/

if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index = spr_wall;
}
global.player_has_entered_goal = false;
global.quit_level = false;
global.quit_to_map = false;

#region /*Reset timer back to zero*/
global.timeattack_realmillisecond = 0;
global.timeattack_millisecond = 0;
global.timeattack_second = 0;
global.timeattack_minute = 0;
#endregion /*Reset timer back to zero END*/

image_speed = 0.3;
current_file = global.file;
view_hview_lerp = 0;
view_wview_lerp = 0;
can_move = true;
can_enter = true;
entering_level = false;
delay = 0;
black_screen_at_start_delay = 0;
transfer_data = false;
fastest_time = 0;
move_delay = 0;
stop_at_level = false;
can_enter_level = 0;
draw_xscale = 1;
draw_yscale = 1;
default_xscale = 1;
default_yscale = 1;

#region /*Load Game*/
if (file_exists(working_directory + "save_files/file" + string(global.file) + ".ini"))
{
	ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
	
	brand_new_file = ini_read_real("Player", "brand_new_file", true);
	
	#region /*Load Player Position*/
	if (ini_read_real("Player", "player_x", 0) > 0)
	and (ini_read_real("Player", "player_y", 0) > 0)
	{
		x = ini_read_real("Player", "player_x", 0);
		y = ini_read_real("Player", "player_y", 0);
		if (!position_meeting(x, y, obj_level))
		{
			x = instance_nearest(x, y, obj_level).x;
			y = instance_nearest(x, y, obj_level).y;
		}
	}
	#endregion /*Load Player Position END*/
	
	xx_heart = x;
	yy_heart = y - 64;
	
	#region /*Have Heart Balloon*/
	if (player = 1)
	{
		if (ini_key_exists("Player", "player_1_have_heart_balloon"))
		{
			have_heart_balloon = ini_read_real("Player", "player_1_have_heart_balloon", false); /*If you have the heart balloon upgrade or not*/
		}
		else
		{
			ini_write_real("Player", "player_1_have_heart_balloon", false);
			have_heart_balloon = false; /*If you have the heart balloon upgrade or not. You start without it*/
		}
	}
	if (player = 2)
	{
		if (ini_key_exists("Player", "player_2_have_heart_balloon"))
		{
			have_heart_balloon = ini_read_real("Player", "player_2_have_heart_balloon", false); /*If you have the heart balloon upgrade or not*/
		}
		else
		{
			ini_write_real("Player", "player_2_have_heart_balloon", false);
			have_heart_balloon = false; /*If you have the heart balloon upgrade or not. You start without it*/
		}
	}
	if (player = 3)
	{
		if (ini_key_exists("Player", "player_3_have_heart_balloon"))
		{
			have_heart_balloon = ini_read_real("Player", "player_3_have_heart_balloon", false); /*If you have the heart balloon upgrade or not*/
		}
		else
		{
			ini_write_real("Player", "player_3_have_heart_balloon", false);
			have_heart_balloon = false; /*If you have the heart balloon upgrade or not. You start without it*/
		}
	}
	if (player = 4)
	{
		if (ini_key_exists("Player", "player_4_have_heart_balloon"))
		{
			have_heart_balloon = ini_read_real("Player", "player_4_have_heart_balloon", false); /*If you have the heart balloon upgrade or not*/
		}
		else
		{
			ini_write_real("Player", "player_4_have_heart_balloon", false);
			have_heart_balloon = false; /*If you have the heart balloon upgrade or not. You start without it*/
		}
	}
	#endregion /*Have Heart Balloon END*/
	
	ini_close();
	move_snap(32, 32);
}
else
{
	ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
	ini_write_real("Player", "brand_new_file", true);
	ini_close();
	brand_new_file = true;
	xx_heart = x;
	yy_heart = y - 64;
	have_heart_balloon = false; /*If you have the heart balloon upgrade or not. You start without it*/
}
#endregion /*Load Game END*/

xx = x;
yy = y;

iris_xscale = 0;
iris_yscale = 0;
iris_zoom = 0;

sprite_map_xorig = 0;
sprite_map_yorig = 0;
sprite_map_enter_level_xorig = 0;
sprite_map_enter_level_yorig = 0;
sprite_stand_xorig = 0;
sprite_stand_yorig = 0;
sprite_walk_xorig = 0;
sprite_walk_yorig = 0;

index = 0;
sprite_map = noone;
sprite_map_enter_level = noone;
sprite_stand = noone;
sprite_walk = noone;
#endregion /*Play as custom character END*/

scr_config_load(); /*Load Config only once in create event, or it will mess up the options menu navigation*/

/*Make number of level cleared 1 because of the level intro*/
ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
if (ini_read_real("Player", "number_of_levels_cleared", 1) < 1)
{
	ini_write_real("Player", "number_of_levels_cleared", 1)
}
ini_close();

#region /*Reset level zoom*/
if (global.reset_level_zoom_when_going_back_to_map = true)
{
	global.zoom_level = global.default_zoom_level;
	ini_open("config.ini");
	ini_write_real("config", "zoom_level", global.default_zoom_level);
	ini_close();
}
#endregion /*Reset level zoom END*/

#region /*Reset world map zoom*/
if (global.reset_world_map_zoom_when_going_back_to_map = true)
{
	global.zoom_world_map = global.default_zoom_world_map;
	zoom_lerp = global.default_zoom_world_map;
	zoom_border_lerp = 0;
	ini_open("config.ini");
	ini_write_real("config", "zoom_world_map", global.default_zoom_world_map);
	ini_close();
}
#endregion /*Reset world map zoom END*/

else
{
	zoom_lerp = global.zoom_world_map;
	zoom_border_lerp = 0;
}