/* Collision Event with player object */
if (die == false)
{

if (other.vspeed >= 0)
{
	other.spring = false;
	other.spring_animation = 0;
}

if (other.invincible_timer > 0)
|| (other.taken_damage > 0)
|| (other.dive)
|| (other.can_attack_after_dive_on_ground > 0)
{
	if (other.key_jump_hold)
	{
		other.dive = false;
		with(other)
		{
			if (simple_controls == false)
			{
				vspeed = -triple_jump_height;
			}
		}
	}
	if (die_volting == false)
	{
		die = true;
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
		global.enemy_counter ++;
		with(instance_nearest(x, y, obj_player))
		{
			chain_reaction ++;
			midair_jumps_left = number_of_jumps - 1;
			can_dive = true;
		}
		if (other.x < x)
		{
			vspeed = - 8;
			die_volting = -1;
		}
		else
		{
			vspeed = - 8;
			die_volting = +1;
		}
		effect_create_above(ef_smoke, x, y, 2, c_white);
		scr_gamepad_vibration(other.player, 0.5, 10);
		
		#region /* Enemy Voice Defeated */
		scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);
		#endregion /* Enemy Voice Defeated END */
		
		scr_get_rewards_when_jumped_on();
		
	}
}












if (die_volting == false)
{
	if (other.vspeed > 0)
	|| (other.climb == false)
	&& (other.vspeed < 0)
	|| (other.bbox_bottom < y)
	{
		if (other.ground_pound != true)
		&& (flat == false)
		{
			if (abs(other.hspeed) > 7)
			{
				other.jump ++;
				if (other.jump > 2)
				{
					if (other.image_xscale > 0)
					{
						other.angle = +720;
					}
					else
					{
						other.angle = -720;
					}
				}
			}
			die = true;
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
			global.enemy_counter ++;
			with(instance_nearest(x, y, obj_player))
			{
				chain_reaction ++;
				midair_jumps_left = number_of_jumps - 1;
				can_dive = true;
			}
			flat = true;
			effect_create_below(ef_ring, x, y, 0, c_white);
			scr_gamepad_vibration(other.player, 0.5, 10);
			
			scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);
			
			scr_get_rewards_when_jumped_on();
			
speed = 0;
if (other.key_jump_hold)
{
	with(other)
	{
		if (in_water)
		{
			vspeed = -4;
		}
		else
		if (simple_controls == false)
		{
			vspeed = -triple_jump_height;
		}
		else
		{
			vspeed = - 8;
		}
	}
}
else
{
	if (other.in_water)
	{
		other.vspeed = -4;
	}
	else
	{
		other.vspeed = - 8;
	}
}
image_index = 0;
}
else
if (other.ground_pound)
&& (flat == false)
{
	die = true;
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
	global.enemy_counter ++;
	with(instance_nearest(x, y, obj_player))
	{
		chain_reaction ++;
		midair_jumps_left = number_of_jumps - 1;
		can_dive = true;
	}
	flat = true;
	effect_create_below(ef_ring, x, y, 0, c_white);
	scr_gamepad_vibration(other.player, 0.5, 10);
	
	scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);
	
	scr_get_rewards_when_jumped_on();
	
speed = 0;
image_index = 0;
if (other.x < x)
{
	vspeed = - 8;
	die_volting = -1;
}
else
{
	vspeed = - 8;
	die_volting = +1;
}
}
}


else
if (other.taken_damage <= 0)
&& (other.assist_invincible == false)
{
	if (other.have_heart_balloon)
	{
		other.have_heart_balloon = false;
		
		#region /* Save heart balloon to be false */
		ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
		ini_write_real("Player", "player" + string(other.player) + "_have_heart_balloon", false);
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		#endregion /* Save heart balloon to be false END */
		
	}
	else
	{
		other.hp --;
	}
	other.taken_damage = 100;
	scr_gamepad_vibration(other.player, 1, 10);
}
}
}