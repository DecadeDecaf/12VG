draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_font);
draw_set_color(#DECEED);
draw_set_alpha(1);

if (audio_sound_is_playable(mus_theme)) {
	draw_text(640, 400, "CLICK TO START");
} else {
	draw_text(640, 400, "LOADING...");
}