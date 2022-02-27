#region /*If enemies are disabled, destroy this object*/
if (global.assist_enable = true)
and (global.assist_enable_enemies = false)
{
	instance_destroy();
}
#endregion /*If enemies are disabled, destroy this object END*/

if (die_volting = - 1)
or(die_volting = +1)
{
	depth = -900;
	if (die_volting = - 1)
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
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	and (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
	and (x > camera_get_view_x(view_camera[view_current]))
	and (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
	and (y > camera_get_view_y(view_camera[view_current]))
	{
		gravity = 0.5; /*The gravity*/
	}
	else
	{
		gravity = 0;
	}
	#endregion /*Set the gravity END*/
	
	if (image_xscale < 0)
	{
		hspeed = - 1;
	}
	else
	{
		hspeed = +1;
	}
	if (flat = true)
	{
		speed = 0;
		image_speed = 0.5;
		sprite_used = "flattened";
		if (global.resourcepack_sprite_basic_enemy_flattened > noone){sprite_index = global.resourcepack_sprite_basic_enemy_flattened;}
		if (image_index > image_number - 1)
		{
		effect_create_above(ef_smoke, x, y, 2, c_white);
		instance_destroy();
		}
	}
}
if (flat = false)
{
	if (distance_to_object(obj_player)<256)
	{
		sprite_used = "angry";
		sprite_index = global.resourcepack_sprite_basic_enemy_angry;
		if (blind = true)
		{
			if (global.resourcepack_sprite_basic_enemy_blind > noone){sprite_index = global.resourcepack_sprite_basic_enemy_blind;}else
			if (global.resourcepack_sprite_basic_enemy_angry > noone){sprite_index = global.resourcepack_sprite_basic_enemy_angry;}
		}
		else
		{
			if (global.resourcepack_sprite_basic_enemy_angry > noone){sprite_index = global.resourcepack_sprite_basic_enemy_angry;}else
			if (global.resourcepack_sprite_basic_enemy_blind > noone){sprite_index = global.resourcepack_sprite_basic_enemy_blind;}
		}
	}
	else
	{
		sprite_used = "stand";
		if (blind = true)
		{
			if (global.resourcepack_sprite_basic_enemy_blind > noone){sprite_index = global.resourcepack_sprite_basic_enemy_blind;}else
			if (global.resourcepack_sprite_basic_enemy > noone){sprite_index = global.resourcepack_sprite_basic_enemy;}
		}
		else
		{
			if (global.resourcepack_sprite_basic_enemy > noone){sprite_index = global.resourcepack_sprite_basic_enemy;}else
			if (global.resourcepack_sprite_basic_enemy_blind > noone){sprite_index = global.resourcepack_sprite_basic_enemy_blind;}
		}
	}
}

#region /*Turn around*/
if (position_meeting(bbox_left - 1, y, obj_wall))
{
	image_xscale = +1;
}
if (position_meeting(bbox_right + 1, y, obj_wall))
{
	image_xscale = -1;
}
#endregion /*Turn around END*/

if (blind = false)
and (place_meeting(x, y + 1, obj_wall))
or (blind = false)
and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	if (!place_meeting(x + 5, y + 1, obj_wall))
	and (!position_meeting(x + 5, bbox_bottom + 1, obj_semisolid_platform))
	{
		image_xscale = -1;
	}
	else
	if (!place_meeting(x - 5, y + 1, obj_wall))
	and (!position_meeting(x - 5, bbox_bottom + 1, obj_semisolid_platform))
	{
		image_xscale = +1;
	}
}

if (coil_spring = true)
and (die = false)
and (place_meeting(x, y + 1, obj_wall))
or (coil_spring = true)
and (die = false)
and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	if (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	and (obj_camera.iris_xscale > 1)
	{
		effect_create_above(ef_smoke, x - 16,bbox_bottom, 0, c_white);
		effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
		effect_create_above(ef_smoke, x + 16,bbox_bottom, 0, c_white);
		effect_create_above(ef_smoke, x - 16- 8,bbox_bottom- 8, 0, c_white);
		effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
		effect_create_above(ef_smoke, x + 16 +8,bbox_bottom- 8, 0, c_white);
	}
	vspeed = -15;
	gravity = 0;
	draw_xscale = 1.25;
	draw_yscale = 0.75;
}

#region /*Don't move outside view*/
if (x - 42 > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
or (x + 42 < camera_get_view_x(view_camera[view_current]))
{
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	gravity = 0;
}
if (y + 16 < camera_get_view_y(view_camera[view_current]))
and (!place_meeting(x, y + 1, obj_wall))
and (!place_meeting(x, y + 1, obj_semisolid_platform))
and (flat = true)
and (vspeed < 0)
{
	vspeed = +1;
}
#endregion /*Don't move outside view END*/

#region /*Kill enemy if it's inside the wall*/
if (position_meeting(x, y, obj_wall))
and (die = false)
and (draw_xscale >= 0.8)
{
	stuck_in_wall_counter += 1;
	if (stuck_in_wall_counter >= 3)
	{
		flat = false;
		die = true;
		die_volting = true;
	}
}
else
{
	if (stuck_in_wall_counter > 0)
	{
		stuck_in_wall_counter -= 1;
	}
}
#endregion /*Kill enemy if it's inside the wall END*/