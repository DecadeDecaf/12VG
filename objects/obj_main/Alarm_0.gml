instance_destroy(obj_bullet_enemy);
instance_destroy(obj_bullet_player);
with (obj_player) { x = 640; y = 800; }

g.reading = true;
rfc = 0;

if (g.chapter == 11) {
	g.lore[@ g.chapter] += "↵↵[Time: " + time_string(g.tfc) + "]↵[Deaths: " + string(g.deaths) + "]";
}