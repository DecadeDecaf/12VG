var _xs = image_xscale;
var _alph = image_alpha

if ((snipe || (cycles && cycle == 5)) && cooldown > 0 && cooldown < 20) {
	if (instance_exists(obj_player)) {
		draw_set_alpha(1 - (cooldown / 20));
		draw_circle_color(x, y + 80, 6, #FFA2AC, #FFA2AC, false);
		draw_line_width_color(x, y + 80, obj_player.x, obj_player.y, 2.5, #FFA2AC, #FA6E79);
		draw_set_alpha(1);
	}
}

if (spawned) { _alph = min(fc / 20, _alph); }

var _ps = min(1, (pow / 10) * 1.5);
draw_sprite_ext(spr_bullet_pow, 0, x, y + 64, _ps, _ps, 0, -1, 1);

draw_sprite_ext(sprite_index, 0, x, y, _xs, 1, 0, -1, _alph);

var _frame = (fc % 40);
var _half_frame = (fc % 20);

var _wind_spd = _frame / 2;
var _wind_dir = (_xs > 0 ? 145 - (_frame / 4) : 35 + (_frame / 4));

var _tx = x - (40 * _xs)
var _ty = y + 36
_tx += lengthdir_x(_wind_spd, _wind_dir);
_ty += lengthdir_y(_wind_spd, _wind_dir);

var _fs = (_half_frame / 20)
var _ts = (_frame < 20 ? _fs : min(1, (1 - _fs) * 2));

var _sprite_tail = spr_player_tail;
if (cycles) { _sprite_tail = spr_enemy_12_tail; }
draw_sprite_ext(_sprite_tail, 0, _tx, _ty, _ts * _xs, _ts, 0, -1, _alph);