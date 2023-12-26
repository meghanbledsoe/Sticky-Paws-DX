function scr_draw_level_editor_placable_object(var_selected_object, var_place_object_id, var_can_make_place_brush_size_bigger, var_sprite_index, var_mask_index, var_scroll_x, var_scale, var_rotation, var_color, var_scroll_y = 0, var_x_offset = 0, alpha_offset = 1, add_order_index = 1, object_name = "", object_description = "", var_image_index = 0)
{
	var y_offset = 128;
	if (unlocked_object[var_place_object_id] >= true)
	{
		if (selected_object == var_selected_object)
		{
			place_object = var_place_object_id; /* The Object ID, as example this enum: LEVEL_OBJECT_ID.id_wall */
			can_make_place_brush_size_bigger = var_can_make_place_brush_size_bigger;
			sprite_index = var_sprite_index; /* This changes the obj_leveleditor sprite, so you see it underneath the cursor */
			image_index = var_image_index; /* This changes the obj_leveleditor image index, so you see objects that use image index */
			mask_index = var_mask_index; /* This changes the obj_leveleditor mask. Object mask when placing it, so it doesn't get placed over other objects */
			
			var var_scale_modify = 1.25;
			current_object_name = object_name;
			object_help_description = object_description;
		}
		else
		{
			var var_scale_modify = 1;
		}
		
		#region /* Hover mouse over object icon and click to select */
		var hover_offset = 49;
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
		(display_get_gui_width() * 0.5) + selected_object_menu_x + var_scroll_x * var_selected_object - hover_offset,
		y_offset - hover_offset,
		(display_get_gui_width() * 0.5) + selected_object_menu_x + var_scroll_x * var_selected_object + hover_offset,
		y_offset + hover_offset))
		{
			draw_set_alpha(selected_menu_alpha * scr_wave(0.25, 0.5, 1));
			draw_roundrect_color_ext(
			(display_get_gui_width() * 0.5) + selected_object_menu_x + var_scroll_x * var_selected_object - hover_offset - scr_wave(0, 3, 2),
			y_offset - hover_offset - scr_wave(0, 3, 2),
			(display_get_gui_width() * 0.5) + selected_object_menu_x + var_scroll_x * var_selected_object + hover_offset + scr_wave(0, 3, 2),
			y_offset + hover_offset + scr_wave(0, 3, 2),
			50, 50, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_pressed(mb_left))
			{
				selected_object = var_selected_object;
				selected_object_menu_actual_x = var_selected_object * -100;
			}
		}
		#endregion /* Hover mouse over object icon and click to select END */
		
		draw_sprite_ext(var_sprite_index, var_image_index, (display_get_gui_width() * 0.5) + selected_object_menu_x + var_scroll_x * var_selected_object + var_x_offset, y_offset + var_scroll_y, var_scale * var_scale_modify, var_scale * var_scale_modify, var_rotation, var_color, selected_menu_alpha * alpha_offset);
		if (unlocked_object[var_place_object_id] == 1)
		&& (global.show_new_items_notification)
		{
			scr_draw_text_outlined((display_get_gui_width() * 0.5) + selected_object_menu_x + var_scroll_x * var_selected_object, y_offset, l10n_text("New"), global.default_text_size + scr_wave(-0.1, 0, 1, 0), c_white, c_red, selected_menu_alpha * alpha_offset);
		}
		order_index += add_order_index; /* Add to this variable after each "scr draw level editor placable object" so whenever you add more objects to the list of placable objects, you don't have to change these numbers manually*/
	}
}