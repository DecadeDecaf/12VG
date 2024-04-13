var w = camera_get_view_width(camera)
var h = camera_get_view_height(camera)

x += (lookx - x) / 24
y += (looky - y) / 24

var midw = (w / 2)
var midh = (h / 2)

var camX = median(midw, x, room_width - midw)
var camY = median(midh, y, room_height - midh)

x = camX
y = camY

var vm = matrix_build_lookat(camX, camY, -10, camX, camY, 0, 0, 1, 0)
camera_set_view_mat(camera, vm)