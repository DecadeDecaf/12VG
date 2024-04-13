shader_set(shd_grayscale);
draw_surface(application_surface, 0, 0);
shader_reset();

var _gf = floor(g.gfc / 6) % 6
draw_sprite_ext(bg_grain, _gf, 0, 0, 1, 1, 0, -1, 0.1)

var _yf = (lfc / 4) % 960
draw_sprite_ext(bg_lines, 0, 0, _yf, 1, 1, 0, -1, 0.03)
draw_sprite_ext(bg_lines, 0, 0, _yf - 960, 1, 1, 0, -1, 0.03)