if (die=false)
{
	#region /*Push the enemy out of the solid object*/
	if (position_meeting(x,bbox_bottom+1,other))
	or(position_meeting(x,bbox_bottom+2,other))
	or(position_meeting(x,bbox_bottom+3,other))
	or(position_meeting(x,bbox_bottom+4,other))

	or(position_meeting(bbox_left,bbox_bottom+1,other))
	or(position_meeting(bbox_left,bbox_bottom+2,other))
	or(position_meeting(bbox_left,bbox_bottom+3,other))
	or(position_meeting(bbox_left,bbox_bottom+4,other))

	or(position_meeting(bbox_right,bbox_bottom+1,other))
	or(position_meeting(bbox_right,bbox_bottom+2,other))
	or(position_meeting(bbox_right,bbox_bottom+3,other))
	or(position_meeting(bbox_right,bbox_bottom+4,other))
	{
		y-=1;
	}
	#endregion /*Push the enemy out of the solid object END*/

	#region /*Landing on solid object*/
	if (place_meeting(x,y+1,other))
	and(vspeed>=0)
	{
		effect_create_above(ef_smoke,x-16,bbox_bottom,0,c_white);
		effect_create_above(ef_smoke,x,bbox_bottom,0,c_white);
		effect_create_above(ef_smoke,x+16,bbox_bottom,0,c_white);
		effect_create_above(ef_smoke,x-16-8,bbox_bottom-8,0,c_white);
		effect_create_above(ef_smoke,x,bbox_bottom-8,0,c_white);
		effect_create_above(ef_smoke,x+16+8,bbox_bottom-8,0,c_white);
		vspeed=0;
		gravity=0;
		draw_xscale=1.25;
		draw_yscale=0.75;
	}
}
#endregion /*Landing on solid object END*/