x += lengthdir_x(shotspeed, image_angle);
y += lengthdir_y(shotspeed, image_angle);

if (ball) {
	shotspeed += 0.25;
	if (shotspeed > 15) { shotspeed = 15; }
	if (x < 0 || x > 1280) {
		x -= lengthdir_x(shotspeed, image_angle);
		image_angle = point_direction(x, y, x + lengthdir_x(-1, image_angle), y + lengthdir_y(1, image_angle));
		shotspeed = 5;
	}
	if (y < 0 || y > 960) {
		y -= lengthdir_y(shotspeed, image_angle);
		image_angle = point_direction(x, y, x + lengthdir_x(1, image_angle), y + lengthdir_y(-1, image_angle));
		shotspeed = 5;
	}
}

if (zag && fc % 45 == 0) {
	image_angle = point_direction(x, y, x + lengthdir_x(-1, image_angle), y + lengthdir_y(1, image_angle));
}

var _boss = instance_nearest(x, y, obj_player);

if (place_meeting(x, y, _boss)) {
	if (_boss.dash_cooldown < 25 && !_boss.dead) {
		var _part_spread = 35;
		var _part_back = image_angle + 180 - _part_spread;
		var _part_bac_over = image_angle + 180 + _part_spread;
		for (var d = _part_back; d <= _part_bac_over; d += _part_spread) {
			instance_create_depth(x, y, depth + 1, obj_particle, {
				sprite_index : spr_bullet_enemy_particle,
				life : 25,
				p_spd : 5,
				p_dir : d
			});
		}
		with (_boss) { hearts--; }
		if (ball && !limited) { with (obj_enemy) { ball = true; } }
		room_speed = 15;
		instance_destroy();
	}
}

if (limited && fc > 450) {
	var _part_spread = 35;
	var _part_back = image_angle + 180 - _part_spread;
	var _part_bac_over = image_angle + 180 + _part_spread;
	for (var d = _part_back; d <= _part_bac_over; d += _part_spread) {
		instance_create_depth(x, y, depth + 1, obj_particle, {
			sprite_index : spr_bullet_enemy_particle,
			life : 25,
			p_spd : 5,
			p_dir : d
		});
	}
	instance_destroy();
}

if (y > 1088) {
	instance_destroy();
}