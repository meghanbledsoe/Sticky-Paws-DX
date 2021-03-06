#region /*When editing a level, make the foreground transparent*/
if (global.play_edited_level=false)
{
	image_alpha = 0.5;
}
else
{
	image_alpha = 1;
}
#endregion /*When editing a level, make the foreground transparent END*/

#region /*Destroy this object if it ever appears in the wrong room*/
if (asset_get_type("room_title") == asset_room)
and(room = room_title)
{
	instance_destroy();
}
#endregion /*Destroy this object if it ever appears in the wrong room END*/

x = 0;
y = 0;
draw_set_alpha(image_alpha);
if (global.enable_foreground_layer2 = true)
{
	visible = true;
}
else
{
	visible = false;
}
instance_activate_object(self);

#region /*Update Foreground2*/
if (global.custom_foreground2 > noone)
{
	draw_sprite(global.custom_foreground2, image_index, 0, 0);
}
#endregion /*Update Foreground2 END*/
draw_set_alpha(1);