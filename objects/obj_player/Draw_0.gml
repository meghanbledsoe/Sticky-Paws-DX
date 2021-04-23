/*________________________________Draw Event________________________________*/

/*Don't remove this, please, it's for debug*/
//draw_text_outlined(x,y-256,"Custom character: "+string(custom_character),global.default_text_size,c_white,c_black,1);
//draw_text_outlined(x,y-200,"What player am I: "+string(player),global.default_text_size,c_white,c_black,1);
//draw_text_outlined(x,y-128,"character for player 1: "+string(global.character_for_player_1),global.default_text_size,c_white,c_black,1);
//draw_text_outlined(x,y-64,"character for player 2: "+string(global.character_for_player_2),global.default_text_size,c_white,c_black,1);
//draw_text_outlined(x,y-64,"Overflow HP: "+string(overflow_hp)+"/"+string(max_overflow_hp),global.default_text_size,c_white,c_black,1);
//draw_text_outlined(x,y-64,string(global.character_select_in_this_menu),global.default_text_size,c_white,c_black,1);
//draw_text_outlined(x,y-64,string(global.music_volume),global.default_text_size,c_white,c_black,1);
//draw_text_outlined(x-32,y-64,"Crouch Toggle: "+string(global.player1_crouch_toggle),global.default_text_size,c_white,c_black,1);
//draw_text_outlined(x-32,y-128,"Sprint Toggle: "+string(global.player1_sprint_toggle),global.default_text_size,c_white,c_black,1);
//if(voice_jump_3rd_1>noone){draw_text_outlined(x,y-64,"True",global.default_text_size,c_white,c_black,1);}
//draw_text_outlined(x-32,y-128,"pause_hspeed: "+string(pause_hspeed),global.default_text_size,c_white,c_black,1);
//draw_text_outlined(x-32,y-96,"pause_vspeed: "+string(pause_vspeed),global.default_text_size,c_white,c_black,1);
//draw_text_outlined(x-128,y-128,"actually_play_edited_level: "+string(global.actually_play_edited_level),global.default_text_size,c_white,c_black,1);
//draw_text_outlined(x-128,y-96,"play_edited_level: "+string(global.play_edited_level),global.default_text_size,c_white,c_black,1);			

#region /*Heart above head*/
if (asset_get_type("spr_heart")==asset_sprite)
and(have_heart_balloon=true)
{
	if (asset_get_type("obj_horizontal_rope")==asset_object)
	and(place_meeting(x,y-1,obj_horizontal_rope))
	and(horizontal_rope_climb=true)
	and(key_up)
	and(!key_down)
	and(!place_meeting(x,y-16,obj_wall))
	and(!place_meeting(x,y-32,obj_wall))
	{
		xx_heart=lerp(xx_heart,x,0.1);
		yy_heart=lerp(yy_heart,y+32,0.1);
	}
	if (takendamage%2==0)
	{
		draw_line_width_colour(xx,yy,xx_heart,yy_heart,6,c_black,c_black);
		draw_line_width_colour(xx,yy,xx_heart,yy_heart,3,c_white,c_white);
		draw_sprite_ext(spr_heart,0,xx_heart,yy_heart,1,1,0,c_white,1);
	}
	else
	{
		draw_sprite_ext(spr_heart,0,xx_heart,yy_heart,1,1,0,c_white,0.3);
	}
}

if (have_heart_balloon=false)
and(asset_get_type("obj_heart_balloon")==asset_object)
and(instance_exists(obj_heart_balloon))
and(distance_to_object(obj_heart_balloon)<32)
{
	xx_heart=lerp(xx_heart,instance_nearest(x,y,obj_heart_balloon).x,1);
	yy_heart=lerp(yy_heart,instance_nearest(x,y,obj_heart_balloon).y,1);
}
else
{
	xx_heart=lerp(xx_heart,x,0.1);
	yy_heart=lerp(yy_heart,y-64,0.1);
}
#endregion /*Heart above head END*/

#region /*Draw arrow when player is outside top view*/
if (y<camera_get_view_y(view_camera[view_current]))
{
	draw_set_colour(c_black);
	draw_arrow(x,camera_get_view_y(view_camera[view_current])+16,x,camera_get_view_y(view_camera[view_current])-2,30);
	draw_set_colour(c_white);
	draw_arrow(x,camera_get_view_y(view_camera[view_current])+16,x,camera_get_view_y(view_camera[view_current]),20);
	draw_circle_colour(x,camera_get_view_y(view_camera[view_current])+32,24,c_black,c_black,true);
	draw_circle_colour(x,camera_get_view_y(view_camera[view_current])+32,22,c_white,c_white,true);
	
	if (assist_invincible=false)
	and(invincible>60)
	{
		if (invincible<240)
		{
			if (invincible%2==0)
			{
				draw_sprite_ext(sprite_index,image_index,x,camera_get_view_y(view_camera[view_current])+32,draw_xscale/2*sign(image_xscale),draw_yscale/2,angle,random(9999),image_alpha);
			}
			else
			{
				draw_sprite_ext(sprite_index,image_index,x,camera_get_view_y(view_camera[view_current])+32,draw_xscale/2*sign(image_xscale),draw_yscale/2,angle,image_blend,image_alpha);
			}
		}
		else
		{
			draw_sprite_ext(sprite_index,image_index,x,camera_get_view_y(view_camera[view_current])+32,draw_xscale/2*sign(image_xscale),draw_yscale/2,angle,random(9999),image_alpha);
		}
	}
	else
	{
		draw_sprite_ext(sprite_index,image_index,x,camera_get_view_y(view_camera[view_current])+32,draw_xscale/2*sign(image_xscale),draw_yscale/2,angle,image_blend,image_alpha);
	}
}
#endregion /*Draw arrow when player is outside top view END*/

#region /*Draw arrow when player is outside bottom view*/
if (y>camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
and(y<room_height)
{
	draw_set_colour(c_black);
	draw_arrow(x,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-16,x,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])+2,30);
	draw_set_colour(c_white);
	draw_arrow(x,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-16,x,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]),20);
	draw_circle_colour(x,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-32,24,c_black,c_black,true);
	draw_circle_colour(x,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-32,22,c_white,c_white,true);
	
	if (assist_invincible=false)
	and(invincible>60)
	{
		if (invincible<240)
		{
			if (invincible%2==0)
			{
				draw_sprite_ext(sprite_index,image_index,x,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-32,draw_xscale/2*sign(image_xscale),draw_yscale/2,angle,random(9999),image_alpha);
			}
			else
			{
				draw_sprite_ext(sprite_index,image_index,x,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-32,draw_xscale/2*sign(image_xscale),draw_yscale/2,angle,image_blend,image_alpha);
			}
		}
		else
		{
			draw_sprite_ext(sprite_index,image_index,x,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-32,draw_xscale/2*sign(image_xscale),draw_yscale/2,angle,random(9999),image_alpha);
		}
	}
	else
	{
		draw_sprite_ext(sprite_index,image_index,x,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-32,draw_xscale/2*sign(image_xscale),draw_yscale/2,angle,image_blend,image_alpha);
	}
}
#endregion /*Draw arrow when player is outside bottom view END*/

#region /*Get 1-up if you get 100 basic collectibles*/
if (global.basic_collectibles>99)
{
	global.basic_collectibles=0;
	lives+=1;/*1-UP*/
	global.hud_show_lives=true;
	if (instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_lives_timer=global.hud_show_timer;
		}
	}
	if (asset_get_type("snd_1up")==asset_sound)
	{
		audio_play_sound(snd_1up,0,0);
		audio_sound_gain(snd_1up,global.sfx_volume,0);
	}
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y-16,0,obj_scoreup);
		with(obj)
		{
			scoreup="1-UP";
		}
	}
}
#endregion /*Get 1-up if you get 100 basic collectibles END*/

#region /*Draw Self*/

#region /*Make it obvious if you take damage*/
if (takendamage>=takendamage_freezetime)
{
	dive=false;
	gravity=0;
	hspeed=0;
	vspeed=0;
	speed=0;
	if (sprite_die>noone){sprite_index = sprite_die;}else
	{sprite_index = sprite_stand;}
	if (image_index>image_number-1)
	{
		image_speed=0;
	}
	else
	{
		image_speed=0.5;
	}
}
if (takendamage>=100)
and(die=false)
{
	audio_play_sound(voice_damage,0,0);
	audio_sound_gain(voice_damage,global.voices_volume,0);
}
#endregion /*Make it obvious if you take damage END*/

redblinktimer+=1;
if (redblinktimer>30)
{
	redblinktimer=0;
}
if (can_double_jump=false)
{
	double_jump_depleted_blink+=1;
	if (double_jump_depleted_blink>20)
	{
		double_jump_depleted_blink=0;
	}
}
else
{
	double_jump_depleted_blink=0;
}

#region /*Blink red when only having 1 HP left and no heart balloon*/
if (redblinktimer>25)
and(have_heart_balloon=false)
and(hp<=1)
and(max_hp>=2)
and(sprite_index>0)
{
	draw_sprite_ext(sprite_index,image_index,xx+random_range(-8,+8),yy+random_range(-8,+8),draw_xscale*sign(image_xscale),draw_yscale,angle,c_red,image_alpha);
}
else
if (takendamage%2==0)
and(sprite_index>0)
{
	draw_sprite_ext(sprite_index,image_index,xx,yy,draw_xscale*sign(image_xscale),draw_yscale,angle,image_blend,image_alpha);
	if (hp<=1)
	and(max_hp>=2)
	{
		draw_sprite_ext(sprite_index,image_index,xx,yy,draw_xscale*sign(image_xscale),draw_yscale,angle,c_red,0.1);
	}
}
else
if (sprite_index>0)
{
	draw_sprite_ext(sprite_index,image_index,xx,yy,draw_xscale*sign(image_xscale),draw_yscale,angle,image_blend,0.5);
}
#endregion /*Blink red when only having 1 HP left and no heart balloon END*/

if (double_jump_depleted_blink>=18)
and(sprite_index>0)
{
	draw_sprite_ext(sprite_index,image_index,xx,yy,draw_xscale*sign(image_xscale),draw_yscale,angle,c_ltgray,0.50);
}
#endregion /*Draw Self END*/

#region /*Turnaround Effect*/
if (effect_turnaround_subimg<10)
and(climb=false)
and(horizontal_rope_climb=false)
{
	if (asset_get_type("spr_effect_turnaround")==asset_sprite)
	{
		draw_sprite_ext(spr_effect_turnaround,effect_turnaround_subimg,x,y,image_xscale,image_yscale,angle,c_white,0.5);
	}
}
if (effect_turnaround_subimg<11)
{
	effect_turnaround_subimg+=1;
}
#endregion /*Turnaround Effect END*/

#region /*Invinsible*/
if (assist_invincible=false)
{
	if (invincible>0)
	{
		invincible-=1;
	}
	if (invincible>60)
	and(sprite_index>0)
	{
		if (invincible<240)
		{
			if (invincible%2==0)
			{
				draw_sprite_ext(sprite_index,image_index,xx,yy,draw_xscale*sign(image_xscale),draw_yscale,angle,random(9999),image_alpha);
			}
			else
			{
				draw_sprite_ext(sprite_index,image_index,xx,yy,draw_xscale*sign(image_xscale),draw_yscale,angle,image_blend,image_alpha);
			}
		}
		else
		{
			draw_sprite_ext(sprite_index,image_index,xx,yy,draw_xscale*sign(image_xscale),draw_yscale,angle,random(9999),image_alpha);
		}
	}
}

if (invincible>60)
or(global.assist_extra_hp>=10)
{
	if (floor(random(10-1))=0)
	{
		effect_create_above(ef_star,x+random_range(-50,+50),y+random_range(-50,+50),0,c_white);
	}
}
#endregion /*Invinsible END*/

#region /*Don't make it look like the player is teleporting when the plyaer teleports*/
if (smooth_teleport<1)
{
	xx=lerp(xx,x,smooth_teleport);
	yy=lerp(yy,y,smooth_teleport);
	smooth_teleport+=0.1;
}
else
if (stomp_spin=true)
or(spring=true)
{
	xx=lerp(xx,x,0.4);
	yy=lerp(yy,y,0.4);
}
else
{
	xx=lerp(xx,x,1);
	yy=lerp(yy,y,1);
}
#endregion /*Don't make it look like the player is teleporting when the plyaer teleports END*/

#region /*Homing Attack*/
if (allow_homing_attack=true)
{

	#region /*Homing Enemy*/
	if (asset_get_type("obj_wall")==asset_object)
	and(!place_meeting(x,y+1,obj_wall))
	and(stick_to_wall=false)
	and(climb=false)
	and(horizontal_rope_climb=false)
	and(asset_get_type("obj_enemy")==asset_object)
	and(instance_exists(obj_enemy))
	and(!collision_line(x,y,instance_nearest(x,y,obj_enemy).x,instance_nearest(x,y,obj_enemy).y,obj_wall,false,true))
	and(distance_to_object(obj_enemy)<hoverstomp_distance)
	and(instance_nearest(x,y,obj_enemy).bbox_bottom>y)
	and(instance_nearest(x,y,obj_enemy).die=false)
	{
		aim_image_index+=1;
		if (asset_get_type("spr_aim")==asset_sprite)
		{
			draw_sprite_ext(spr_aim,aim_image_index,instance_nearest(x,y,obj_enemy).x,instance_nearest(x,y,obj_enemy).y,1,1,0,c_white,1);
		}
		else
		{
			draw_circle_color(instance_nearest(x,y,obj_enemy).x,instance_nearest(x,y,obj_enemy).y,32,c_lime,c_lime,true);
		}
	}
	#endregion /*Homing Enemy END*/

	#region /*Homing Spring*/
	else
	if (asset_get_type("obj_wall")==asset_object)
	and(!place_meeting(x,y+1,obj_wall))
	and(spring=false)
	and(stick_to_wall=false)
	and(climb=false)
	and(horizontal_rope_climb=false)
	and(asset_get_type("obj_spring")==asset_object)
	and(instance_exists(obj_spring))
	and(!collision_line(x,y,instance_nearest(x,y,obj_spring).x,instance_nearest(x,y,obj_spring).y,obj_wall,false,true))
	and(distance_to_object(obj_spring)<hoverstomp_distance)
	and(instance_nearest(x,y,obj_spring).bbox_bottom>y)
	{
		aim_image_index+=1;
		if (asset_get_type("spr_aim")==asset_sprite)
		{
			draw_sprite_ext(spr_aim,aim_image_index,instance_nearest(x,y,obj_spring).x,instance_nearest(x,y,obj_spring).y,1,1,0,c_white,1);
		}
		else
		{
			draw_circle_color(instance_nearest(x,y,obj_spring).x,instance_nearest(x,y,obj_spring).y,32,c_lime,c_lime,true);
		}
	}
	#endregion /*Homing Spring END*/

	else
	{
		aim_image_index=0;
	}
}
#endregion /*Homing Attack END*/

#region /*Color Skin*/
if (player=1)
{
	image_blend=global.hex_color_for_player_1;
}
if (player=2)
{
	image_blend=global.hex_color_for_player_2;
}
if (player=3)
{
	image_blend=global.hex_color_for_player_3;
}
if (player=4)
{
	image_blend=global.hex_color_for_player_4;
}
#endregion /*Color Skin END*/

#region /*Display Player Number and Name*/
if (global.playergame>0)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if (player=1)
	{
		if (global.player1_name="")
		{
			draw_text_outlined(x,y-64,"P1",global.default_text_size,c_black,global.player1_color,1);
		}
		else
		{
			draw_text_outlined(x,y-64,string(global.player1_name),global.default_text_size,c_black,global.player1_color,1);
		}
	}
	if (player=2)
	{
		if (global.player2_name="")
		{
			draw_text_outlined(x,y-64,"P2",global.default_text_size,c_black,global.player2_color,1);
		}
		else
		{
			draw_text_outlined(x,y-64,string(global.player2_name),global.default_text_size,c_black,global.player2_color,1);
		}
	}
	if (player=3)
	{
		if (global.player3_name="")
		{
			draw_text_outlined(x,y-64,"P3",global.default_text_size,c_black,global.player3_color,1);
		}
		else
		{
			draw_text_outlined(x,y-64,string(global.player3_name),global.default_text_size,c_black,global.player3_color,1);
		}
	}
	if (player=4)
	{
		if (global.player4_name="")
		{
			draw_text_outlined(x,y-64,"P4",global.default_text_size,c_black,global.player4_color,1);
		}
		else
		{
			draw_text_outlined(x,y-64,string(global.player4_name),global.default_text_size,c_black,global.player4_color,1);
		}
	}
}
#endregion /*Display Player Number and Name END*/

if (hp > 0)
and(max_hp > 1)
and(global.assist_extra_hp<=9)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_outlined(x,y-96,"HP: "+string(hp)+"/"+string(max_hp),global.default_text_size,c_white,c_black,1);
}