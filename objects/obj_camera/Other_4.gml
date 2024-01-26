#region /* When changing file, you should restart the room so the right save data can load */
if (current_file != global.file)
|| (!file_exists(working_directory + "save_file/file" + string(global.file) + ".ini"))
{
	current_file = global.file;
	room_persistent = false; /* Turn OFF Room Persistency */
	global.quit_level = true;
	global.quit_to_map = true;
}
#endregion /* When changing file, you should restart the room so the right save data can load END */

if (sprite_lives_icon != spr_1up)
{
	scr_delete_sprite_properly(sprite_lives_icon);
}
sprite_lives_icon = spr_1up;
sprite_lives_icon = scr_initialize_custom_character_select_sprite("lives_icon", sprite_lives_icon, camera_player, camera_selected_skin);