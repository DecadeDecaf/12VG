draw_set_color(#FFFFFF);

draw_set_alpha(0.75);
draw_rectangle(32, 908, 718, 936, true);

draw_set_alpha(0.25);
draw_rectangle(34, 910, 34 + 682, 934, false);

draw_set_alpha(0.75);
draw_rectangle(34, 910, 34 + (682 * volume), 932, false);

draw_set_color(#FFFFFF);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_set_font(fnt_font);
draw_set_alpha(1);
draw_text_transformed(375, 900, "Volume: " + string(round(volume * 100)) + "%", 0.8, 0.8, 0);