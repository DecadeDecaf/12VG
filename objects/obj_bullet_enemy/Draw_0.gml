var _bs = min(0.75, 0.5 + (fc / 10));

draw_sprite_ext(sprite_index, 0, x, y, _bs, _bs, image_angle, -1, 1);
if (shotspeed > 20) { draw_sprite_ext(sprite_index, 0, xprevious, yprevious, _bs, _bs, image_angle, -1, 0.5); }