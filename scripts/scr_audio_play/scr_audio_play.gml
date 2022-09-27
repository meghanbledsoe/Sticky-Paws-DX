function scr_audio_play(sound_id, what_volume_source) /*This script is to simplify code when wanting to add sound effects to the game*/
{
	if (sound_id >= 0) /*Check if the sound even exists, otherwise the game can crash*/
	{
		
		#region /*Different audio sources play differently*/
		if (what_volume_source = volume_source.ambient)
		{
			if (!audio_is_playing(sound_id))
			{
				audio_play_sound(sound_id, 0, true, global.volume_ambient * global.volume_main);
			}
		}
		else
		if (what_volume_source = volume_source.footstep)
		{
			audio_stop_sound(sound_id); /*Stop same sound effects from playing before playing another of the same sound effect*/
			if (!audio_is_playing(sound_id))
			{
				//audio_play_sound(sound_id, 0, false, global.volume_footstep * global.volume_main);
				audio_play_sound_at(sound_id, x, y, 0, 100, 300, 1, false, 0, global.volume_footstep * global.volume_main);
			}
		}
		else
		if (what_volume_source = volume_source.music)
		{
			if (!audio_is_playing(sound_id))
			{
				audio_play_sound(sound_id, 0, true, global.volume_music * global.volume_main);
			}
		}
		else
		if (what_volume_source = volume_source.sound)
		{
			audio_stop_sound(sound_id); /*Stop same sound effects from playing before playing another of the same sound effect*/
			if (!audio_is_playing(sound_id))
			{
				//audio_play_sound(sound_id, 0, false, global.volume_sound * global.volume_main);
				audio_play_sound_at(sound_id, x, y, 0, 100, 300, 1, false, 0, global.volume_sound * global.volume_main);
			}
		}
		else
		if (what_volume_source = volume_source.voice)
		{
			audio_stop_sound(sound_id);
			if (self = obj_player)
			{
				audio_stop_sound(voice); /*Stop all voice lines of your character so lines don't play over each other*/
				audio_sound_pitch(sound_id, default_voice_pitch);
			}
			if (!audio_is_playing(sound_id))
			{
				//voice = audio_play_sound(sound_id, 0, false, global.volume_voice * global.volume_main);
				voice = audio_play_sound_at(sound_id, x, y, 0, 100, 300, 1, false, 0, global.volume_voice * global.volume_main);
			}
		}
		#endregion /*Different audio sources play differently END*/
		
	}
}