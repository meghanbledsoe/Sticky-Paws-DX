depth =+ 9;

#region /*If enemies are disabled, destroy this object*/
if (global.enable_enemies = false)
{
	instance_destroy();
}
#endregion /*If enemies are disabled, destroy this object END*/

if (die_volting = -1)
or(die_volting = +1)
{
	depth = -900;
	if (die_volting = -1)
	{
		image_angle -= 20;
		hspeed = +4;
	}
	else
	{
		image_angle += 20;
		hspeed = -4;
	}
	
	#region /*Set the gravity*/
	gravity_direction = 270; /*Direction of the gravity*/
	gravity = 0.5; /*The gravity*/
	#endregion /*Set the gravity END*/
	
}
else
{

	#region /*Set the gravity*/
	gravity_direction = 270; /*Direction of the gravity*/
	#endregion /*Set the gravity END*/
	
	if (asset_get_type("obj_wall") == asset_object)
	{
		if (!place_meeting(x, y + 1, obj_wall))
		and(x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		and(x > camera_get_view_x(view_camera[view_current]))
		and(y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		and(y > camera_get_view_y(view_camera[view_current]))
		{
			gravity = 0.5; /*The gravity*/
		}
	}
	else
	{
		gravity = 0;
	}
	if flat = true
	{
		speed = 0;
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.5;
		}
		sprite_index = sprite_flat;
		if (image_index > image_number - 1)
		{
			effect_create_above(ef_smoke, x, y, 2, c_white);
			instance_destroy();
		}
	}
}
mask_index = mask;

if (asset_get_type("obj_player") == asset_object)
{
	if (instance_number(obj_player) > 0)
	{
		if (die = false)
		{
			if (instance_nearest(x, y, obj_player).x < x)
			{
				image_xscale = -1;
			}
			else
			{
				image_xscale = +1;
			}
		}
	}
}