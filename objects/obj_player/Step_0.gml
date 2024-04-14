if (g.reading || dead) {
	exit;
}

var _up = (keyboard_check(ord("W")) || keyboard_check(vk_up));
var _down = (keyboard_check(ord("S")) || keyboard_check(vk_down));
var _left = (keyboard_check(ord("A")) || keyboard_check(vk_left));
var _right = (keyboard_check(ord("D")) || keyboard_check(vk_right));

var _shoot = (keyboard_check(ord("Z")) || keyboard_check(ord("J")) || keyboard_check(vk_space));
var _dash = (keyboard_check(ord("X")) || keyboard_check(ord("K")) || keyboard_check(vk_control));
var _shift = (keyboard_check(ord("C")) || keyboard_check(ord("L")) || keyboard_check(vk_shift));

var _xv = 0 + _right - _left;
var _yv = 0 + _down - _up;

if (image_xscale > 0 && _xv < 0) { image_xscale *= -1; }
if (image_xscale < 0 && _xv > 0) { image_xscale *= -1; }

var spd = (_shift ? 2.5 : 5)
var _vel_dir = point_direction(0, 0, _xv, _yv);
var _vel_spd = (abs(_xv) + abs(_yv) > 0 ? spd : 0);

xvel += lengthdir_x(_vel_spd, _vel_dir);
yvel += lengthdir_y(_vel_spd, _vel_dir);

xvel /= 1.5;
yvel /= 1.5;

x += xvel;
if (x < 64 || x > 1216) { x -= xvel; xvel = 0; }
y += yvel;
if (y < 64 || y > 896) { y -= yvel; yvel = 0; }

if (_shift) {
	if (!focusing) {
		audio_sound_gain(mus_theme, 0, 100);
		audio_sound_gain(mus_theme_focus, 0.5, 100);
		focusing = true;
	}
	invis = min(1, invis + 0.1);
} else {
	if (focusing) {
		audio_sound_gain(mus_theme, 0.5, 100);
		audio_sound_gain(mus_theme_focus, 0, 100);
		focusing = false;
	}
	invis = max(0, invis - 0.1);
}

if (cooldown > 0) {
	cooldown--;
}

if (dash_cooldown > 0) {
	dash_cooldown--;
}

if (_dash && dash_cooldown <= 0) {
	for (var d = 0; d < 360; d += 120) {
		instance_create_depth(x, y, depth + 1, obj_particle, {
			life : 15,
			p_spd : 5,
			p_dir : d
		});
	}
	repeat (35) {
		x += lengthdir_x(_vel_spd, _vel_dir);
		if (x < 64 || x > 1216) { x -= lengthdir_x(_vel_spd, _vel_dir); }
		y += lengthdir_y(_vel_spd, _vel_dir);
		if (y < 64 || y > 896) { y -= lengthdir_y(_vel_spd, _vel_dir); }
	}
	dash_cooldown = 40;
	audio_sound_pitch(snd_dodge, random_range(0.95, 1.05))
	audio_play_sound(snd_dodge, 2, false);
}

if (_shoot && cooldown <= 0) {
	instance_create_depth(x, y - 80, depth - 1, obj_bullet_player, {
		shotspeed : shotspeed,
		dmg : dmg
	});
	cooldown = firerate;
	audio_sound_pitch(snd_pew, random_range(0.95, 1.05))
	audio_play_sound(snd_pew, 2, false);
	pow = 7;
}

if (pow > 0) {
	pow--;
}

if (hearts <= 0) {
	audio_sound_pitch(snd_hit, random_range(0.95, 1.05))
	audio_play_sound(snd_hit, 2, false);
	audio_sound_pitch(snd_voice_high, random_range(0.95, 1.05))
	audio_play_sound(snd_voice_high, 2, false);
	for (var d = 0; d < 360; d += 120) {
		instance_create_depth(x, y, depth + 1, obj_particle, {
			life : 15,
			p_spd : 5,
			p_dir : d
		});
	}
	dead = true;
	g.deaths++;
	alarm[0] = 70;
}