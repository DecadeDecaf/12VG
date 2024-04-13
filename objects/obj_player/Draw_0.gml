var _xs = image_xscale
var _alph = image_alpha - (invis / 2)

var _ps = min(1, (pow / 10) * 1.5);
draw_sprite_ext(spr_bullet_pow, 0, x, y - 64, _ps, _ps, 0, -1, 1);

draw_sprite_ext(spr_player, 0, x, y, _xs, 1, 0, -1, _alph);

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

draw_sprite_ext(spr_player_tail, 0, _tx, _ty, _ts * _xs, _ts, 0, -1, _alph);

draw_sprite_ext(spr_player_hitbox, 0, x, y, _xs, 1, 0, -1, invis);