function scr_show_fps()
{
	
	#region /*Show FPS*/
	if (global.pause = false)
	and(asset_get_type("obj_title") == asset_object)
	and(!instance_exists(obj_title))
	{
		
		#region /*FPS*/
		if (global.show_fps = true)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			
			if (fps >= 60)
			{
				draw_text_outlined(30, 100, "FPS: " + string(fps) + " / " + string(room_speed), global.default_text_size, c_black, c_lime, 1);
			}
			else
			{
				draw_text_outlined(30, 100, "FPS: " + string(fps) + " / " + string(room_speed), global.default_text_size, c_black, make_colour_hsv(50/60*fps, 255, 255), 1);
			}
		
		}
		#endregion /*FPS END*/
		
		#region /*FPS Real*/
		if (global.show_fps_real = true)
		{
			if (fps_real >= 120)
			{
				draw_text_outlined(30, 132, "FPS Real: " + string(fps_real), global.default_text_size, c_black, c_lime, 1);
			}
			else
			{
				draw_text_outlined(30, 132, "FPS Real: " + string(fps_real), global.default_text_size, c_black, make_colour_hsv(50/120*fps_real, 255, 255), 1);
			}
		}
		#endregion /*FPS Real END*/
		
	}
	#endregion /*Show FPS END*/
	
}