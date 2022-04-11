if (can_navigate = false)
{
	file_load_timer += 1;
	
	#region /*Load Characters*/
	if (file_load_timer > 1)
	and (load_ok = 0)
	{
		if (initialized_characters = false)
		{
			scr_load_character_initializing();
			initialized_characters = true;
		}
		file_found = file_find_next()
		if (file_found == "")
		{
			file_find_close();
			scr_load_all_character_portraits();
			
			#region /*Narrator Voice variable handeling*/
			
			#region /*No Narrator*/
			if (global.narrator = -1)
			{
				company_splash = noone;
				controller_splash = noone;
			}
			#endregion /*No Narrator END*/
			
			else
			
			#region /*Character as Narrator*/
			if (global.narrator >= 0)
			{
				if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash.ogg"))
				{
					company_splash = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash.ogg");
				}
				else
				if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash.ogg"))
				{
					company_splash = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/company_splash.ogg");
				}
				else
				{
					company_splash = noone;
				}
				if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/controller_splash.ogg"))
				{
					controller_splash = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/controller_splash.ogg");
				}
				else
				if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/controller_splash.ogg"))
				{
					controller_splash = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/controller_splash.ogg");
				}
				else
				{
					controller_splash = noone;
				}
			}
			#endregion /*Character as Narrator END*/
			
			#endregion /*Narrator Voice variable handeling END*/
			
			load_ok = 1;
		}
		else
		{
			file_exists(working_directory + "custom_characters/" + file_found + "/data/character_config.ini")
			ds_list_add(global.all_loaded_characters, file_found)
			
			file_load_timer = 0; /* 1 not 0. So it doesn't do the file_find_first code which it does at 0*/
		}
	}
	#endregion /*Load Characters END*/
	
	else
	
	#region /*Load Resource Packs*/
	if (file_load_timer > 1)
	and (load_ok = 1)
	{
		if (initialized_resource_pack = false)
		{
			scr_load_resource_pack_initializing();
			initialized_resource_pack = true;
		}
		file_found = file_find_next()
		if (file_found == "")
		{
			file_find_close();
			
			if (directory_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound"))
			or(directory_exists(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound"))
			{
				#region /*Sound Add*/
				if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/splash_easteregg.ogg"))
				{
					audio_splash_easteregg = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/splash_easteregg.ogg");
				}
				else
				if (file_exists(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/splash_easteregg.ogg"))
				{
					audio_splash_easteregg = audio_create_stream(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/splash_easteregg.ogg");
				}
				#endregion /*Sound Add END*/
			}
			scr_load_resource_pack_sprite();
			load_ok = 2;
		}
		else
		{
			if (file_exists(working_directory + "custom_resource_pack/" + file_found + "data/sprite_origin_point.ini"))
			{
				ds_list_add(global.all_loaded_resource_pack, file_found)
			}
			
			file_load_timer = 0; /* 1 not 0. So it doesn't do the file_find_first code which it does at 0*/
		}
	}
	#endregion /*Load Resource Packs END*/
	
	else
	
	#region /*Load Title Backgrounds*/
	if (file_load_timer > 1)
	and (load_ok = 2)
	{
		if (initialized_title_backgrounds = false)
		{
			scr_load_title_background_initializing();
			initialized_title_backgrounds = true;
		}
		file_found = file_find_next()
		if (file_found == "")
		{
			file_find_close();
			load_ok = 3;
		}
		else
		{
			if (file_exists(working_directory + "custom_title_backgrounds/" + file_found))
			{
				ds_list_add(global.all_loaded_title_backgrounds, file_found)
			}
			
			file_load_timer = 0; /* 1 not 0. So it doesn't do the file_find_first code which it does at 0*/
		}
	}
	#endregion /*Load Title Background END*/
	
	else
	
	#region /*Load Title Logo*/
	if (file_load_timer > 1)
	and (load_ok = 3)
	{
		if (initialized_title_logos = false)
		{
			scr_load_title_logo_initializing();
			initialized_title_logos = true;
		}
		file_found = file_find_next()
		if (file_found == "")
		{
			file_find_close();
			if (file_exists("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
			{
				global.title_logo_index = sprite_add("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
				sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) / 2, sprite_get_height(global.title_logo_index) / 2);
			}
			else
			if (file_exists(working_directory + "/custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
			{
				global.title_logo_index = sprite_add(working_directory + "/custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
				sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) / 2, sprite_get_height(global.title_logo_index) / 2);
			}
			else
			{
				global.title_logo_index = spr_noone;
			}
			load_ok = 4;
		}
		else
		{
			if (file_exists(working_directory + "custom_title_logos/" + file_found))
			{
				ds_list_add(global.all_loaded_title_logos, file_found)
			}
			
			file_load_timer = 0; /* 1 not 0. So it doesn't do the file_find_first code which it does at 0*/
		}
	}
	#endregion /*Load Title Logo END*/
	
}

if (load_ok >= 4)
{
	can_navigate = true;
}