/* Step Event */
depth = -bbox_bottom* 0.1;

if die_volting = -1 or die_volting = +1
{
	if die_volting = -1
	{
		image_angle -= 20;
		hspeed = +4;
	}
	else
	{
		image_angle += 20;
		hspeed = -4;
	}
	/* Sets the gravity */
	gravity_direction = 270; /* Direction of the gravity */
	gravity = 0.5; /* The gravity */
}
else
{
	/* Sets the gravity */
	gravity_direction = 270; /* Direction of the gravity */
	if (!place_meeting(x, y + 1, obj_wall))
	{
		gravity = 0; /* The gravity */
	}
	if flat = true
	{
		/* Image_yscale = lerp(image_yscale, 0.1, 0.2); */
		speed = 0;
		image_speed = 0.5;
		if image_xscale = -1
		{
			die_volting = -1;
		}
		else
		{
			die_volting = +1;
		}
	}
}
mask_index = spr_wall;


if image_xscale < 0
{
	hspeed = - 8;
}
else
{
	hspeed = + 8;
}
if (x < camera_get_view_x(view_camera[view_current]) + sprite_width)
&& (image_xscale < 0)
|| (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + sprite_width)
&& (image_xscale > 0)
{
	instance_destroy();
}
draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, image_angle, image_blend, image_alpha);

if (draw_xscale >= 0.8)
{
	if (place_meeting(x, y, obj_wall))
	{
		if (image_xscale == -1)
		{
			die_volting = -1;
			instance_create_depth(bbox_left, y, 0, obj_block_break);
		}
		else
		{
			die_volting = +1;
			instance_create_depth(bbox_right, y, 0, obj_block_break);
		}
	}
}

if (image_xscale == -1)
&& (x < camera_get_view_x(view_camera[view_current]))
|| (image_xscale = +1)
&& (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
{
	instance_destroy();
}