instance_destroy(obj_bullet_enemy);
instance_destroy(obj_bullet_player);
with (obj_player) { x = 640; y = 800; }

g.reading = true;
rfc = 0;

if (g.chapter == 7) {
	if (g.newgrounds) {
		ng_unlockmedal("Clay Pigeon");
	}
}

if (g.chapter == 9) {
	if (g.newgrounds) {
		ng_unlockmedal("Davis & McCardle");
	}
}

if (g.chapter == 11) {
	if (g.newgrounds) {
		ng_unlockmedal("My Blue Friend");
		var _ms = floor(g.tfc * (1000 / 60));
		ng_postScore(14756, _ms);
		ng_postScore(14757, g.deaths);
	}
	g.lore[@ g.chapter] += "↵↵[Time: " + time_string(g.tfc) + "]↵[Deaths: " + string(g.deaths) + "]";
}