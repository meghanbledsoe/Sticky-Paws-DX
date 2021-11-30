function scr_update_all_backgrounds()
{
	#region /*Update All Backgrounds*/
			
	sprite_delete(global.custom_background1);
	sprite_delete(global.custom_background2);
	sprite_delete(global.custom_background3);
	sprite_delete(global.custom_background4);
	sprite_delete(global.custom_foreground1);
	sprite_delete(global.custom_foreground2);
	
	#region /*Load Main Game Levels*/
	if (global.character_select_in_this_menu = "main_game")
	{
			
	#region /*Update Background1*/
	/*BMP small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background1.bmp")){global.custom_background1=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background1.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background1.bmp")){global.custom_background1=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background1.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background1.png")){global.custom_background1=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background1.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background1.png")){global.custom_background1=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background1.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background1.gif")){global.custom_background1=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background1.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background1.gif")){global.custom_background1=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background1.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background1.jpg")){global.custom_background1=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background1.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background1.jpg")){global.custom_background1=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background1.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background1=noone;
	}
	#endregion /*Update Background1 END*/
			
	#region /*Update Background2*/
	/*BMP small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background2.bmp")){global.custom_background2=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background2.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background2.bmp")){global.custom_background2=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background2.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background2.png")){global.custom_background2=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background2.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background2.png")){global.custom_background2=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background2.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background2.gif")){global.custom_background2=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background2.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background2.gif")){global.custom_background2=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background2.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background2.jpg")){global.custom_background2=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background2.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background2.jpg")){global.custom_background2=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background2.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background2=noone;
	}
	#endregion /*Update Background2 END*/
			
	#region /*Update Background3*/
	/*BMP small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background3.bmp")){global.custom_background3=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background3.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background3.bmp")){global.custom_background3=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background3.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background3.png")){global.custom_background3=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background3.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background3.png")){global.custom_background3=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background3.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background3.gif")){global.custom_background3=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background3.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background3.gif")){global.custom_background3=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background3.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background3.jpg")){global.custom_background3=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background3.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background3.jpg")){global.custom_background3=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background3.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background3=noone;
	}
	#endregion /*Update Background3 END*/
			
	#region /*Update Background4*/
	/*BMP small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background4.bmp")){global.custom_background4=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background4.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background4.bmp")){global.custom_background4=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background4.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background4.png")){global.custom_background4=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background4.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background4.png")){global.custom_background4=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background4.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background4.gif")){global.custom_background4=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background4.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background4.gif")){global.custom_background4=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background4.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background4.jpg")){global.custom_background4=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/background4.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background4.jpg")){global.custom_background4=sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Background4.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background4=noone;
	}
	#endregion /*Update Background4 END*/
			
	#region /*Update Foreground1*/
			
	#region /*BMP small letter File*/
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground1.bmp"))
	{
		global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground1.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP small letter File END*/
			
	#region /*BMP big letter File*/
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground1.bmp"))
	{
		global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground1.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP big letter File END*/
			
	#region /*PNG small letter File*/
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground1.png"))
	{
		global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground1.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG small letter File END*/
			
	#region /*PNG big letter File*/
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground1.png"))
	{
		global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground1.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG big letter File END*/
			
	#region /*GIF small letter File*/
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground1.gif"))
	{
		global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground1.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF small letter File END*/
			
	#region /*GIF big letter File*/
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground1.gif"))
	{
		global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground1.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF big letter File END*/
			
	#region /*JPG small letter File*/
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground1.jpg"))
	{
		global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground1.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG small letter File END*/
			
	#region /*JPG big letter File*/
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground1.jpg"))
	{
		global.custom_foreground1 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground1.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG big letter File END*/
			
	{
		global.custom_foreground1 = noone;
	}
			
	#endregion /*Update Foreround1 END*/
			
	#region /*Update Foreground2*/
			
	#region /*BMP small letter File*/
	if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground2.bmp")
	{
		global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground2.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP small letter File END*/
			
	#region /*BMP big letter File*/
	if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground2.bmp")
	{
		global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground2.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP big letter File END*/
			
	#region /*PNG small letter File*/
	if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground2.png")
	{
		global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground2.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG small letter File END*/
			
	#region /*PNG big letter File*/
	if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground2.png")
	{
		global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground2.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG big letter File END*/
			
	#region /*GIF small letter File*/
	if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground2.gif")
	{
		global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground2.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF small letter File END*/
			
	#region /*GIF big letter File*/
	if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground2.gif")
	{
		global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground2.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF big letter File END*/
			
	#region /*JPG small letter File*/
	if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground2.jpg")
	{
		global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/foreground2.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG small letter File END*/
			
	#region /*JPG big letter File*/
	if file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground2.jpg")
	{
		global.custom_foreground2 = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/backgrounds/Foreground2.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG big letter File END*/
			
	{
		global.custom_foreground2 = noone;
	}
			
	#endregion /*Update Foreround2 END*/
			
	}
	
	#endregion /*Load Main Game Levels END*/
	
	else
	
	#region /*Load Custom Levels*/
	
	if (global.character_select_in_this_menu = "level_editor")
	{
	
	#region /*Update Background1*/
	/*BMP small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background1.bmp")){global.custom_background1=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background1.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background1.bmp")){global.custom_background1=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background1.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background1.png")){global.custom_background1=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background1.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background1.png")){global.custom_background1=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background1.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background1.gif")){global.custom_background1=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background1.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background1.gif")){global.custom_background1=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background1.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background1.jpg")){global.custom_background1=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background1.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background1.jpg")){global.custom_background1=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background1.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background1=noone;
	}
	#endregion /*Update Background1 END*/
	
	#region /*Update Background2*/
	/*BMP small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background2.bmp")){global.custom_background2=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background2.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background2.bmp")){global.custom_background2=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background2.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background2.png")){global.custom_background2=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background2.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background2.png")){global.custom_background2=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background2.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background2.gif")){global.custom_background2=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background2.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background2.gif")){global.custom_background2=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background2.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background2.jpg")){global.custom_background2=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background2.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background2.jpg")){global.custom_background2=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background2.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background2=noone;
	}
	#endregion /*Update Background2 END*/
	
	#region /*Update Background3*/
	/*BMP small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background3.bmp")){global.custom_background3=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background3.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background3.bmp")){global.custom_background3=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background3.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background3.png")){global.custom_background3=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background3.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background3.png")){global.custom_background3=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background3.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background3.gif")){global.custom_background3=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background3.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background3.gif")){global.custom_background3=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background3.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background3.jpg")){global.custom_background3=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background3.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background3.jpg")){global.custom_background3=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background3.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background3=noone;
	}
	#endregion /*Update Background3 END*/
	
	#region /*Update Background4*/
	/*BMP small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background4.bmp")){global.custom_background4=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background4.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background4.bmp")){global.custom_background4=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background4.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background4.png")){global.custom_background4=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background4.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background4.png")){global.custom_background4=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background4.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background4.gif")){global.custom_background4=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background4.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background4.gif")){global.custom_background4=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background4.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background4.jpg")){global.custom_background4=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/background4.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background4.jpg")){global.custom_background4=sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Background4.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background4=noone;
	}
	#endregion /*Update Background4 END*/
	
	#region /*Update Foreground1*/
	
	#region /*BMP small letter File*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground1.bmp"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground1.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP small letter File END*/
	
	#region /*BMP big letter File*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground1.bmp"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground1.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP big letter File END*/
	
	#region /*PNG small letter File*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground1.png"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground1.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG small letter File END*/
	
	#region /*PNG big letter File*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground1.png"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground1.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG big letter File END*/
	
	#region /*GIF small letter File*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground1.gif"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground1.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF small letter File END*/
	
	#region /*GIF big letter File*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground1.gif"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground1.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF big letter File END*/
	
	#region /*JPG small letter File*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground1.jpg"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground1.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG small letter File END*/
	
	#region /*JPG big letter File*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground1.jpg"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground1.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG big letter File END*/
			
	{
		global.custom_foreground1 = noone;
	}
	
	#endregion /*Update Foreround1 END*/
	
	#region /*Update Foreground2*/
	
	#region /*BMP small letter File*/
	if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground2.bmp")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground2.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP small letter File END*/
	
	#region /*BMP big letter File*/
	if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground2.bmp")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground2.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP big letter File END*/
	
	#region /*PNG small letter File*/
	if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground2.png")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground2.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG small letter File END*/
	
	#region /*PNG big letter File*/
	if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground2.png")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground2.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG big letter File END*/
	
	#region /*GIF small letter File*/
	if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground2.gif")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground2.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF small letter File END*/
	
	#region /*GIF big letter File*/
	if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground2.gif")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground2.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF big letter File END*/
	
	#region /*JPG small letter File*/
	if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground2.jpg")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/foreground2.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG small letter File END*/
	
	#region /*JPG big letter File*/
	if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground2.jpg")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/backgrounds/Foreground2.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG big letter File END*/
	
	{
		global.custom_foreground2 = noone;
	}
	
	#endregion /*Update Foreround2 END*/
	
	}
	#endregion /*Load Custom Levels END*/
	
	#endregion /*Update All Backgrounds END*/
	
	#region /*Level Tileset File*/
	sprite_delete(global.custom_tileset);
		
	if (global.character_select_in_this_menu = "main_game")
	and(file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/tilesets/ground_tileset.png"))
	{
		global.custom_tileset = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/tilesets/ground_tileset.png",0,false,false,0,0);
	}
	else
	if (global.character_select_in_this_menu = "level_editor")
	and(file_exists(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/tilesets/ground_tileset.png"))
	{
		global.custom_tileset = sprite_add(working_directory+"/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/tilesets/ground_tileset.png",0,false,false,0,0);
	}
	else
	{
		global.custom_tileset = noone;
	}
	#endregion /*Level Tileset File END*/
	
}