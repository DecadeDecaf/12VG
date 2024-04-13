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
	if (y < 200 && irandom_range(1, 10) <= 2) {
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

var spd = 4
var _vel_dir = point_direction(0, 0, _xv, _yv);
var _vel_spd = (abs(_xv) + abs(_yv) > 0 ? spd : 0);

xvel += lengthdir_x(_vel_spd, _vel_dir);
yvel += lengthdir_y(_vel_spd, _vel_dir);

xvel /= 1.5
yvel /= 1.5

x += xvel
y += yvel

if (cooldown > 0) {
	cooldown--;
}

if (cooldown <= 0) {
	instance_create_depth(x, y + 80, depth - 1, obj_bullet_enemy, {
		shotspeed : shotspeed,
		dmg : dmg,
		image_angle : 270
	});
	cooldown = firerate;
	pow = 9;
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