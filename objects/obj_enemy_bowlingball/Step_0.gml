#region /* if enemies are disabled, destroy this object*/
if (global.assist_enable = true)
and (global.assist_enable_enemies = false)
{
	instance_destroy();
}
#endregion /* if enemies are disabled, destroy this object END*/

if (die_volting = -1)
or(die_volting = +1)
{
	depth = -900;
	if (die_volting = - 1)
	{
		draw_angle -= 20;
		hspeed = +4;
	}
	else
	{
		draw_angle += 20;
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
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		and (x > camera_get_view_x(view_camera[view_current]))
		and (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		and (y > camera_get_view_y(view_camera[view_current]))
		{
			gravity = 0.5; /*The gravity*/
		}
	}
	else
	{
		gravity = 0;
	}
	#endregion /*Set the gravity END*/
	
	if (flat = true)
	{
		image_speed = 0.5;
		sprite_used = "flattened";
		sprite_index = global.resourcepack_sprite_enemy_bowlingball_stomped;
		
		if (stomped_delay > 0)
		{
			stomped_delay -= 1;
		}
	}
}
if (flat = false)
{
	if (image_xscale < 0)
	{
		hspeed = - 1;
	}
	else
	{
		hspeed = +1;
	}
	
	#region /*Turn around*/
	if (position_meeting(bbox_left - 1, y, obj_wall))
	and (flat = false)
	{
		image_xscale = +1;
	}
	if (position_meeting(bbox_right + 1, y, obj_wall))
	and (flat = false)
	{
		image_xscale = -1;
	}
	#endregion /*Turn around END*/
	
	sprite_index = global.resourcepack_sprite_enemy_bowlingball_walk;
	image_speed = 0.3;
}

if (sliding_along_ground = -1)
and (flat = true)
and (die = false)
{
	hspeed = -sliding_along_ground_speed;
	draw_angle += 10;
	if (position_meeting(bbox_left - 1, y, obj_wall))
	{
		sliding_along_ground = +1;
	}
}
else
if (sliding_along_ground = +1)
and (flat = true)
and (die = false)
{
	hspeed = +sliding_along_ground_speed;
	draw_angle -= 10;
	if (position_meeting(bbox_right + 1, y, obj_wall))
	{
		sliding_along_ground = -1;
	}
}
else
if (sliding_along_ground = 0)
and (flat = true)
and (die = false)
{
	hspeed = 0;
}

#region /*Kill enemy if it's inside the wall*/
if (position_meeting(x, y, obj_wall))
and (die = false)
and (draw_xscale >= 0.8)
{
	flat = false;
	die = true;
	die_volting = true;
}
#endregion /*Kill enemy if it's inside the wall END*/