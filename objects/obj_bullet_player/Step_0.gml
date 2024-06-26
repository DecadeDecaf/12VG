y -= shotspeed;

var _boss = instance_nearest(x, y, obj_enemy);

if (place_meeting(x, y, _boss)) {
	for (var d = 235; d <= 305; d += 35) {
		instance_create_depth(x, y, depth + 1, obj_particle, {
			sprite_index : spr_bullet_player_particle,
			life : 25,
			p_spd : 5,
			p_dir : d
		});
	}
	_boss.hp -= dmg;
	audio_sound_pitch(snd_hit, random_range(0.95, 1.05))
	audio_play_sound(snd_hit, 2, false);
	instance_destroy();
}

if (y < -128) {
	instance_destroy();
}