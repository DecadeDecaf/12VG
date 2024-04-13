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
	if (zag || spin) { _shots = 2; }
	if (waves) { _shots = 32; }
	for (var s = 0; s < _shots; s++) {
		var _bullet = instance_create_depth(x, y + 80, depth - 1, obj_bullet_enemy, {
			shotspeed : shotspeed,
			dmg : dmg,
			image_angle : 270
		});
		if (ball) {
			_bullet.ball = true;
			_bullet.image_angle = random_range(220, 320);
			_bullet.sprite_index = spr_bullet_enemy_large;
			if (instance_number(obj_bullet_enemy) >= 3) { ball = false; }
		}
		if (zag) {
			_bullet.zag = true;
			_bullet.image_angle = (s == 0 ? 230 : 310);
		}
		if (waves) {
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
		}
		if (spin) {
			_bullet.image_angle = random_range(0, 360)
		}
	}
	cooldown = firerate;
	if (!waves) { pow = 9; } else { wave++; }
}

if (pow > 0) {
	pow--;
}

if (hp <= 0) {
	for (var d = 0; d < 360; d += 120) {
		instance_create_depth(x, y, depth + 1, obj_particle, {
			life : 15,
			p_spd : 5,
			p_dir : d
		});
	}
	with (obj_main) { alarm[0] = 45; }
	instance_destroy();
}