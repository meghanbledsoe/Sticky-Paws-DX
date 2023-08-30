#region /* Bounce up */
if (bounce_up)
{
	if (delay >= delay_time)
	{
		if (basic_collectible_sound == false)
		{
			scr_audio_play(snd_basic_collectible, volume_source.sound);
			basic_collectible_sound = true;
		}
		depth = -100;
		visible = true;
		gravity_direction = 270;
		gravity = 0.5;
		
		if (vspeed > 0 && y > ystart - 32 || delay >= delay_time + 60)
		{
			alarm[0] = 1; /* Collect the basic collectible */
		}
	}
	else
	{
		delay ++;
		visible = false;
		y = ystart;
	}
}
#endregion /* Bounce up END */