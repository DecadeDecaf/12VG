var _bs = min(0.5, 0.25 + (fc / 10));

if (fc > 5) { draw_sprite_ext(sprite_index, 0, x, y + 10, _bs, _bs, 0, -1, 0.5); }
if (fc > 10) { draw_sprite_ext(sprite_index, 0, x, y + 20, _bs, _bs, 0, -1, 0.25); }
if (fc > 15) { draw_sprite_ext(sprite_index, 0, x, y + 30, _bs, _bs, 0, -1, 0.125); }

draw_sprite_ext(sprite_index, 0, x, y, _bs, _bs, 0, -1, 1);