var r = keyboard_check_pressed(ord("R"));
if (r) { game_restart(); }

var esc = keyboard_check_pressed(vk_escape);
if (esc) { game_end(); }

handle_fullscreen();