function handle_fullscreen() {
	var f = keyboard_check_pressed(ord("F"));
	if (f && g.desktop) { switch_fullscreen(); }
}

function switch_fullscreen() {
	var full = !window_get_fullscreen();
	set_fullscreen(full);
}

function set_fullscreen(full) {
	window_set_fullscreen(full);
	window_set_size(1280, 960);
	display_reset(8, true);
}

function error(struct) {
	show_debug_message("ERROR: " + string(struct));
}