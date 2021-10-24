/*Collision Event with player object*/
if (die=false)
{

if (other.vspeed>=0)
{
	other.spring = false;
	other.spring_animation = 0;
}

if (other.invincible>0)
or(other.takendamage>0)
or(other.dive=true)
or(other.can_tongue_after_dive_on_ground>0)
{
	if (other.key_jump_hold)
	{
		other.dive=false;
		with(other)
		{
			if (simple_controls=false)
			{
				vspeed=-triple_jump_height;
			}
		}
	}
	if (die_volting=false)
	{
		die=true;
		if (image_xscale < 0)
		{
			with(instance_create_depth(x, y, 0, obj_blaster_reward_decrease_mask))
			{
				image_xscale = +1;
			}
		}
		else
		if (image_xscale > 0)
		{
			with(instance_create_depth(x, y, 0, obj_blaster_reward_decrease_mask))
			{
				image_xscale = -1;
			}
		}
		global.enemy_counter+=1;
		with(instance_nearest(x,y,obj_player))
		{
			chain_reaction += 1;
			midair_jumps_left = number_of_jumps-1;
			can_dive = true;
		}
		if (other.x<x)
		{
			die_volting=-1;
			vspeed=-8;
		}
		else
		{
			die_volting=+1;
			vspeed=-8;
		}
		effect_create_above(ef_smoke,x,y,2,c_white);

		#region /*Enemy Voice Defeated*/
		audio_play_sound(choose(enemyvoice_defeated1,enemyvoice_defeated2,enemyvoice_defeated3),0,0);
		audio_sound_gain(enemyvoice_defeated1,global.voices_volume,0);
		audio_sound_gain(enemyvoice_defeated2,global.voices_volume,0);
		audio_sound_gain(enemyvoice_defeated3,global.voices_volume,0);
		#endregion /*Enemy Voice Defeated End*/

#region /*Rewards*/
if (give_rewards = true)
{
if (instance_exists(obj_player))
and (instance_nearest(x,y,obj_player).chain_reaction<=1)
or (other.chain_reaction<=1)
{
	#region /*1 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
	}
	#endregion /*1 Coin END*/
	
	#region /*200 Score*/
	score+=200;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=200;
		}
	}
	#endregion /*200 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=1)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=2)
or(other.chain_reaction=2)
{
	#region /*2 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
	}
	#endregion /*2 Coin END*/
	
	#region /*400 Score*/
	score+=400;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=400;
		}
	}
	#endregion /*400 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=2)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.1);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=3)
or(other.chain_reaction=3)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*800 Score*/
	score+=800;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=800;
		}
	}
	#endregion /*800 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=3)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.2);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=4)
or(other.chain_reaction=4)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*1000 Score*/
	score+=1000;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=1000;
		}
	}
	#endregion /*1000 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=4)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/

	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.3);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=5)
or(other.chain_reaction=5)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*2000 Score*/
	score+=2000;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=2000;
		}
	}
	#endregion /*2000 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=5)
	{
		lives+=1;
		global.hud_show_lives=true;
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
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.4);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=6)
or(other.chain_reaction=6)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*4000 Score*/
	score+=4000;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=4000;
		}
	}
	#endregion /*4000 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=6)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.5);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=7)
or(other.chain_reaction=7)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*8000 Score*/
	score+=8000;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=8000;
		}
	}
	#endregion /*8000 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=7)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.6);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction>=8)
or(other.chain_reaction>=8)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=8)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.7);
	}
}
}
#endregion /*Rewards End*/

}
}












if (die_volting=false)
{
	if (other.vspeed>0)
	or(other.climb=false)
	and(other.vspeed<0)
	or(other.bbox_bottom<y)
	{
		if (other.ground_pound=false)
		and(flat=false)
		{
			if (abs(other.hspeed)>7)
			{
				other.jump+=1;
				if (other.jump>2)
				{
					if (other.image_xscale>0)
					{
						other.angle=+720;
					}
					else
					{
						other.angle=-720;
					}
				}
			}
			die=true;
			if (image_xscale < 0)
			{
				with(instance_create_depth(x, y, 0, obj_blaster_reward_decrease_mask))
				{
					image_xscale = +1;
				}
			}
			else
			if (image_xscale > 0)
			{
				with(instance_create_depth(x, y, 0, obj_blaster_reward_decrease_mask))
				{
					image_xscale = -1;
				}
			}
			global.enemy_counter+=1;
			with(instance_nearest(x,y,obj_player))
			{
				chain_reaction += 1;
				midair_jumps_left = number_of_jumps-1;
				can_dive = true;
			}
			flat=true;
			effect_create_below(ef_ring,x,y,0,c_white);

			#region /*Enemy Voice Defeated*/
			audio_play_sound(choose(enemyvoice_defeated1,enemyvoice_defeated2,enemyvoice_defeated3),0,0);
			audio_sound_gain(enemyvoice_defeated1,global.voices_volume,0);
			audio_sound_gain(enemyvoice_defeated2,global.voices_volume,0);
			audio_sound_gain(enemyvoice_defeated3,global.voices_volume,0);
			#endregion /*Enemy Voice Defeated End*/

#region /*Rewards*/
if (give_rewards = true)
{
if (instance_exists(obj_player))
and (instance_nearest(x,y,obj_player).chain_reaction<=1)
or (other.chain_reaction<=1)
{
	#region /*1 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
	}
	#endregion /*1 Coin END*/
	
	#region /*200 Score*/
	score+=200;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=200;
		}
	}
	#endregion /*200 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=1)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=2)
or(other.chain_reaction=2)
{
	#region /*2 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
	}
	#endregion /*2 Coin END*/
	
	#region /*400 Score*/
	score+=400;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=400;
		}
	}
	#endregion /*400 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=2)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.1);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=3)
or(other.chain_reaction=3)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*800 Score*/
	score+=800;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=800;
		}
	}
	#endregion /*800 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=3)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.2);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=4)
or(other.chain_reaction=4)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*1000 Score*/
	score+=1000;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=1000;
		}
	}
	#endregion /*1000 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=4)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/

	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.3);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=5)
or(other.chain_reaction=5)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*2000 Score*/
	score+=2000;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=2000;
		}
	}
	#endregion /*2000 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=5)
	{
		lives+=1;
		global.hud_show_lives=true;
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
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.4);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=6)
or(other.chain_reaction=6)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*4000 Score*/
	score+=4000;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=4000;
		}
	}
	#endregion /*4000 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=6)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.5);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=7)
or(other.chain_reaction=7)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*8000 Score*/
	score+=8000;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=8000;
		}
	}
	#endregion /*8000 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=7)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.6);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction>=8)
or(other.chain_reaction>=8)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=8)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.7);
	}
}
}
#endregion /*Rewards End*/

speed=0;
if (other.key_jump_hold)
{
	with(other)
	{
		if (simple_controls=false)
		{
			vspeed=-triple_jump_height;
		}
		else
		{
			vspeed=-8;
		}
	}
}
else
{
	other.vspeed=-8;
}
image_index=0;
}
else
if (other.ground_pound=true)
and(flat=false)
{
	die=true;
	if (image_xscale < 0)
	{
		with(instance_create_depth(x, y, 0, obj_blaster_reward_decrease_mask))
		{
			image_xscale = +1;
		}
	}
	else
	if (image_xscale > 0)
	{
		with(instance_create_depth(x, y, 0, obj_blaster_reward_decrease_mask))
		{
			image_xscale = -1;
		}
	}
	global.enemy_counter+=1;
	with(instance_nearest(x,y,obj_player))
	{
		chain_reaction += 1;
		midair_jumps_left = number_of_jumps-1;
		can_dive = true;
	}
	flat=true;
	effect_create_below(ef_ring,x,y,0,c_white);

	#region /*Enemy Voice Defeated*/
	audio_play_sound(choose(enemyvoice_defeated1,enemyvoice_defeated2,enemyvoice_defeated3),0,0);
	audio_sound_gain(enemyvoice_defeated1,global.voices_volume,0);
	audio_sound_gain(enemyvoice_defeated2,global.voices_volume,0);
	audio_sound_gain(enemyvoice_defeated3,global.voices_volume,0);
	#endregion /*Enemy Voice Defeated End*/

#region /*Rewards*/
if (give_rewards = true)
{
if (instance_exists(obj_player))
and (instance_nearest(x,y,obj_player).chain_reaction<=1)
or (other.chain_reaction<=1)
{
	#region /*1 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
	}
	#endregion /*1 Coin END*/
	
	#region /*200 Score*/
	score+=200;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=200;
		}
	}
	#endregion /*200 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=1)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=2)
or(other.chain_reaction=2)
{
	#region /*2 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
	}
	#endregion /*2 Coin END*/
	
	#region /*400 Score*/
	score+=400;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=400;
		}
	}
	#endregion /*400 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=2)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.1);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=3)
or(other.chain_reaction=3)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*800 Score*/
	score+=800;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=800;
		}
	}
	#endregion /*800 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=3)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.2);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=4)
or(other.chain_reaction=4)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*1000 Score*/
	score+=1000;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=1000;
		}
	}
	#endregion /*1000 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=4)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/

	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.3);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=5)
or(other.chain_reaction=5)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*2000 Score*/
	score+=2000;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=2000;
		}
	}
	#endregion /*2000 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=5)
	{
		lives+=1;
		global.hud_show_lives=true;
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
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.4);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=6)
or(other.chain_reaction=6)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*4000 Score*/
	score+=4000;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=4000;
		}
	}
	#endregion /*4000 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=6)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.5);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction=7)
or(other.chain_reaction=7)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*8000 Score*/
	score+=8000;
	if (asset_get_type("obj_scoreup")==asset_object)
	{
		obj=instance_create_depth(x,y,0,obj_scoreup);
		with(obj)
		{
			scoreup=8000;
		}
	}
	#endregion /*8000 Score END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=7)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.6);
	}
}
else
if (instance_exists(obj_player))
and(instance_nearest(x,y,obj_player).chain_reaction>=8)
or(other.chain_reaction>=8)
{
	#region /*4 Coin*/
	if (asset_get_type("obj_basic_collectible")==asset_object)
	{
		var obj;
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=10;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=20;
		}
		obj=instance_create_depth(x,bbox_top,0,obj_basic_collectible);
		with(obj)
		{
			image_speed=1;
			motion_set(90,10);
			bounceup=true;
			delay_time=30;
		}
	}
	#endregion /*4 Coin END*/
	
	#region /*1-UP*/
	if (global.number_of_chain_kills_for_1up<=8)
	{
		lives+=1;
		global.hud_show_lives=true;
		if (asset_get_type("snd_1up")==asset_sound)
		{
			audio_play_sound(snd_1up,0,0);
			audio_sound_gain(snd_1up,global.sfx_volume,0);
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y-32,0,obj_scoreup);
			with(obj)
			{
				scoreup="1-UP";
			}
		}
	}
	#endregion /*1-UP END*/
	
	if (asset_get_type("snd_stomp")==asset_sound)
	{
		audio_play_sound(snd_stomp,0,0);
		audio_sound_gain(snd_stomp,global.sfx_volume,0);
		audio_sound_pitch(snd_stomp,1.7);
	}
}
}
#endregion /*Rewards End*/

speed=0;
image_index=0;
if (other.x<x)
{
	die_volting=-1;
	vspeed=-8;
}
else
{
	die_volting=+1;
	vspeed=-8;
}
}
}


else
if (other.takendamage<=0)
and(other.assist_invincible=false)
{
	if (other.have_heart_balloon=true)
	{
		other.have_heart_balloon=false;
	}
	else
	{
		other.hp-=1;
	}
	other.takendamage=100;
}
}
}