var _up = (keyboard_check(ord("W")) || keyboard_check(vk_up));
var _down = (keyboard_check(ord("S")) || keyboard_check(vk_down));
var _left = (keyboard_check(ord("A")) || keyboard_check(vk_left));
var _right = (keyboard_check(ord("D")) || keyboard_check(vk_right));

var _shoot = (keyboard_check(ord("Z")) || keyboard_check(ord("J")) || keyboard_check(vk_space));
var _dash = (keyboard_check(ord("X")) || keyboard_check(ord("K")) || keyboard_check(vk_control));
var _shift = (keyboard_check(ord("C")) || keyboard_check(ord("L")) || keyboard_check(vk_shift));

if (!happy) {
	if (image_index == 0) {
		if (_up || _down || _left || _right) {
			happy = true;
		}
	} else if (image_index == 1) {
		if (_shoot) {
			happy = true;
		}
	} else if (image_index == 2) {
		if (_dash) {
			happy = true;
		}
	} else if (image_index == 3) {
		if (_shift) {
			happy = true;
		}
	}
} else {
	fade += 0.025;
	if (fade > 3) {
		happy = false;
		fade = 0;
		if (image_index < 3) {
			image_index++;
		} else {
			with (obj_main) { alarm[0] = 45; }
			instance_destroy();
		}
	}
}