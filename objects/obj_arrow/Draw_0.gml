/*Step Event*/
depth = -bbox_bottom;
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
	/*Sets the gravity*/
	gravity_direction = 270; /*Direction of the gravity*/
	gravity = 0.5; /*The gravity*/
}
else
{
	/*Sets the gravity*/
	gravity_direction = 270; /*Direction of the gravity*/
	if asset_get_type("obj_wall") == asset_object
	{
		if (!place_meeting(x, y + 1, obj_wall))
		{
			gravity = 0; /*The gravity*/
		}
	}
	else
	{
		gravity = 0;
	}
	if flat = true
	{
		/*image_yscale=lerp(image_yscale,0.1,0.2);*/
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
	hspeed = -8;
}
else
{
	hspeed = +8;
}
if x < camera_get_view_x(view_camera[view_current]) + sprite_width and image_xscale < 0 or x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + sprite_width and image_xscale > 0
{
	instance_destroy();
}
draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, image_angle, image_blend, image_alpha);

if draw_xscale >= 0.8
{
	if place_meeting(x, y, obj_wall)
	{
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

if image_xscale = -1 and x < camera_get_view_x(view_camera[view_current]) or image_xscale = +1 and x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])
{
	instance_destroy();
}