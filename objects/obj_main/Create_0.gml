#macro g global

g.desktop = (os_browser == browser_not_a_browser);
g.filter = true

g.gfc = 0;
lfc = 0;
rfc = 0;

warning = 0;

g.reading = true;
g.chapter = 0;
g.lore = [
"\"@JYMORTAL!@JN\"↵↵An ethereal, deep voice shook the ground beneath the human's feet.↵↵\"@JYYOU HAVE BROKEN AN ANCIENT LAW. PREPARE TO BE JUDGED BY A JURY↵OF YOUR LATE PEERS.@JN\"↵↵The human looked dumbfounded, until they finally inquired, \"huh?\"↵↵Instead of a reply, the human was met with the summoning of twelve↵ghosts before them. These ghosts were to decide the human's fate,↵and among them... was YOU!↵↵(press any key to continue)",
"\"Clearly they're guilty,\" proclaimed ghost #1. \"They broke an ancient rule!\"↵↵You pondered this for a moment, until deciding to ask, \"which ancient↵rule, exactly?\"↵↵The first ghost looked at you for a brief moment, slapped its own face,↵and replied, \"does it matter?\"↵↵Believing it does in fact matter, you decided to take things into your↵own hands.↵↵(press any key to continue)",
"The second ghost jumped for joy. \"More friends in the world beyond,\" it↵wondered excitedly, \"means more friends for me to play with!\"↵↵\"It isn't right for us to take a soul before its time,\" you asserted.↵↵But ghost #2 just yawned. It was no use.↵↵(press any key to continue)",
"You turned to face your summoner. \"Please, oh mighty Medium, fill us in↵on the details of the human's misdeed.\"↵↵The fearsome Medium's voice became oddly shrill and toddler-like. \"@JYTHEY↵TRESPASSED ON MY ANCIENT GARDEN!@JN\"↵↵'Ancient' was right. No flowers grew in this garden; all that existed was↵a sidewalk. You could tell from its wear and tear that it was paved over↵a century ago.↵↵\"Not the garden,\" ghost #3 cried, \"I loved that garden.\"↵↵Ridiculous, you thought.↵↵(press any key to continue)",
"\"Who even cares about some dusty plants?\" The fourth ghost seemed↵over it.↵↵\"FINALLY,\" you celebrated, \"another reasonable ghost! We can't just end↵a mortal's life for walking on some random sidewalk!\"↵↵\"Exactly,\" ghost #4 agreed, \"we SHOULD be punishing them for being a↵lousy tenant!\"↵↵You asked ghost #4 what it meant by this, and you quickly learned that↵ghost #4 used to be the human's landlord. Because of course.↵↵It also lectured you on the importance of 'dodging through bullets,'↵whatever that means.↵↵(press any key to continue)",
"Four stubborn ghosts wouldn't stop you from attempting to save this↵human's life.↵↵\"What about you?\" You asked the fifth ghost, but it ultimately did not↵respond. It didn't even acknowledge you.↵↵(press any key to continue)",
"\"Can we just get this over with?\" Ghost #6 complained, \"I've got a skeet↵shooting tournament to go to.\"↵↵\"Surely a human life is more important than your silly tournament.\"↵↵\"@JYSILLY?@JN\"↵↵You determined that you shouldn't have said 'silly.'↵↵(press any key to continue)",
"\"The afterlife is so much better than the mortal realm anyway,\" ghost #7↵said, \"we'd be doing the human a favor.\"↵↵You gave this line of thinking a few moments to ruminate in your head.↵↵\"Maybe,\" you offered, \"but we'd be stripping them from experiencing the↵rest of their life on Earth. Maybe they're happy here.\"↵↵\"Agree to disagree,\" the seventh ghost stated firmly; it wouldn't budge.↵↵(press any key to continue)",
// 8
"\"Just give it up, human-lover! This human is getting sentenced or my name↵isn't ghost #9!\" The ninth ghost evidently grew very impatient with you.↵↵\"Wait, ghost #9? What happened to ghost #8?\"↵↵\"YOU'RE ghost #8, doofus! Haven't you been paying attention? This whole↵game is a reference to the 1957 film, 12 Angry Men, wherein the protagonist↵is juror number eight.\"↵↵There's no reaching this one, you decided. It was speaking nonsense.↵↵(press any key to continue)",
"\"Does anyone have a REAL reason to accuse the human of guilt?\" You said,↵nearly begging your peers to listen.↵↵\"Yeah! They stole my bike!\" Ghost #10 snarled.↵↵\"Yeah! What ten said!\" Ghost #11 added, in a voice that somehow sounded↵exactly like #10's.↵↵\"Okay, now we're getting somewhere,\" you said, clasping your nonexistent↵hands together. \"But I still don't think that's bad enough to rob the human↵of their otherwise long life.\"↵↵\"Corporal punishment for bike thefts!\"↵↵\"You're thinking of 'capital punishment,' ten,\" the eleventh ghost corrected.↵↵\"Capital punishment for bike thefts!\"↵↵\"Yeah! What ten said!\"↵↵The brain must stop working when one dies, you reasoned.↵↵(press any key to continue)", // 10 and 11
"Faced with complete desparation, you exhaustedly asked ghost #12, \"what↵about you?\"↵↵\"Well, the way I see it, the human has a disgusting blue soul,\" the twelfth↵ghost scoffed, \"just like you, number eight. Maybe if the human's soul was↵purple, I'd give them a chance, but...\"↵↵First off, yikes, you thought. Then, you scrutinized, \"blue? How can you↵even tell? Everything's in black & white, much like old movies from 1957↵particularly.\"↵↵\"I'll show you, my blue friend,\" ghost #12 put forward.↵↵(press any key to continue)",
"After you defeated all eleven of your fellow vengeful ghosts, the human↵carried on with their life. They never forgot about your fight to save↵them.↵↵Seventy years later, they died, and after performing a successful↵heist for number eleven's favorite Ghost Bicycle, they visited you to say↵thank you. You barely even remembered what happened, and you had to↵be reminded about every detail. It was pretty embarrassing.↵↵The end.↵↵[Thank you so much for playing! 12 Vengeful Ghosts was made in less↵than 48 hours for the Ludum Dare 55 compo, with 'Summoning' as its↵theme. All programming, art, writing, music, and sound was created by↵one person within the timeframe.]"
];
g.progress = 0;
pressed = false;

g.tfc = 0;
g.deaths = 0;

randomize();
exception_unhandled_handler(error);

draw_set_circle_precision(64);

surface_resize(application_surface, 1280, 960);
application_surface_draw_enable(false);

window_set_size(1280, 960);
display_reset(8, true);

audio_play_sound(mus_theme, 0, true);
audio_play_sound(mus_theme_focus, -1, true);