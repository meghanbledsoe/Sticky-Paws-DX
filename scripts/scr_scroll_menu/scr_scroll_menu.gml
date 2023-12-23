function scr_scroll_menu(offset_display_height = 300)
{
	
	#region /* Scroll menu */
	menu_y_offset = lerp(menu_y_offset, menu_y_offset_real, 0.25);
	menu_y_offset_real = clamp(menu_y_offset_real, -menu_cursor_y_position, 0); /* Dont let "meny y offset" get above 0 */
	
	if (!scrolling_menu_with_mousewheel) /* When not using mousewheel, scroll the menu when using keyboard or gamepad */
	{
		if (abs(menu_y_offset_real) + display_get_gui_height() - offset_display_height < menu_cursor_y_position)
		{
			menu_y_offset_real -= 10;
		}
		if (abs(menu_y_offset_real) + 300 > menu_cursor_y_position)
		{
			menu_y_offset_real += 10;
		}
		if (abs(menu_y_offset_real) + display_get_gui_height() + offset_display_height < menu_cursor_y_position)
		{
			menu_y_offset_real -= 100;
		}
		if (abs(menu_y_offset_real) - 300 > menu_cursor_y_position)
		{
			menu_y_offset_real += 100;
		}
	}
	#endregion /* Scroll menu END */
	
	#region /* Use Mousewheel to scroll menu */
	if (mouse_wheel_up())
	{
		menu_cursor_y_position += 100;
		menu_y_offset_real += 100;
		scrolling_menu_with_mousewheel = true;
	}
	else
	if (mouse_wheel_down())
	{
		menu_cursor_y_position -= 100;
		menu_y_offset_real -= 100;
		scrolling_menu_with_mousewheel = true;
	}
	else
	if (key_up)
	|| (key_down)
	{
		scrolling_menu_with_mousewheel = false;
	}
	#endregion /* Use Mousewheel to scroll menu END */
	
}