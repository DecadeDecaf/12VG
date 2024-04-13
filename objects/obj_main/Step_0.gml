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
				instance_create_depth(x, y, depth, obj_prompts);
			} else if (g.chapter == 2) {
				var _enemy = instance_create_depth(640, 160, depth, obj_enemy);
				_enemy.max_hp = 34;
				_enemy.hp = 34;
			} else if (g.chapter == 3) {
				var _enemy = instance_create_depth(640, 160, depth, obj_enemy);
				_enemy.max_hp = 28;
				_enemy.hp = 28;
				_enemy.movespd = 6;
				_enemy.moverate = 68;
				_enemy.shoot = false;
				_enemy.shotspeed = 5;
				_enemy.ball = true;
			} else if (g.chapter == 4) {
				var _enemy = instance_create_depth(640, 160, depth, obj_enemy);
				_enemy.max_hp = 45;
				_enemy.hp = 45;
				_enemy.firerate = 7;
				_enemy.shotspeed = 7.5;
				_enemy.zag = true;
			} else if (g.chapter == 5) {
				var _enemy = instance_create_depth(640, 160, depth, obj_enemy);
				_enemy.max_hp = 50;
				_enemy.hp = 50;
				_enemy.firerate = 85;
				_enemy.shotspeed = 10;
				_enemy.waves = true;
			} else if (g.chapter == 6) {
				var _enemy = instance_create_depth(640, 160, depth, obj_enemy);
				_enemy.max_hp = 78;
				_enemy.hp = 78;
				_enemy.movespd = 3;
				_enemy.moverate = 134;
				_enemy.firerate = 9;
				_enemy.shotspeed = 5.5;
				_enemy.spin = true;
			}
		}
	}
}

var r = keyboard_check_pressed(ord("R"));
if (r) { game_restart(); }

var esc = keyboard_check_pressed(vk_escape);
if (esc) { game_end(); }

handle_fullscreen();