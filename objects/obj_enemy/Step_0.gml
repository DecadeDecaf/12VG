if (g.reading) {
	exit;
}

if (fc % moverate == 0) {
	if (x > 520 && irandom_range(1, 10) <= 4) {
		enemy_left = true;
	}
	if (x < 760 && irandom_range(1, 10) <= 4) {
		enemy_right = true;
	}
	if (y > 160 && irandom_range(1, 10) <= 2) {
		enemy_up = true;
	}
	if (y < (spin ? 400 : 200) && irandom_range(1, 10) <= (spin ? 4 : 2)) {
		enemy_down = true;
	}
	alarm[0] = ceil(moverate / 2);
	alarm[1] = ceil(moverate / 6);
}

var _up = enemy_up;
var _down = enemy_down;
var _left = enemy_left;
var _right = enemy_right;

var _xv = 0 + _right - _left;
var _yv = 0 + _down - _up;

if (image_xscale > 0 && _xv < 0) { image_xscale *= -1; }
if (image_xscale < 0 && _xv > 0) { image_xscale *= -1; }

var spd = movespd;
var _vel_dir = point_direction(0, 0, _xv, _yv);
var _vel_spd = (abs(_xv) + abs(_yv) > 0 ? spd : 0);

xvel += lengthdir_x(_vel_spd, _vel_dir);
yvel += lengthdir_y(_vel_spd, _vel_dir);

xvel /= 1.5
yvel /= 1.5

x += xvel
y += yvel

if (cooldown > 0 && (shoot || ball)) {
	cooldown--;
}

if (cooldown <= 0 && (shoot || ball) && (!zag || _vel_spd == 0)) {
	var _shots = 1;
	if (zag || spin || (cycles && cycle == 2) || (cycles && cycle == 4)) { _shots = 2; }
	if (waves || (cycles && cycle == 3)) { _shots = 32; }
	if (sides || (cycles && cycle == 7)) { _shots = 7; }
	if (star || (cycles && cycle == 6)) { _shots = 5; }
	cooldown = firerate;
	for (var s = 0; s < _shots; s++) {
		var _bullet = instance_create_depth(x, y + 80, depth - 1, obj_bullet_enemy, {
			shotspeed : shotspeed,
			dmg : dmg,
			image_angle : 270
		});
		if (ball || (cycles && cycle == 1)) {
			_bullet.ball = true;
			_bullet.image_angle = random_range(220, 320);
			_bullet.sprite_index = spr_bullet_enemy_large;
			if (instance_number(obj_bullet_enemy) >= 3) { ball = false; }
			if (cycles) {
				cycle = 2;
				shoot = true;
				firerate = 7;
				shotspeed = 7.5;
				_bullet.limited = true;
			}
		} else if (zag || (cycles && cycle == 2)) {
			_bullet.zag = true;
			_bullet.image_angle = (s == 0 ? 230 : 310);
		} else if (waves || (cycles && cycle == 3)) {
			var _xx = 20;
			var _yy = 0;
			var _line_ang = 0;
			var _ang = 270;
			var _spread = 40;
			switch (wave % 3) {
				case 1: _line_ang = 30; _ang = 300; _xx = -320; _spread = 45; break;
				case 2: _line_ang = -30; _ang = 240; _xx = 360; _yy = -640; _spread = 45; _xx -= lengthdir_x(_line_ang, 90); break;
				case 0:
				default: break;
			}
			_xx += lengthdir_x(_spread, _line_ang) * s;
			_yy += lengthdir_y(_spread, _line_ang) * s;
			_bullet.x = _xx;
			_bullet.y = _yy;
			_bullet.image_angle = _ang;
			_bullet.waves = true;
		} else if (spin || (cycles && cycle == 4)) {
			_bullet.image_angle = random_range(0, 360)
		} else if (snipe || (cycles && cycle == 5)) {
			if (instance_exists(obj_player)) {
				_bullet.image_angle = point_direction(x, y + 80, obj_player.x, obj_player.y);
			}
		} else if (star || (cycles && cycle == 6)) {
			var _star_ang = ((fc % 144) * 2.5) + (s * 72);
			_bullet.image_angle = _star_ang;
		} else if (sides || (cycles && cycle == 7)) {
			var _spread = 160;
			var _left_side = (side % 2 == 0)
			var _xx = (_left_side ? -16 : 1296);
			var _yy = (_left_side ? 0 : _spread / 2);
			_xx += lengthdir_x(_spread, 270) * s;
			_yy += lengthdir_y(_spread, 270) * s;
			_bullet.x = _xx;
			_bullet.y = _yy;
			_bullet.image_angle = (_left_side ? 0 : 180);
			_bullet.sides = true;
			_bullet.sprite_index = spr_bullet_enemy_large;
		} else if (shaky || (cycles && cycle == 8)) {
			_bullet.image_angle += random_range(-shaky_spread, shaky_spread);
		}
	}
	if (!waves && !sides && cycle != 3 && cycle != 7) {
		pow = 9;
	} else {
		wave++; side++;
		if (wave % 3 == 0 && cycles && cycle == 3) {
			cycle = 4;
			firerate = 9;
			shotspeed = 5.5;
			alarm[2] = 180;
		}
		if (side % 6 == 0 && cycles && cycle == 7) {
			cycle = 8;
			firerate = 26;
			shotspeed = 7;
			alarm[2] = 110;
		}
	}
}

if (_vel_spd > 0 && cycles && cycle == 2) {
	cycle = 3;
	firerate = 85;
	shotspeed = 10;
}

if (pow > 0) {
	pow--;
}

if (hp <= 0) {
	for (var d = 0; d < 360; d += 120) {
		instance_create_depth(x, y, depth + 1, obj_particle, {
			life : 15,
			p_spd : 5,
			p_dir : d,
			sprite_index : (cycles ? spr_enemy_12_particle : spr_player_dash_particle)
		});
	}
	audio_sound_pitch(snd_voice_high, random_range(0.95, 1.05))
	audio_play_sound(snd_voice_high, 2, false);
	if (instance_number(obj_enemy) <= 1) {
		var _dead = false
		with (obj_player) { _dead = dead; }
		with (obj_main) { if (!_dead) { alarm[0] = 45; } }
	} else {
		with (obj_enemy) {
			if (other.spawned && cycle == 8) {
				cycle = 1;
				firerate = 67;
				shotspeed = 5;
			} else {
				firerate = 11; shotspeed = 10.5; shaky_spread = 40;
			}
		}
	}
	instance_destroy();
}