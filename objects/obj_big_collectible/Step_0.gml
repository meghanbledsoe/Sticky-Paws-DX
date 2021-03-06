if (bounceup = false)
{
	if (asset_get_type("obj_camera") == asset_object)
	and(instance_exists(obj_camera))
	{
		image_index = obj_camera.image_index;
	}
}
if (bounceup = false)
{
	if (place_meeting(bbox_left, y, obj_player))
	or(place_meeting(bbox_right, y, obj_player))
	or(place_meeting(x, bbox_top, obj_player))
	or(place_meeting(x, bbox_bottom, obj_player))
	{
		if (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		{
			follow_player = true;
			if (follow_player = true)
			and(place_meeting(x, y, obj_player))
			{
				if (asset_get_type("obj_wall") == asset_object)
				and(place_meeting(x, y + 16, obj_wall))
				or(asset_get_type("obj_semisolid_platform") == asset_object)
				and(place_meeting(x, y + 16, obj_semisolid_platform))
				or(asset_get_type("obj_horizontal_rope") == asset_object)
				and(place_meeting(x, y - 16, obj_horizontal_rope))
				or(instance_nearest(x, y, obj_player).climb = true)
				{
					effect_create_above(ef_ring, x, y, 2, c_white);
					#region /*3 Basic Collectibles*/
					if (asset_get_type("obj_basic_collectible") == asset_object)
					{
						var obj;
						obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
						with(obj)
						{
							image_speed = 1;
							motion_set(90, 10);
							bounceup = true;
						}
						obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
						with(obj)
						{
							image_speed = 1;
							motion_set(90, 10);
							bounceup = true;
							delay_time = 10;
						}
						obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
						with(obj)
						{
							image_speed = 1;
							motion_set(90, 10);
							bounceup = true;
							delay_time = 20;
						}
					}
					#endregion /*3 Basic Collectibles END*/
					
					#region /*1000 Score*/
					score += 1000;
					if (asset_get_type("obj_scoreup") == asset_object)
					{
						obj = instance_create_depth(x, y, 0, obj_scoreup);
						with(obj)
						{
							scoreup = 1000;
						}
					}
					#endregion /*1000 Score END*/
					
					#region /*What Big Collectible is this?*/
					if (big_collectible_number = 1)
					{
						global.big_collectible_number1 = true;
					}
					if (big_collectible_number = 2)
					{
						global.big_collectible_number2 = true;
					}
					if (big_collectible_number = 3)
					{
						global.big_collectible_number3 = true;
					}
					if (big_collectible_number = 4)
					{
						global.big_collectible_number4 = true;
					}
					if (big_collectible_number = 5)
					{
						global.big_collectible_number5 = true;
					}
					#endregion /*What Big Collectible is this? END*/
					
					if asset_get_type("snd_basic_collectible") == asset_sound
					{
						audio_play_sound(snd_basic_collectible, 0, 0);
						audio_sound_gain(snd_basic_collectible, global.sfx_volume, 0);
					}
					instance_destroy();
				}
			}
		}
	}
}

#region /*Follow Player*/
if (follow_player = true)
{
	if (instance_exists(obj_player))
	and(distance_to_object(obj_player) < sprite_height + sprite_width)
	{
		
		#region /*Show Big Collectible HUD*/
		global.hud_show_big_collectibles = true;
		if (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_big_collectibles_timer = global.hud_show_timer;
			}
		}
		#endregion /*Show Big Collectible HUD END*/
		
		x = lerp(x, instance_nearest(x, y, obj_player).x-16, 0.5);
		y = lerp(y, instance_nearest(x, y, obj_player).y-16, 0.5);
	}
	else
	{
		x = lerp(x, xstart, 0.5);
		y = lerp(y, ystart, 0.5);
		if (x = xstart)
		and(y = ystart)
		{
			follow_player = false;
		}
	}
}
#endregion /*Follow Player End*/

if bounceup = true
{
	
	#region /*Show Big Collectible HUD*/
	global.hud_show_big_collectibles = true;
	if (instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_big_collectibles_timer = global.hud_show_timer;
		}
	}
	#endregion /*Show Big Collectible HUD END*/
	
	if (delay >= delay_time)
	{
		if (coinsound = false)
		{
			if (asset_get_type("snd_basic_collectible") == asset_sound)
			{
				audio_play_sound(snd_basic_collectible, 0, 0);
			}
			coinsound = true;
		}
		visible = true;
		
		#region /*Set the gravity*/
		gravity_direction = 270; /*Direction of the gravity*/
		gravity = 0.5; /*The gravity*/
		#endregion /*Set the gravity END*/
		
		if (vspeed > 0)
		and (y > ystart - 32)
		{
			#region /*3 Basic Collectibles*/
			if (asset_get_type("obj_basic_collectible") == asset_object)
			{
				var obj;
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
				}
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 10;
				}
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 20;
				}
			}
			#endregion /*3 Basic Collectibles END*/
			
			#region /*1000 Score*/
			score += 1000;
			if (asset_get_type("obj_scoreup") == asset_object)
			{
				obj = instance_create_depth(x, y, 0, obj_scoreup);
				with(obj)
				{
					scoreup = 1000;
				}
			}
			#endregion /*1000 Score END*/
			
			#region /*What Big Collectible is this?*/
			if (big_collectible_number = 1)
			{
				global.big_collectible_number1 = true;
			}
			if (big_collectible_number = 2)
			{
				global.big_collectible_number2 = true;
			}
			if (big_collectible_number = 3)
			{
				global.big_collectible_number3 = true;
			}
			if (big_collectible_number = 4)
			{
				global.big_collectible_number4 = true;
			}
			if (big_collectible_number = 5)
			{
				global.big_collectible_number5 = true;
			}
			#endregion /*What Big Collectible is this? END*/
			
			effect_create_above(ef_ring, x, y, 2, c_white);
			instance_destroy();
		}
	}
	else
	{
		delay += 1;
		visible = false;
		y = ystart;
	}
	
	#region /*Don't go outside view boundary*/
	if (x < camera_get_view_x(view_camera[view_current]) + 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + 32;
	}
	if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32;
	}
	#endregion /*Don't go outside view boundary END*/
	
}

if (big_collectible_number = 1)
and(global.big_collectible_number1 = true)
{
	image_alpha = 0.5;
	image_blend = c_gray;
}
if (big_collectible_number = 2)
and(global.big_collectible_number2 = true)
{
	image_alpha = 0.5;
	image_blend = c_gray;
}
if (big_collectible_number = 3)
and(global.big_collectible_number3 = true)
{
	image_alpha = 0.5;
	image_blend = c_gray;
}
if (big_collectible_number = 4)
and(global.big_collectible_number4 = true)
{
	image_alpha = 0.5;
	image_blend = c_gray;
}
if (big_collectible_number = 5)
and(global.big_collectible_number5 = true)
{
	image_alpha = 0.5;
	image_blend = c_gray;
}

#region /*If big collectible value is 0, destroy the big collectible*/
if (big_collectible_number = 0)
{
	instance_destroy();
}
#endregion /*If big collectible value is 0, destroy the big collectible END*/

#region /*Expanding Ring Effect*/
effect_time += 1;
if (effect_time > 60)
{
	effect_time = 0;
	effect_create_above(ef_ring, x, y, 1, c_white);
}
#endregion /*Expanding Ring Effect End*/