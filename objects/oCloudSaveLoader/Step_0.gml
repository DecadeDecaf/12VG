switch state {
	
	// Wait for slots to load
	case 0:
		if ng_getSlotLoadStatus()==1 {			// -1=not loaded, 0=loading, 1=loaded
			state=1;
			showCSDebugMessage("All cloud save slots loaded!");
		} else {
			showCSDebugMessage("Attempting to load data from slot "+string(slot));
		}
	break;
	
	
	
	// Retrieve the URL from the desired slot
	case 1:
		url=ng_loadSlot(slot);
		
		if url!="" {
			state=2;
			asyncID=http_get(url);
			showCSDebugMessage("Slot "+string(slot)+" URL retrieved: "+string(url)+", attempting to download...")
		} else {
			showCSDebugMessage("No URL in slot "+string(slot)+".");
			state=-1;
		}
	break;
	
	
	
	// Wait for async event
	case 2:
		//
	break;
	
	
	
	// Perform operations
	case 3:
		//showDebugMessage("PRIOR TO READING INTO MAP: ", result);
		onObtainResult(result);
		state=4;
	break;
	
}