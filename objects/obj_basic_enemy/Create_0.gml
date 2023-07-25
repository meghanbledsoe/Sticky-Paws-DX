depth = +9;

sprite_index = spr_noone;
image_speed = 0.3;
image_xscale = -1;
draw_xscale = 1;
draw_yscale = 1;
flat = false;
stomped_delay = 0;
die = false;
die_volting = false;
sliding_along_ground = 0;
blind = false;
coil_spring = false;
can_die_from_spikes = true;
can_turn_around_at_wall = true;
number_of_times_stomped = 0;
give_rewards = true;
enemyvoice_defeated1 = snd_enemyvoice_defeated;
enemyvoice_defeated2 = snd_enemyvoice_defeated2;
enemyvoice_defeated3 = snd_enemyvoice_defeated3;
mask_index = spr_small_mask;
sprite_used = "stand";
stuck_in_wall_counter = 0;
on_ground = false;

if (global.assist_enable && !global.assist_enable_enemies)
{
    instance_destroy();
}