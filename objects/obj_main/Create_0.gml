#macro g global

g.desktop = (os_browser == browser_not_a_browser);

g.gfc = 0;
lfc = 0;
rfc = 0;

g.reading = true;
g.chapter = 4;
g.lore = [
"\"@JYMORTAL!@JN\"↵↵An ethereal, deep voice shook the ground beneath the human's feet.↵↵\"@JYYOU HAVE BROKEN AN ANCIENT LAW. PREPARE TO BE JUDGED BY A JURY↵OF YOUR LATE PEERS.@JN\"↵↵The human looked dumbfounded, until finally replying, \"huh?\"↵↵Instead of a reply, the human was met with the summoning of twelve↵ghosts before them. These ghosts were to decide the human's fate,↵and among them... was YOU!↵↵(press any key to continue)",
"\"Clearly they're guilty,\" proclaimed ghost #1. \"They broke an ancient rule!\"↵↵You pondered this for a moment, until eventually, you decided to ask.↵\"Which ancient rule, exactly?\"↵↵The first ghost looked at you for a brief moment, slapped its own face,↵and replied, \"does it matter?\"↵↵Believing it does in fact matter, you decided to take things into your↵own hands.↵↵(press any key to continue)",
"The second ghost jumped for joy. \"More friends in the world beyond,\" it↵wondered excitedly, \"means more friends for me to play with!\"↵↵\"It isn't right for us to take a soul before its time,\" you asserted.↵↵But ghost #2 just yawned. It was no use.↵↵(press any key to continue)",
"\[Placeholder text.]↵↵(press any key to continue)",
"\[Placeholder text.]↵↵(press any key to continue)",
"\[Placeholder text.]↵↵(press any key to continue)",
"\[Placeholder text.]↵↵(press any key to continue)",
"\[Placeholder text.]↵↵(press any key to continue)",
// 8
"\[Placeholder text.]↵↵(press any key to continue)",
"\[Placeholder text.]↵↵(press any key to continue)",
"\[Placeholder text.]↵↵(press any key to continue)",
"\[Placeholder text.]↵↵(press any key to continue)",
"\[Game end.]↵↵(press any key to continue)"
];
g.progress = 0;
pressed = false;

randomize();
exception_unhandled_handler(error);

draw_set_circle_precision(64);

surface_resize(application_surface, 1280, 960);
application_surface_draw_enable(false);

window_set_size(1280, 960);
display_reset(8, true);

audio_play_sound(mus_theme, 0, true);