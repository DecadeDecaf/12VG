if (g.reading && rfc > 45) {
	if (!pressed && keyboard_check_pressed(vk_anykey)) { pressed = true; }
	var _cont = pressed && keyboard_check_released(vk_anykey);
	var _prog = string_length(g.lore[@ g.chapter]);
	var _txtspd = 2.5;
	if (g.progress < _prog) {
		g.progress += _txtspd;
		if (_cont) {
			g.progress = _prog;
		}
	} else {
		if (_cont) {
			g.reading = false;
			g.progress = 0;
			g.chapter++;
			if (g.chapter == 1) {
				instance_create_depth(x, y, depth, obj_prompts)
			} else if (g.chapter == 2) {
				instance_create_depth(640, 160, depth, obj_enemy)
			}
		}
	}
}

var r = keyboard_check_pressed(ord("R"));
if (r) { game_restart(); }

var esc = keyboard_check_pressed(vk_escape);
if (esc) { game_end(); }

handle_fullscreen();