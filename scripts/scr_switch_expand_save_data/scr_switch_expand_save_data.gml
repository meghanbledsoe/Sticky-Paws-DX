function scr_switch_expand_save_data(desired_save_size_mib = 16, desired_journal_size_mib = 8)
{
	
	//#region /* Nintendo Switch Save Data Handling */
	//if (os_type == os_switch)
	//{
	//	show_debug_message("See if you need to expand save data");
		
	//	global.save_data_size_is_sufficient = true; /* Set this variable to true at first */
	//    var account_idx = 0; /* Account index */
		
	//    /* Retrieve current save data size and journal size */
	//    var current_sizes = switch_save_data_get_size(account_idx);
	//    if (array_length_1d(current_sizes) == 2)
	//    {
	//        var save_data_size = current_sizes[0];
	//        var journal_size = current_sizes[1];
	//        show_debug_message("Current Save Data Size: " + string(save_data_size) + " bytes");
	//        show_debug_message("Current Journal Size: " + string(journal_size) + " bytes");
			
	//        /* Retrieve maximum save data size and journal size */
	//        var max_sizes = switch_save_data_get_max_size();
	//        if (array_length_1d(max_sizes) == 2)
	//        {
	//            var max_save_data_size = max_sizes[0];
	//            var max_journal_size = max_sizes[1];
	//            show_debug_message("Max Save Data Size: " + string(max_save_data_size) + " bytes");
	//            show_debug_message("Max Journal Size: " + string(max_journal_size) + " bytes");
				
	//            /* Check if available save data size is not enough */
	//            if (save_data_size < max_save_data_size)
	//            {
	//                /* Calculate the new desired save data and journal sizes */
	                
	//                /* Expand save data size */
	//                switch_save_data_unmount(); /* Unmount save data before setting save data size, otherwise you can't expand the save data size */
	//				if (desired_save_size_mib > 0) /* desired_save_size_mib = How much MiB save data size should grow to. 4MiB, 8MiB, 16MiB, and 24MiB are valid numbers to use */
	//				&& (desired_journal_size_mib > 0) /* desired_journal_size_mib = How much MiB save data journal size should grow to. 4MiB, 8MiB, 16MiB, and 24MiB are valid numbers to use */
	//				{
	//					var success = switch_save_data_set_size(account_idx, desired_save_size_mib * 1024 * 1024, desired_journal_size_mib * 1024 * 1024); /* grow save area */
	//				}
	//				else
	//				if (desired_save_size_mib > 0)
	//				&& (desired_journal_size_mib == 0)
	//				{
	//					var success = switch_save_data_set_size(account_idx, desired_save_size_mib * 1024 * 1024, 0); /* grow save area */
	//				}
	//				else
	//				if (desired_save_size_mib == 0)
	//				&& (desired_journal_size_mib > 0)
	//				{
	//					var success = switch_save_data_set_size(account_idx, 0, desired_journal_size_mib * 1024 * 1024); /* grow save area */
	//				}
	//				else
	//				{
	//					var success = switch_save_data_set_size(account_idx, 0, 0);
	//				}
	//                switch_save_data_mount(0); /* Don't forget to mount the save data again after expanding save data size */
					
	//                if (success)
	//                {
	//                    show_debug_message("Save data size expanded successfully");
	//					global.save_data_size_is_sufficient = true; /* Save data size is now sufficient */
	//                }
	//                else
	//                {
	//                    show_debug_message("Failed to expand save data size");
	//					global.save_data_size_is_sufficient = false; /* Tell player that save data is full */
	//                }
	//            }
	//            else
	//            {
	//                show_debug_message("Save data size is sufficient");
	//				global.save_data_size_is_sufficient = true; /* Save data size was already sufficient */
	//            }
	//        }
	//        else
	//        {
	//            show_debug_message("Failed to retrieve max save data sizes");
	//			global.save_data_size_is_sufficient = false; /* Tell player that save data is full */
	//        }
	//    }
	//    else
	//    {
	//        show_debug_message("Failed to retrieve save data sizes");
	//		global.save_data_size_is_sufficient = false; /* Tell player that save data is full */
	//    }
	//}
	//#endregion /* Nintendo Switch Save Data Handling */
	
}