if ((mouse_x >= 32 && mouse_x <= 718 && mouse_y >= 908 && mouse_y <= 936) || sliding) {
	if (!sliding && mouse_check_button_pressed(mb_left)) {
		sliding = true;
	} else if (sliding && mouse_check_button_released(mb_left)) {
		sliding = false;
	}
	if (sliding) {
		volume -= (volume - ((mouse_x - 32) / 682)) / 4;
		volume = median(0, volume, 1);
		audio_master_gain(volume);
	}
}