if (place_meeting(x,y,other))
{
	if (drag_object=0.5)
	{
		
		#region /*Objects that doesn't delete any underlying object*/
		if (object!=74)
		and(object!=75)
		and(object!=76)
		#endregion /*Objects that doesn't delete any underlying object END*/
		
		{
			with(other)
			{
				instance_destroy();
			}
		}
	}
}