#macro g global

g.desktop = (os_browser == browser_not_a_browser);
g.filter = true

g.gfc = 0;
lfc = 0;
rfc = 0;

warning = 0;

g.reading = true;
g.chapter = 8;
g.lore = [
"\"@JYMORTAL!@JN\"↵↵An ethereal, deep voice shook the ground beneath the human's feet.↵↵\"@JYYOU HAVE BROKEN AN ANCIENT LAW. PREPARE TO BE JUDGED BY A JURY↵OF YOUR LATE PEERS.@JN\"↵↵The human looked dumbfounded, until finally replying, \"huh?\"↵↵Instead of a reply, the human was met with the summoning of twelve↵ghosts before them. These ghosts were to decide the human's fate,↵and among them... was YOU!↵↵(press any key to continue)",
"\"Clearly they're guilty,\" proclaimed ghost #1. \"They broke an ancient rule!\"↵↵You pondered this for a moment, until eventually, you decided to ask.↵\"Which ancient rule, exactly?\"↵↵The first ghost looked at you for a brief moment, slapped its own face,↵and replied, \"does it matter?\"↵↵Believing it does in fact matter, you decided to take things into your↵own hands.↵↵(press any key to continue)",
"The second ghost jumped for joy. \"More friends in the world beyond,\" it↵wondered excitedly, \"means more friends for me to play with!\"↵↵\"It isn't right for us to take a soul before its time,\" you asserted.↵↵But ghost #2 just yawned. It was no use.↵↵(press any key to continue)",
"You turned to face your Summoner. \"Please, oh mighty Medium, fill us in↵on the details of the human's misdeed.\"↵↵Oh mighty Medium's voice became oddly shrill and toddler-like. \"@JYTHEY↵TRESPASSED ON MY ANCIENT GARDEN!@JN\"↵↵'Ancient' was right. No flowers grew in this garden; all that existed was↵a sidewalk. You could tell from its wear and tear that it was paved over↵a century ago.↵↵\"Not the garden,\" ghost #3 cried, \"I loved that garden.\"↵↵Ridiculous, you thought.↵↵(press any key to continue)",
"\"Who even cares about some dusty plants?\" The fourth ghost seemed over↵it.↵↵\"FINALLY,\" you celebrated, \"another reasonable ghost! We can't just end↵a mortal's life for walking the sidewalk!\"↵↵\"Exactly,\" ghost #4 agreed, \"we SHOULD be punishing them for being a↵lousy client!\"↵↵You asked ghost #4 what it meant by this, and you quickly learned that↵ghost #4 used to be the human's landlord. Because of course.↵↵(press any key to continue)",
"Four stubborn ghosts wouldn't stop you from attempting to save this↵human's life.↵↵\"What about you?\" You asked the fifth ghost, but it ultimately did not↵respond. It didn't even acknowledge you.↵↵(press any key to continue)",
"\"Can we just get this over with?\" Ghost #6 complained, \"I've got a skeet↵shooting tournament to go to.\"↵↵\"Surely a human life is more important than your silly tournament.\"↵↵\"@JYSILLY?@JN\"↵↵You determined that you shouldn't have said 'silly.'↵↵(press any key to continue)",
"\"The afterlife is so much better than the mortal realm anyway,\" ghost #7↵said, \"we'd be doing the human a favor.\"↵↵You gave this line of thinking a few moments to ruminate in your head.↵↵\"Maybe,\" you offered, \"but we'd be stripping them from experiencing the↵rest of their life on Earth. Maybe they're happy here.\"↵↵\"Agree to disagree,\" the seventh ghost stated firmly; it wouldn't budge.↵↵(press any key to continue)",
// 8
"\"Just give it up, human-lover! This human is getting sentenced or my name↵isn't ghost #9!\" The ninth ghost evidently grew very impatient with you.↵↵\"Wait, ghost #9? What happened to ghost #8?\"↵↵\"YOU'RE ghost #8, doofus! Haven't you been paying attention? This whole↵game is a reference to the 1957 film, 12 Angry Men, wherein the protagonist↵is juror number eight.\"↵↵There's no reaching this one, you decided. It was a lost cause.↵↵(press any key to continue)",
"[Placeholder text.]↵↵(press any key to continue)", // 10 and 11
"[Placeholder text.]↵↵(press any key to continue)",
"[Game end.]↵↵(press any key to continue)"
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