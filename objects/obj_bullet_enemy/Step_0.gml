x += lengthdir_x(shotspeed, image_angle);
y += lengthdir_y(shotspeed, image_angle);

var _boss = instance_nearest(x, y, obj_player);

if (position_meeting(x, y, _boss)) {
	for (var d = 235; d <= 305; d += 35) {
		instance_create_depth(x, y, depth + 1, obj_particle, {
			sprite_index : spr_bullet_player_particle,
			life : 25,
			p_spd : 5,
			p_dir : d
		});
	}
	game_restart();
	instance_destroy();
}