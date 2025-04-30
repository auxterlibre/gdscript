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
