function ng_loadCloudSave(s, func=function() {}) {
	/// @function ng_loadCloudSave(slot, [result_function])
	
	/*
	
	This function creates an instance of 'oCloudSaveLoader' to retrieve the data stored in the cloud
	save slot supplied in the first argument, 'slot' or 's'.
	
	oCloudSaveLoader can take a moment to retrieve data. This is where the second argument of this function,
	'result_function' or 'func' comes into play. You can define a new function with operations for oCloudSaveLoader
	to perform on the retrieved cloud save data immediately after the data has been loaded. This *is* an optional
	argument, but I would highly recommend using it for convenience's sake. If you choose to use this argument to
	store a function, you can address the resulting data *in the function* using 'argument[0]'.
	
	Alternatively, you can use 'ng_pullCloudSaveData' to pull data from oCloudSaveLoader later. See below
	for an explanation of that function.
	
	The ID of the oCloudSaveLoader created by this function is returned in case you want to interact with it somehow.
	
	EXAMPLE USE:
	
		ng_loadCloudSave(1, function() {
			if (is_string(result)) {
				ds_map_read(saveMap, argument[0]);
			}
		});
	
	In this example, an instance of oCloudSaveLoader will be created that will load data from cloud save
	slot #1. A function is defined in the second argument with instructions for oCloudSaveLoader to perform
	once the data has been loaded: check if the resulting data (stored in 'argument[0]') is a string and -- if it
	is -- read the resulting data into a ds_map named 'saveMap.'
	
	*/
	
	var inst=instance_create_depth(0, 0, 0, oCloudSaveLoader);
	with inst {
		slot=s;
		onObtainResult=func;
	}
	
	return inst;
}


function ng_pullCloudSaveData(s, def="") {
	/// @function ng_pullCloudSaveData(slot, [default_return_value])
	
	/*
	
	This function is used to retrieve resulting data from an 'oCloudSaveLoader' object, which should
	have been previously created using the 'ng_loadCloudSave' function up above.
	
	The first argument ('slot' / 's') is what slot you're attempting to retrieve data from. This function
	uses this argument to find an oCloudSaveLoader object using the same slot and retrieve the result
	data from that specific instance of oCloudSaveLoader. If successful, this function will return
	the resulting data from that instance of oCloudSaveLoader.
	
	The second (optional) argument ('default_return_value' / 'def') is returned if no data can be retrieved,
	e.g. if there exists no instance of oCloudSaveLoader with the same slot value as the first argument
	*or* the corresponding oCloudSaveLoader instance is not finished or was not successful in retrieving data.
	
	*/
	
	var ret=def;
	with oCloudSaveLoader {
		if s==slot && !is_undefined(result) ret=result;
	}
	
	return ret;
}