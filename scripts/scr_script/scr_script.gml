function draw_script() {
	var _txt = g.lore[@ g.chapter];
	var _prog = floor(g.progress);
	var _ogx = 32;
	var _ogy = 48;
	var _xx = _ogx;
	var _yy = _ogy;
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_font);
	draw_set_color(#DECEED);
	draw_set_alpha(1);
	var _jiggle = false;
	for (var i = 0; i < _prog; i++) {
		var _symb = string_char_at(_txt, i + 1);
		var _next = [];
		for (var ii = 2; ii < 5; ii++) {
			array_push(_next, string_char_at(_txt, i + ii));
		}
		if (_symb == "@") {
			if (_next[@ 0] == "J") {
				if (_next[@ 1] == "Y") {
					_jiggle = true;
				} else if (_next[@ 1] == "N") {
					_jiggle = false;
				}
			}
			i += 2;
		} else if (_symb == "↵") {
			_xx = _ogx;
			_yy += 38;
		} else {
			var _xoff = 0;
			var _yoff = 0;
			if (_jiggle) {
				_xoff += random_range(-1.25, 1.25);
				_yoff += random_range(-1.25, 1.25);
			}
			var _ww = ceil(string_width(_symb));
			if (_symb == "'") {
				_ww /= 1.5;
				_xx -= _ww / 2.5;
			}
			draw_text_transformed(_xx + _xoff, _yy + _yoff, _symb, 1, 1, 0);
			_xx += _ww;
		}
	}
	draw_set_alpha(1);
}