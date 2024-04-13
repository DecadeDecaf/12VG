instance_destroy(obj_bullet_enemy);
instance_destroy(obj_enemy);

x = 640; y = 800; dead = false; hearts = 1;

g.chapter--;
g.reading = true;
with (obj_main) { rfc = 0; }