#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

if (menu_delay > 0)
{
	menu_delay --;
}

count ++;

#region /* Check if the last player just died */
if (count == 1)
&& (!instance_exists(obj_player))
{
	last_player = true;
}
#endregion /* Check if the last player just died END */

#region /* Start defeat animation, falling off screen */
if (count = 50)
{
	gravity_direction = 270;
	gravity = 0.5;
	vspeed = - 10;
	image_speed = 0.3;
	if (place_meeting(x, y, obj_lava))
	{
		audio_sound_pitch(voice_burned_die, default_voice_pitch);
		scr_audio_play(voice_burned_die, volume_source.voice);
	}
	else
	{
		audio_sound_pitch(voice_damage, default_voice_pitch);
		scr_audio_play(voice_damage, volume_source.voice);
	}
}
#endregion /* Start defeat animation, falling off screen END */

#region /* If the player is burned, have black smoke coming out */
if (burnt)
&& (speed > 0)
{
	effect_create_above(ef_smoke, x, bbox_bottom, 0, c_black);
}
#endregion /* If the player is burned, have black smoke coming out END */

#region /* Play defeat melody */
if (!instance_exists(obj_player))
&& (count = 50)
&& (last_player)
{
	scr_audio_play(player_lose_melody, volume_source.melody);
}
#endregion /* Play defeat melody END */

#region /* Limit the vertical speed */
if (vspeed >+ 32)
{
	vspeed = +32
}
#endregion /* Limit the vertical speed END */

if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
&& (!instance_exists(obj_player))
&& (iris_xscale <= 0.001)
{
	global.time_countdown = 500; /* Reset countdown back to default value */
	global.time_countdown_bonus = 500; /* Reset countdown bonus back to default value */
	sprite_index = noone;
	gravity = 0;
	speed = 0;
	if (!audio_is_playing(player_lose_melody))
	{
		if (lives >= 1)
		{
			global.timeattack_realmillisecond = 0;
			score = 0;
			scr_save_level();
			audio_stop_all();
			
			#region /* Go to level editor if you die in level editor */
			if (room == rm_leveleditor)
			{
				global.play_edited_level = false;
				room_restart();
			}
			#endregion /* Go to level editor if you die in level editor END */
			
		}
	}
	else
	{
		if (lives >= 1)
		{
			global.timeattack_realmillisecond = 0;
			score = 0;
			scr_save_level();
			audio_stop_all();
			
			#region /* Go to level editor if you die in level editor */
			if (room == rm_leveleditor)
			{
				global.play_edited_level = false;
				room_restart();
			}
			#endregion /* Go to level editor if you die in level editor END */
			
		}
	}
}
else
if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
{
	if (lives >= 1)
	&& (instance_exists(obj_player))
	{
		
		#region /* Re-enable the players for the camera */
		if (instance_exists(obj_camera))
		{
			if (player == 1) /* Re-enable player 1 */
			{
				obj_camera.player1 = noone;
				obj_camera.can_spawn_player1 = true;
			}
			if (player == 2) /* Re-enable player 2 */
			{
				obj_camera.player2 = noone;
				obj_camera.can_spawn_player2 = true;
			}
			if (player == 3) /* Re-enable player 3 */
			{
				obj_camera.player3 = noone;
				obj_camera.can_spawn_player3 = true;
			}
			if (player == 4) /* Re-enable player 4 */
			{
				obj_camera.player4 = noone;
				obj_camera.can_spawn_player4 = true;
			}
		}
		#endregion /* Re-enable the players for the camera END */
		
		instance_destroy();
	}
}

if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
&& (continue_falling == false)
{
	y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 1;
	sprite_index = noone;
}
else
if (continue_falling)
{
	gravity = 0.5;
}
if (image_index > image_number - 1)
{
	image_speed = 0;
}
else
{
	image_speed = 0.5;
}