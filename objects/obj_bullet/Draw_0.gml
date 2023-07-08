#region /* If enemies are disabled, destroy this object */
if (global.assist_enable)
&& (global.assist_enable_enemies == false)
{
	instance_destroy();
}
#endregion /* If enemies are disabled, destroy this object END */

if (die_volting = - 1)
|| (die_volting = +1)
{
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
	#region /* Set the gravity */
	gravity_direction = 270; /* Direction of the gravity */
	gravity = 0.5; /* The gravity */
	#endregion /* Set the gravity END */
	
	sprite_index = global.resource_pack_sprite_bullet;
}
else
{
	if (flat == false)
	{
		/* Set the gravity */
		gravity_direction = 270; /* Direction of the gravity */
		gravity = 0; /* The gravity */
		sprite_index = global.resource_pack_sprite_bullet;
	}
	else
	if (flat)
	{
		gravity_direction = 270; /* Direction of the gravity */
		gravity = 0.5; /* The gravity */
		image_speed = 0.5;
		sprite_index = global.resource_pack_sprite_bullet_flattened;
		if (image_index > image_number - 1)
		{
			if (instance_exists(obj_foreground_secret))
			&& (place_meeting(x, y, obj_foreground_secret))
			&& (obj_foreground_secret.image_alpha < 0.5)
			|| (instance_exists(obj_foreground_secret))
			&& (!place_meeting(x, y, obj_foreground_secret))
			{
				effect_create_above(ef_smoke, x, y, 2, c_white);
			}
			instance_destroy();
		}
	}
}
if (image_xscale < 0)
{
	hspeed = -4;
}
else
{
	hspeed = +4;
}

var view_left = camera_get_view_x(view_camera[view_current]) - 22;
var view_right = (camera_get_view_x(view_camera[view_current])) + (camera_get_view_width(view_camera[view_current])) + 22;

if (instance_exists(obj_camera))
&& (x < view_left)
&& (image_xscale < 0)
&& (draw_xscale >= 0.8)
|| (instance_exists(obj_camera))
&& (x > view_right)
&& (image_xscale > 0)
&& (draw_xscale >= 0.8)
{
	instance_destroy();
	x = 0;
	y = 0;
}
draw_xscale = lerp(draw_xscale, 1, 0.05);
draw_yscale = lerp(draw_yscale, 1, 0.05);
draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, image_angle, image_blend, image_alpha);

#region /* Kill enemy if it's inside the wall */
if (draw_xscale >= 0.8)
{
	if (position_meeting(bbox_left, y, obj_wall))
	&& (hspeed <= 0)
	|| (position_meeting(bbox_right, y, obj_wall))
	&& (hspeed >= 0)
	{
		stuck_in_wall_counter ++;
		if (stuck_in_wall_counter >= 3)
		{
			flat = false;
			die = true;
			die_volting = true;
		}
	}
	else
	if (stuck_in_wall_counter > 0)
	{
		stuck_in_wall_counter --;
	}
}
#endregion /* Kill enemy if it's inside the wall END */