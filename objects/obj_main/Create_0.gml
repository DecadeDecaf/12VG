#macro g global

g.desktop = (os_browser == browser_not_a_browser);

g.gfc = 0;
lfc = 0;

randomize();
exception_unhandled_handler(error);

draw_set_circle_precision(64);

surface_resize(application_surface, 1280, 960);
application_surface_draw_enable(false);

window_set_size(1280, 960);
display_reset(8, true);

//audio_play_sound(snd_music, 0, true);