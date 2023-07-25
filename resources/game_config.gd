extends Resource
class_name GameConfig

const FILE_NAME := "user://games.tres"

var game = GlobalInfo.new()

func save_config():
	var result = ResourceSaver.save(self, FILE_NAME)
	assert(result == OK)


static func load_config():
	if ResourceLoader.exists(FILE_NAME):
		load(FILE_NAME)
	return null


#static func save_config_json():
#	var file = FileAccess.open(FILE_NAME, FileAccess.WRITE)
#	file.store_string()
#
#static func load_config_json():
#	if FileAccess.file_exists(FILE_NAME):
#		var file = FileAccess.open(FILE_NAME, FileAccess.READ)
#		var content = file.get_as_text()
#		return content

