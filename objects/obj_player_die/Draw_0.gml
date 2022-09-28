count += 1;

#region /*Check if the last player just died*/
if (count = 1)
and (asset_get_type("obj_player") == asset_object)
and (!instance_exists(obj_player))
{
	last_player = true;
}
#endregion /*Check if the last player just died END*/

#region /*Start death animation, falling off screen*/
if (count = 50)
{
	gravity_direction = 270;
	gravity = 0.5;
	vspeed = - 10;
	image_speed = 0.3;
	if (asset_get_type("obj_lava") == asset_object)
	and (place_meeting(x, y, obj_lava))
	{
		if (asset_get_type("spr_player_burnt") == asset_sprite)
		{
			sprite_index = spr_player_burnt;
		}
		audio_sound_pitch(voice_burned_die, default_voice_pitch);
		scr_audio_play(voice_burned_die, volume_source.voice);
	}
	else
	{
		audio_sound_pitch(voice_damage, default_voice_pitch);
		scr_audio_play(voice_damage, volume_source.voice);
	}
}
#endregion /*Start death animation, falling off screen END*/

#region /*If the player is burned, have black smoke coming out*/
if (asset_get_type("spr_player_burnt") == asset_sprite)
and (sprite_index = spr_player_burnt)
{
	effect_create_above(ef_smoke, x, bbox_bottom, 0, c_black);
}
#endregion /*If the player is burned, have black smoke coming out END*/

#region /*Play death melody*/
if (!instance_exists(obj_player))
and (count = 50)
and (last_player = true)
{
	scr_audio_play(snd_die_melody, volume_source.sound);
}
#endregion /*Play death melody END*/

#region /*Limit the vertical speed*/
if (vspeed >+ 32)
{
	vspeed = +32
}
#endregion /*Limit the vertical speed END*/

if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
and (!instance_exists(obj_player))
and (iris_xscale <= 0.001)
{
	global.time_countdown = 500; /*Reset countdown back to default value*/
	global.time_countdown_bonus = 500; /*Reset countdown bonus back to default value*/
	sprite_index = noone;
	gravity = 0;
	speed = 0;
	if (asset_get_type("snd_die_melody") == asset_sound)
	and (!audio_is_playing(snd_die_melody))
	{
		if (lives >= 1)
		{
			global.timeattack_realmillisecond = 0;
			global.level_clear_rate = noone;
			score = 0;
			scr_save_level();
			audio_stop_all();
			
			#region /*Go to level editor if you die in level editor*/
			if (asset_get_type("room_leveleditor") == asset_room)
			and (room == room_leveleditor)
			{
				global.play_edited_level = false;
				room_restart();
			}
			#endregion /*Go to level editor if you die in level editor END*/
			
		}
	}
	else
	{
		if (lives >= 1)
		{
			global.timeattack_realmillisecond = 0;
			global.level_clear_rate = noone;
			score = 0;
			scr_save_level();
			audio_stop_all();
		
			#region /*Go to level editor if you die in level editor*/
			if (asset_get_type("room_leveleditor") == asset_room)
			and (room =room_leveleditor)
			{
				global.play_edited_level = false;
				room_restart();
			}
			#endregion /*Go to level editor if you die in level editor END*/
			
		}
	}
}
else
if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
{
	if (lives >= 1)
	and (instance_exists(obj_player))
	{
		
		#region /*Disable the players for the camera*/
		
		#region /*Disable player 1*/
		if (player == 1)
		and (instance_exists(obj_camera))
		{
			obj_camera.player1 = noone;
			obj_camera.can_spawn_player1 = true;
		}
		#endregion /*Disable player 1 END*/
		
		#region /*Disable player 2*/
		if (player == 2)
		and (instance_exists(obj_camera))
		{
			obj_camera.player2 = noone;
			obj_camera.can_spawn_player2 = true;
		}
		#endregion /*Disable player 2 END*/
		
		#region /*Disable player 3*/
		if (player == 3)
		and (instance_exists(obj_camera))
		{
			obj_camera.player3 = noone;
			obj_camera.can_spawn_player3 = true;
		}
		#endregion /*Disable player 3 END*/
		
		#region /*Disable player 4 */
		if (player == 4)
		and (instance_exists(obj_camera))
		{
			obj_camera.player4 = noone;
			obj_camera.can_spawn_player4 = true;
		}
		#endregion /*Disable player 4 END*/
		
		#endregion /*Disable the players for the camera END*/
		
		instance_destroy();
	}
}

if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
and (continue_falling = false)
{
	y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 1;
	sprite_index = noone;
}
else
if (continue_falling = true)
{
	gravity = 0.5;
}

if (!instance_exists(obj_player))
and (count >49)
and (last_player = true)
{
	if (iris_zoom == 0)
	{
		iris_xscale = lerp(iris_xscale, 1, 0.1);
		iris_yscale = lerp(iris_yscale, 1, 0.1);
	}
	else
	{
		iris_xscale = lerp(iris_xscale, 0, 0.1);
		iris_yscale = lerp(iris_yscale, 0, 0.1);
	}
	if (iris_xscale <= 1.1)
	{
		iris_zoom = 1;
	}
	if (asset_get_type("obj_player_die") == asset_object)
	and (instance_exists(obj_player_die))
	{
		if (iris_xscale < 16)
		and (global.enable_transitions = true)
		{
			if (asset_get_type("spr_iris_dead") == asset_sprite)
			{
				draw_sprite_ext(spr_iris_dead, image_index, xx, yy, iris_xscale, iris_yscale, image_angle, image_blend, image_alpha);
			}
			else
			if (asset_get_type("spr_iris") == asset_sprite)
			{
				draw_sprite_ext(spr_iris, image_index, xx, yy, iris_xscale, iris_yscale, image_angle, image_blend, image_alpha);
			}
			draw_rectangle_color(0, 0, room_width * 3, yy - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, 0, xx - iris_xscale * 128, room_height* 3, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(xx + iris_xscale * 128, 0, room_width * 3, room_height* 3, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, yy + iris_yscale * 128, room_width * 3, room_height* 3, c_black, c_black, c_black, c_black, false);
		}
	}
}
if (image_index > image_number - 1)
{
	image_speed = 0;
}
else
{
	image_speed = 0.5;
}
if (sprite_index > 0)
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * default_xscale, image_yscale * default_yscale, image_angle, image_blend, image_alpha);
}

#region /*Bubble*/
if (bubble = true)
{
	
	#region /*Don't go outside view boundary*/
	if (x < camera_get_view_x(view_camera[view_current]) + 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + 32;
	}
	if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32;
	}
	if (y < camera_get_view_y(view_camera[view_current]) + 32)
	{
		y = camera_get_view_y(view_camera[view_current]) + 32;
	}
	if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32)
	{
		y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32;
	}
	#endregion /*Don't go outside view boundary END*/
	
	image_speed = 0.5;
	gravity = 0;
	if (key_up)
	{
		vspeed-= 0.4;
	}
	if (key_left)
	{
		hspeed-= 0.4;
		image_xscale = -1;
	}
	if (key_right)
	{
		hspeed += 0.4;
		image_xscale = +1;
	}
	if (key_down)
	{
		vspeed += 0.4;
	}
	if (key_a)
	{
		move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 128);
	}
	if (!position_meeting(x, y, obj_wall))
	and (place_meeting(x, y, obj_player))
	{
		vspeed = - 11.5;
		bubble = false;
	}
	if (vspeed <-4)
	{
		vspeed = -4;
	}
	if (hspeed <-4)
	{
		hspeed = -4;
	}
	if (hspeed >+ 4)
	{
		hspeed = +4;
	}
	if (vspeed >+ 4)
	{
		vspeed = +4;
	}
	friction = 0.2;

	#region /*Bubble*/
	draw_self();
	draw_circle_color(x, y, 52, c_black, c_black, true);
	draw_circle_color(x, y, 53, c_white, c_white, true);
	draw_circle_color(x, y, 54, c_white, c_white, true);
	draw_circle_color(x, y, 55, c_white, c_white, true);
	draw_circle_color(x, y, 56, c_black, c_black, true);
	#endregion /*Bubble END*/

	#region /*If there are no more players in the room*/
	if (!instance_exists(obj_player))
	{
		bubble = false;
		count = 0;
	}
	#endregion /*If there are no more players in the room END*/
}
#endregion /*Bubble END*/

#region /*Display Player Number and Name*/
if (global.playergame > 0)
and (y < room_height)
and (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (player == 1)
	{
		if (global.player1_name = "")
		{
			scr_draw_text_outlined(x, y - 64, "P1", global.default_text_size, c_black, global.player1_color, 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64,string(global.player1_name), global.default_text_size, c_black, global.player1_color, 1);
		}
	}
	if (player == 2)
	{
		if (global.player2_name = "")
		{
			scr_draw_text_outlined(x, y - 64, "P2", global.default_text_size, c_black, global.player2_color, 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64,string(global.player2_name), global.default_text_size, c_black, global.player2_color, 1);
		}
	}
	if (player == 3)
	{
		if (global.player3_name = "")
		{
			scr_draw_text_outlined(x, y - 64, "P3", global.default_text_size, c_black, global.player3_color, 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64,string(global.player3_name), global.default_text_size, c_black, global.player3_color, 1);
		}
	}
	if (player == 4)
	{
		if (global.player4_name = "")
		{
			scr_draw_text_outlined(x, y - 64, "P4", global.default_text_size, c_black, global.player4_color, 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64,string(global.player4_name), global.default_text_size, c_black, global.player4_color, 1);
		}
	}
}
#endregion /*Display Player Number and Name END*/