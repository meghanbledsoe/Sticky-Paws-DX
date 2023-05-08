function scr_load_all_character_portraits()
{
	
	#region /* If any "character index" is set to undefined, reset it to 0 */
	if (ds_list_find_value(global.all_loaded_characters, global.character_index[0]) == undefined)
	{
		global.character_index[0] = 0;
	}
	if (ds_list_find_value(global.all_loaded_characters, global.character_index[1]) == undefined)
	{
		global.character_index[1] = 0;
	}
	if (ds_list_find_value(global.all_loaded_characters, global.character_index[2]) == undefined)
	{
		global.character_index[2] = 0;
	}
	if (ds_list_find_value(global.all_loaded_characters, global.character_index[3]) == undefined)
	{
		global.character_index[3] = 0;
	}
	#endregion /* If any "character index" is set to undefined, reset it to 0 END */
	
	#region /* Player 1 character select portrait sprite */
	global.sprite_select_player_1 = spr_noone;
	global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
	global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
	global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
	global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
	#endregion /* Player 1 character select portrait sprite END */
	
	#region /* Player 2 character select portrait sprite */
	global.sprite_select_player_2 = spr_noone;
	global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_2, 1, global.skin_for_player_2);
	global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_2, 1, global.skin_for_player_2);
	global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_2, 1, global.skin_for_player_2);
	global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_2, 1, global.skin_for_player_2);
	#endregion /* Player 2 character select portrait sprite END */
	
	#region /* Player 3 character select portrait sprite */
	global.sprite_select_player_3 = spr_noone;
	global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_3, 2, global.skin_for_player_3);
	global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_3, 2, global.skin_for_player_3);
	global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_3, 2, global.skin_for_player_3);
	global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_3, 2, global.skin_for_player_3);
	#endregion /* Player 3 character select portrait sprite END */
	
	#region /* Player 4 character select portrait sprite */
	global.sprite_select_player_4 = spr_noone;
	global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_4, 3, global.skin_for_player_4);
	global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_4, 3, global.skin_for_player_4);
	global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_4, 3, global.skin_for_player_4);
	global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_4, 3, global.skin_for_player_4);
	#endregion /* Player 4 character select portrait sprite END */
	
}