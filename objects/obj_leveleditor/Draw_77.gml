///Post-Draw Event

#region /*End Game*/
if (quit_level_editor=true)
{
	if (quit_level_editor=0)
	{
		instance_activate_all();
		quit_level_editor=1;
	}
}
if (quit_level_editor>0)
{
	quit_level_editor+=1;
	instance_activate_all();

	#region /*Save Thumbnail*/

	if (quit_level_editor=3)
	{
		if (global.select_level_index >= 1)
		{
			file_delete(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/automatic_thumbnail.png")
		}
		else
		if (global.select_level_index <= 0)
		{
			file_delete(working_directory+"/custom_levels/" + string(global.level_name)+"/automatic_thumbnail.png")
		}
		var thumbnail_sprite;
		thumbnail_sprite = sprite_create_from_surface(application_surface,
		//screenie_x,
		//weighted_x+100,
		//screenie_y,
		//weighted_y+100,
		camera_get_view_x(view_camera[view_current]),
		camera_get_view_y(view_camera[view_current]),
		camera_get_view_width(view_camera[view_current]),
		camera_get_view_height(view_camera[view_current]),
		false,true,0,0);
		if (global.select_level_index >= 1)
		{
			sprite_save(thumbnail_sprite,0,working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/automatic_thumbnail.png");
		}
		else
		if (global.select_level_index <= 0)
		{
			sprite_save(thumbnail_sprite,0,working_directory+"/custom_levels/" + string(global.level_name)+"/automatic_thumbnail.png");
		}
		sprite_delete(thumbnail_sprite);
	}
	#endregion /*Save Thumbnail End*/

	#region /*Save Level*/
	if (quit_level_editor = 4)
	{
		scr_save_custom_level();
	}
	#endregion /*Save Level END*/

	if (quit_level_editor>5)
	{
		room_goto(room_title);
	}
	#endregion /*End Game End*/
	
}