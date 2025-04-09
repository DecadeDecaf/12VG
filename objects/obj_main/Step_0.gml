if (g.reading && rfc > 45) {
	if (!pressed && keyboard_check_pressed(vk_anykey)) { pressed = true; }
	var _cont = pressed && keyboard_check_released(vk_anykey);
	var _prog = string_length(g.lore[@ g.chapter]);
	var _txtspd = 0.75;
	if (g.progress < _prog) {
		if (rfc % 5 == 0) {
			play_voice()
		}
		g.progress += _txtspd;
		if (_cont) {
			g.progress = _prog;
		}
	} else if (g.chapter < 11) {
		if (_cont) {
			instance_destroy(obj_volumeslider);
			g.reading = false;
			g.progress = 0;
			g.chapter++;
			if (g.chapter == 1) {
				ng_request_login();
				instance_create_depth(x, y, depth, obj_prompts);
			} else if (g.chapter == 2) {
				var _enemy = instance_create_depth(640, 160, depth, obj_enemy);
				_enemy.sprite_index = spr_enemy_1;
				_enemy.max_hp = 34;
				_enemy.hp = 34;
			} else if (g.chapter == 3) {
				var _enemy = instance_create_depth(640, 160, depth, obj_enemy);
				_enemy.sprite_index = spr_enemy_2;
				_enemy.max_hp = 28;
				_enemy.hp = 28;
				_enemy.movespd = 6;
				_enemy.moverate = 68;
				_enemy.shoot = false;
				_enemy.firerate = 67;
				_enemy.shotspeed = 5;
				_enemy.ball = true;
			} else if (g.chapter == 4) {
				var _enemy = instance_create_depth(640, 160, depth, obj_enemy);
				_enemy.sprite_index = spr_enemy_3;
				_enemy.max_hp = 45;
				_enemy.hp = 45;
				_enemy.firerate = 7;
				_enemy.shotspeed = 7.5;
				_enemy.zag = true;
			} else if (g.chapter == 5) {
				var _enemy = instance_create_depth(640, 160, depth, obj_enemy);
				_enemy.sprite_index = spr_enemy_4;
				_enemy.max_hp = 50;
				_enemy.hp = 50;
				_enemy.firerate = 85;
				_enemy.shotspeed = 10;
				_enemy.waves = true;
			} else if (g.chapter == 6) {
				var _enemy = instance_create_depth(640, 160, depth, obj_enemy);
				_enemy.sprite_index = spr_enemy_5;
				_enemy.max_hp = 78;
				_enemy.hp = 78;
				_enemy.movespd = 3;
				_enemy.moverate = 134;
				_enemy.firerate = 9;
				_enemy.shotspeed = 5.5;
				_enemy.spin = true;
			} else if (g.chapter == 7) {
				var _enemy = instance_create_depth(640, 160, depth, obj_enemy);
				_enemy.sprite_index = spr_enemy_6;
				_enemy.max_hp = 32;
				_enemy.hp = 32;
				_enemy.movespd = 5;
				_enemy.moverate = 84;
				_enemy.firerate = 42;
				_enemy.shotspeed = 22;
				_enemy.snipe = true;
			} else if (g.chapter == 8) {
				var _enemy = instance_create_depth(640, 300, depth, obj_enemy);
				_enemy.sprite_index = spr_enemy_7;
				_enemy.max_hp = 62;
				_enemy.hp = 62;
				_enemy.movespd = 1;
				_enemy.firerate = 12;
				_enemy.shotspeed = 8;
				_enemy.star = true;
			} else if (g.chapter == 9) {
				var _enemy = instance_create_depth(640, 160, depth, obj_enemy);
				_enemy.sprite_index = spr_enemy_9;
				_enemy.max_hp = 30;
				_enemy.hp = 30;
				_enemy.firerate = 36;
				_enemy.shotspeed = 10;
				_enemy.sides = true;
			} else if (g.chapter == 10) {
				var _enemy1 = instance_create_depth(440, 200, depth, obj_enemy);
				_enemy1.sprite_index = spr_enemy_10;
				_enemy1.max_hp = 27;
				_enemy1.hp = 27;
				_enemy1.movespd = 5;
				_enemy1.moverate = 75;
				_enemy1.firerate = 26;
				_enemy1.shotspeed = 7;
				_enemy1.shaky = true;
				_enemy1.cooldown = 90;
				var _enemy2 = instance_create_depth(840, 200, depth, obj_enemy);
				_enemy2.sprite_index = spr_enemy_11;
				_enemy2.max_hp = 27;
				_enemy2.hp = 27;
				_enemy2.movespd = 5;
				_enemy2.moverate = 75;
				_enemy2.firerate = 26;
				_enemy2.shotspeed = 7;
				_enemy2.shaky = true;
				_enemy2.cooldown = 103;
				_enemy2.box_offset = 40;
				_enemy2.fc = 35;
			} else if (g.chapter == 11) {
				var _enemy = instance_create_depth(640, 200, depth, obj_enemy);
				_enemy.sprite_index = spr_enemy_12;
				_enemy.max_hp = 90;
				_enemy.hp = 90;
				_enemy.movespd = 3.5;
				_enemy.moverate = 128;
				_enemy.cycles = true;
				_enemy.cycle = 1;
				_enemy.firerate = 67;
				_enemy.shotspeed = 5;
				g.filter = false
			}
		}
	}
}

with (obj_enemy) {
	if (cycles) {
		if (cycle == 6 && alarm[2] < 80) { other.warning += 0.025; }
		else { other.warning = 0; }
	}
}

if (warning > 1) { warning = 1; }

var r = keyboard_check_pressed(ord("R"));
if (r && g.desktop) { game_restart(); }

var esc = keyboard_check_pressed(vk_escape);
if (esc && g.desktop) { game_end(); }

handle_fullscreen();