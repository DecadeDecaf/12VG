if (g.filter) { shader_set(shd_grayscale); }
draw_surface(application_surface, 0, 0);

if (g.reading) {
	draw_sprite_ext(bg_darken, 0, 0, 0, 1, 1, 0, -1, 0.5);
	draw_script();
}

shader_reset();

with (obj_enemy) {
	var _hp_perc = (hp / max_hp);
	var _yoff = box_offset;
	draw_set_color(#10121C);
	draw_roundrect(16, 16 + _yoff, 1264, 50 + _yoff, false);
	draw_set_color(#FFFFFF);
	draw_roundrect(18, 18 + _yoff, 18 + (1244 * _hp_perc), 48 + _yoff, false);
}

var _gf = floor(g.gfc / 6) % 6;
draw_sprite_ext(bg_grain, _gf, 0, 0, 1, 1, 0, -1, 0.1);

var _yf = (lfc / 4) % 960;
draw_sprite_ext(bg_lines, 0, 0, _yf, 1, 1, 0, -1, 0.03);
draw_sprite_ext(bg_lines, 0, 0, _yf - 960, 1, 1, 0, -1, 0.03);