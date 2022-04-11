scr_set_screen_size();

/*Draw Event*/
if(gamepad_button_check_pressed(0, gp_face1))
or(keyboard_check_pressed(ord("Z")))
or(keyboard_check_pressed(vk_enter))
or(keyboard_check_pressed(vk_space))
or(keyboard_check_pressed(vk_escape))
or(window_has_focus())
and (mouse_check_button_pressed(mb_left))
{
	if (can_navigate = true)
	{
		if (asset_get_type("room_title") == asset_room)
		{
			room_goto(room_title);
		}
		else
		if (room_next(room) <>- 1)
		{
			room_goto_next();
		}
	}
}

draw_set_halign(fa_center);
draw_set_valign(fa_center);

/*Sprite*/
draw_sprite_ext(sprite_index, image_index, window_get_width() / 2, window_get_height() / 2, 1, 1, 0, c_white, 1);

if (global.resource_pack_sprite_splash_easteregg >= 0)
{
	draw_sprite_ext(global.resource_pack_sprite_splash_easteregg, image_index, + 128, window_get_height() + sprite_splash_easteregg_yoffset, 1, 1, 0, c_white, 1);
}

if (can_navigate = false)
{
	loading_spinning_angle -= 10;
	draw_sprite_ext(spr_loading, 0, display_get_gui_width()/ 2, display_get_gui_height() - 80, 1, 1, loading_spinning_angle, c_white, 1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_outlined(display_get_gui_width()/ 2, display_get_gui_height() -32, Text("Loading"), global.default_text_size, c_white, c_black, 1);
}
else
{
	if (os_type = os_ios)
	or (os_type = os_android)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_outlined(display_get_gui_width()/ 2, display_get_gui_height() -32, Text("Press and Hold Screen"), global.default_text_size, c_white, c_black, 1);
	}
	else
	if (gamepad_is_connected(0))
	and (asset_get_type("spr_xbox_buttons") == asset_sprite)
	and (global.controls_used_for_menu_navigation = "controller")
	{
		draw_set_halign(fa_right);
		draw_set_valign(fa_center);
		draw_text_outlined(display_get_gui_width()/ 2 + 32, display_get_gui_height() -32, Text("Skip") + ":", global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_xbox_buttons, 0, display_get_gui_width()/ 2 + 64, display_get_gui_height() -32, 0.5, 0.5, 0, c_white, 1);
	}
	else
	if (asset_get_type("spr_keyboard_keys") == asset_sprite)
	{
		draw_set_halign(fa_right);
		draw_set_valign(fa_center);
		draw_text_outlined(display_get_gui_width()/ 2 + 32, display_get_gui_height() -32, Text("Skip") + ":", global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_keyboard_keys, vk_enter, display_get_gui_width()/ 2 + 64, display_get_gui_height() -32, 0.5, 0.5, 0, c_white, 1);
	}
}

if (gamepad_button_check_pressed(0, gp_face4))
or(keyboard_check_pressed(ord("Y")))
and (sprite_splash_easteregg_yoffset = 128)
{
	sprite_splash_easteregg_yoffset = +127;
	audio_play_sound(audio_splash_easteregg, 0, false);
	audio_sound_gain(audio_splash_easteregg, global.voices_volume * global.main_volume, 0);
	
}

if (sprite_splash_easteregg_yoffset <= 127)
{
	sprite_splash_easteregg_yoffset = lerp(sprite_splash_easteregg_yoffset, - 128, 0.1);
}

if (image_index > image_number - 2)
and (sprite_index = spr_company_logo)
{
	if (!gamepad_is_connected(0))
	and (!gamepad_is_connected(1))
	and (!gamepad_is_connected(2))
	and (!gamepad_is_connected(3))
	{
		if (global.resource_pack_sprite_splash_controller >= 0)
		{
			sprite_index = global.resource_pack_sprite_splash_controller;
		}
		else
		{
			if (asset_get_type("room_title") == asset_room)
			and (can_navigate = true)
			{
				room_goto(room_title);
			}
			else
			if (room_next(room) <>- 1)
			and (can_navigate = true)
			{
				room_goto_next();
			}
		}
	}
	else
	{
		if (asset_get_type("room_title") == asset_room)
		{
			room_goto(room_title);
		}
		else
		if (room_next(room) <>- 1)
		{
			room_goto_next();
		}
	}
	image_index = image_number - 2;
}

if (global.resource_pack_sprite_splash_controller > noone)
and (sprite_index = global.resource_pack_sprite_splash_controller)
{
	if (!audio_is_playing(controller_splash))
	{
		time += 1;
	}
	if (time > 100)
	and (!audio_is_playing(controller_splash))
	and (can_navigate = true)
	{
		if (asset_get_type("room_title") == asset_room)
		{
			room_goto(room_title);
		}
		else
		if (room_next(room) <>- 1)
		{
			room_goto_next();
		}
	}
}

if (image_index = 20)
and (company_splash > noone)
and (!audio_is_playing(company_splash))
{
	audio_play_sound(company_splash, 0, 0);
	audio_sound_gain(company_splash, global.voices_volume * global.main_volume, 0);
}

if (time = 10)
and (controller_splash > noone)
and (!audio_is_playing(controller_splash))
{
	audio_play_sound(controller_splash, 0, 0);
	audio_sound_gain(controller_splash, global.voices_volume * global.main_volume, 0);
}

#region /*Fullscreen Toggle if camera object doesn't exist. Default: F11*/
if (asset_get_type("obj_camera") == asset_object)
and (!instance_exists(obj_camera))
and (keyboard_check_pressed(global.fullscreen_key))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
	ini_open("config.ini");
	ini_write_real("config", "fullscreen_mode", window_get_fullscreen());
	ini_close();
}
#endregion /*Fullscreen Toggle if camera object doesn't exist. Default: F11 END*/

#region /*If Window is unfocused, make the screen darker*/
if (!window_has_focus())
{
	draw_set_alpha(0.5);
	draw_rectangle_color(camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]), room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
#endregion /*If Window is unfocused, make the screen darker END*/

#region /*Set what controls are used to navigate the menus*/

#region /*Get distance from fake mouse to real mouse*/
var mouse_moving = point_distance(mouse_x_position, mouse_y_position, window_mouse_get_x(), window_mouse_get_y());
#endregion /*Get distance from fake mouse to real mouse END*/

#region /*update positions of fake mouse*/
mouse_x_position = window_mouse_get_x();
mouse_y_position = window_mouse_get_y();
#endregion /*update positions of fake mouse*/

if (keyboard_check(vk_anykey))
{
	global.controls_used_for_menu_navigation = "keyboard";
}
else
if (mouse_check_button(mb_any))
or(mouse_wheel_down())
or(mouse_wheel_up())
or(mouse_moving)
{
	global.controls_used_for_menu_navigation = "mouse";
}
else
if (gamepad_button_check(0, gp_face1))
or(gamepad_button_check(0, gp_face2))
or(gamepad_button_check(0, gp_face3))
or(gamepad_button_check(0, gp_face4))
or(gamepad_button_check(0, gp_padd))
or(gamepad_button_check(0, gp_padl))
or(gamepad_button_check(0, gp_padr))
or(gamepad_button_check(0, gp_padu))
or(gamepad_button_check(0, gp_select))
or(gamepad_button_check(0, gp_shoulderl))
or(gamepad_button_check(0, gp_shoulderlb))
or(gamepad_button_check(0, gp_shoulderr))
or(gamepad_button_check(0, gp_shoulderrb))
or(gamepad_button_check(0, gp_start))
or(gamepad_button_check(0, gp_stickl))
or(gamepad_button_check(0, gp_stickr))
or(gamepad_axis_value(0, gp_axislh) <> 0)
or(gamepad_axis_value(0, gp_axislv) <> 0)
or(gamepad_axis_value(0, gp_axisrh) <> 0)
or(gamepad_axis_value(0, gp_axisrv) <> 0)
{
	global.controls_used_for_menu_navigation = "controller";
}
#endregion /*Set what controls are used to navigate the menus END*/

#region /*Draw mouse cursor for menu navigation*/
if (global.controls_used_for_menu_navigation = "mouse")
and (os_type!= os_android)
and (os_type!= os_ios)
{
	draw_sprite_ext(spr_cursor, 0, window_mouse_get_x(), window_mouse_get_y(), 1, 1, 0, c_white, 1);
}
#endregion /*Draw mouse cursor for menu navigation END*/
