if (cycles && cycle == 4) {
	cycle = 5;
	firerate = 42;
	shotspeed = 22;
	cooldown = 21;
	alarm[2] = 160;
} else if (cycles && cycle == 5) {
	cycle = 6;
	firerate = 12;
	shotspeed = 8;
	alarm[2] = 180;
} else if (cycles && cycle == 6) {
	cycle = 7;
	firerate = 36;
	shotspeed = 10;
	cooldown = 18;
} else if (cycles && cycle == 8) {
	var _enemy2 = instance_create_depth(840, 300, depth, obj_enemy);
	_enemy2.sprite_index = spr_enemy_10;
	_enemy2.max_hp = 13;
	_enemy2.hp = 13;
	_enemy2.movespd = 5;
	_enemy2.moverate = 75;
	_enemy2.firerate = 26;
	_enemy2.shotspeed = 7;
	_enemy2.shaky = true;
	_enemy2.cooldown = 103;
	_enemy2.box_offset = 40;
	_enemy2.spawned = true;
}