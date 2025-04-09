if os_browser==browser_not_a_browser {
	instance_destroy();
	return 0;
}

slot=1;
state=0;
url="";
asyncID=-1
httpFile=-1;
result=undefined;

ng_loadSlots();

showCSDebugMessage=function(str) {
	/// @function showCSDebugMessage(string)
	show_debug_message("CLOUD SAVE: "+string(str));
}

onObtainResult=function() {
	/// @function onObtainResult()
}