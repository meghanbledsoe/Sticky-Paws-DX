#region /*Don't move outside view*/
if (x - 42 > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
and (instance_exists(obj_camera))
and (x - 42 > obj_camera.view_x_center + 1000)
or (x + 42 < camera_get_view_x(view_camera[view_current]))
and (instance_exists(obj_camera))
and (x - 42 < obj_camera.view_x_center - 1000)
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