function scr_load_object_placement_old()
{
	
	#region /* Old level loading method */
	
	#region /* Load Main Game Level */
	if (global.character_select_in_this_menu == "main_game")
	or (global.create_level_from_template == true)
	{
		
		#region /* Object Placement */
		var file, str, str_pos, str_temp, val, num;
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_placement.txt"))
		{
			file = file_text_open_read("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_placement.txt");
		}
		else
		{
			file = -1;
		}
	
		if (file != -1)
		{
			/* Next objects */
			str = file_text_read_string(file);
			//file_text_readln(file);
			str_temp = "";
			num = 0;
			str_pos = 1;
			while(str_pos < string_length(str))
			{
				/* | = chr("124") */
				/* } = chr("125") */
				while (string_char_at(str, str_pos) != "|")
				{
					str_temp += string_char_at(str, str_pos);
					str_pos += 1;
				}
				val[num] = string(str_temp);
				str_temp = "";
				str_pos += 1;
				num += 1;
				if (num == 6)
				/* Number of variables to check for.
				val[0] = object,
				val[1] = x position,
				val[2] = y position,
				val[3] = easy,
				val[4] = normal,
				val[5] = hard */
				{
					num = 0;
					with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
					{
						object = val[2];
						easy = val[3];
						normal = val[4];
						hard = val[5];
						placed_for_the_first_time = false;
					}
				}
			}
			file_text_close(file);
		}
		#endregion /* Object Placement END */
	
		#region /* Object With Rotation Placement */
		var file, str, str_pos, str_temp, val, num;
		if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_rotation_placement.txt"))
		{
			file = file_text_open_read("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_rotation_placement.txt");
		}
		else
		{
			file = -1;
		}
	
		if (file != -1)
		{
			/* Next objects */
			str = file_text_read_string(file);
			//file_text_readln(file);
			str_temp = "";
			num = 0;
			str_pos = 1;
			while(str_pos < string_length(str))
			{
				/* | = chr("124") */
				/* } = chr("125") */
				while (string_char_at(str, str_pos) != "|")
				{
					str_temp += string_char_at(str, str_pos);
					str_pos += 1;
				}
				val[num] = string(str_temp);
				str_temp = "";
				str_pos += 1;
				num += 1;
				if (num == 8) /* Number of variables to check for.
				val[0] = object,
				val[1] = x position,
				val[2] = y position,
				val[3] = easy,
				val[4] = normal,
				val[5] = hard,
				val[6] = second_x,
				val[7] = second_y */
				{
					num = 0;
					with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
					{
						object = val[2];
						easy = val[3];
						normal = val[4];
						hard = val[5];
						second_x = val[6];
						second_y = val[7];
						placed_for_the_first_time = false;
					}
				}
			}
			file_text_close(file);
		}
		#endregion /* Object With Rotation Placement END */
	
	}
	#endregion /* Load Main Game Level END */
	
	else
	
	#region /* Load Level Editor Level */
	if (global.character_select_in_this_menu == "level_editor")
	{
	
		#region /* Create directories */

		#region /* Create directory for saving custom levels */
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))))
		{
			directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)));
		}
		else
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name)))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name));
		}
		#endregion /* Create directory for saving custom levels END */
	
		#region /* Create directory for backgrouns in custom levels */
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds"))
		{
			directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds");
		}
		else
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds"))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds");
		}
		#endregion /* Create directory for backgrounds in custom levels END */
	
		#region /* Create directory for data in custom levels */
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data"))
		{
			directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data");
		}
		else
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data"))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/data");
		}
		#endregion /* Create directory for data in custom levels END */
	
		#region /* Create directory for sounds in custom levels */
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sound"))
		{
			directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sound");
		}
		else
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/sound"))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/sound");
		}
		#endregion /* Create directory for sounds in custom levels END */
	
		#region /* Create directory for tilesets in custom levels */
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/tilesets"))
		{
			directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/tilesets");
		}
		else
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets"))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets");
		}
		#endregion /* Create directory for tilesets in custom levels END */
	
		#endregion /* Create directories END */
	
			#region /* Object Placement */
			var file, str, str_pos, str_temp, val, num;
			if (global.select_level_index >= 1)
			and (global.create_level_from_template == false)
			and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/object_placement.txt"))
			{
				file = file_text_open_read(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/object_placement.txt");
			}
			else
			if (global.level_name != "")
			and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_placement.txt"))
			{
				file = file_text_open_read(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_placement.txt");
			}
			else
			{
				file = -1;
			}
	
			if (file != -1)
			{
				/* Next objects */
				str = file_text_read_string(file);
				//file_text_readln(file);
				str_temp = "";
				num = 0;
				str_pos = 1;
				while(str_pos < string_length(str))
				{
					/* | = chr("124") */
					/* } = chr("125") */
					while (string_char_at(str, str_pos) != "|")
					{
						str_temp += string_char_at(str, str_pos);
						str_pos += 1;
					}
					val[num] = string(str_temp);
					str_temp = "";
					str_pos += 1;
					num += 1;
					if (num == 6)
					/* Number of variables to check for.
					val[0] = object,
					val[1] = x position,
					val[2] = y position,
					val[3] = easy,
					val[4] = normal,
					val[5] = hard */
					{
						num = 0;
						with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
						{
							object = val[2];
							easy = val[3];
							normal = val[4];
							hard = val[5];
							placed_for_the_first_time = false;
						}
					}
				}
				file_text_close(file);
			}
			#endregion /* Object Placement END */
		
			#region /* Object With Rotation Placement */
			var file, str, str_pos, str_temp, val, num;
			if (global.select_level_index >= 1)
			and (global.create_level_from_template == false)
			and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/object_rotation_placement.txt"))
			{
				file = file_text_open_read(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/object_rotation_placement.txt");
			}
			else
			if (global.level_name != "")
			and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_rotation_placement.txt"))
			{
				file = file_text_open_read(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_rotation_placement.txt");
			}
			else
			{
				file = -1;
			}
	
			if (file != -1)
			{
				/* Next objects */
				str = file_text_read_string(file);
				//file_text_readln(file);
				str_temp = "";
				num = 0;
				str_pos = 1;
				while(str_pos < string_length(str))
				{
					/* | = chr("124") */
					/* } = chr("125") */
					while (string_char_at(str, str_pos) != "|")
					{
						str_temp += string_char_at(str, str_pos);
						str_pos += 1;
					}
					val[num] = string(str_temp);
					str_temp = "";
					str_pos += 1;
					num += 1;
					if (num == 8) /* Number of variables to check for.
					val[0] = object,
					val[1] = x position,
					val[2] = y position,
					val[3] = easy,
					val[4] = normal,
					val[5] = hard,
					val[6] = second_x,
					val[7] = second_y */
					{
						num = 0;
						with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
						{
							object = val[2];
							easy = val[3];
							normal = val[4];
							hard = val[5];
							second_x = val[6];
							second_y = val[7];
							placed_for_the_first_time = false;
						}
					}
				}
				file_text_close(file);
			}
			#endregion /* Object With Rotation Placement END */
		
	}
	#endregion /* Load Level Editor Level END */
	
	#endregion /* Old level loading method END */
	
}