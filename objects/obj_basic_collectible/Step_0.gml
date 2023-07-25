image_index = global.collectible_image_index;

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
	
	#region /* Don't go outside view boundary */
	var view_x = camera_get_view_x(view_camera[view_current]);
	var view_y = camera_get_view_y(view_camera[view_current]);
	var view_width = camera_get_view_width(view_camera[view_current]);
	var view_height = camera_get_view_height(view_camera[view_current]);
	x = clamp(x, view_x + 32, view_x + view_width - 32);
	y = clamp(y, view_y + 32, view_y + view_height);
	#endregion /* Don't go outside view boundary END */
	
}
#endregion /* Bounce up END */