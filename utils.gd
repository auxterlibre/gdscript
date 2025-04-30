static func list_files_in_directory(path):
	var files:Array = []
	var dir := DirAccess.open(path)
	if dir:
		if dir.list_dir_begin() == OK:
			while true:
				var file = dir.get_next()
				if file == "":
					break
				elif not file.begins_with("."): # This would be a directory
					files.append(file)
			dir.list_dir_end()
		else:
			print("Could not open the directory " + path)
	else:
		print("Could not load the path " + path)
	return files


static func get_rand_pos_in_circunference(p_center:Vector2, p_radius:float) -> Vector2:
	var angle_offset = randi() % 360
	var angle = ( (PI*2.0) / 8) + angle_offset;
	var direction = Vector2(cos(angle), sin(angle))
	var new_pos = p_center + direction * p_radius
	return new_pos
