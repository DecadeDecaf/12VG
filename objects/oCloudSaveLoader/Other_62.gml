if ds_map_find_value(async_load, "id")==asyncID {
	status=ds_map_find_value(async_load, "status");
	result=ds_map_find_value(async_load, "result");
	showCSDebugMessage("Status: "+string(status)+"  Result: "+string(result));
	state=3;
}