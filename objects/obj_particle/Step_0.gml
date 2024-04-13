x += lengthdir_x(p_spd, p_dir);
y += lengthdir_y(p_spd, p_dir);

p_spd /= 1.15;

image_xscale -= 0.075;
image_yscale -= 0.075;

if (image_xscale <= 0) { image_xscale = 0; }
if (image_yscale <= 0) { image_yscale = 0; }

life--;

if (life <= 0) {
	instance_destroy();
}