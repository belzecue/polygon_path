
static func intersect_with(gm_path, camera, screen_point):
	var from = camera.project_ray_origin(screen_point)
	var to = camera.project_ray_normal(screen_point) * 50
	var plane = _get_path_plane(gm_path)
	return plane.intersects_ray(from, to)

static func _get_path_plane(gm_path):
	var t = gm_path.get_global_transform()
	var a = t.basis.x
	var b = t.basis.z
	var c = a + b
	return Plane(a, b, c)