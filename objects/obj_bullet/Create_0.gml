depth = +9;

mask_index = spr_small_mask;

image_speed = 0.3;

draw_xscale = 0;
draw_yscale = 1;
flat = false;
stomped_delay = 0;
die = false;
die_volting = false;
give_rewards = true;
stuck_in_wall_counter = 0;
sliding_along_ground = 0;
can_die_from_spikes = true;
can_turn_around_at_wall = false;
coil_spring = false;
number_of_times_stomped = 0;
enemyvoice_defeated1 = snd_enemyvoice_defeated;
enemyvoice_defeated2 = snd_enemyvoice_defeated2;
enemyvoice_defeated3 = snd_enemyvoice_defeated3;
blind = false;

on_ground = false;

#region /* If enemies are disabled, destroy this object */
if (global.assist_enable)
&& (global.assist_enable_enemies == false)
{
	instance_destroy();
}
#endregion /* If enemies are disabled, destroy this object END */