extends Node2D

signal on_level_pass()

# para mudar de nivel use
# emit_signal("on_level_pass")

var currentLevelNumber = 0
# não mecha nesse variável, essa variável deve ser preenchida apenas por script
const levelPaths: Array[String] = [
	"res://Levels/level_1.tscn",
]
var currentLevel = preload(levelPaths[0]).instantiate()


func _ready():
	add_child(currentLevel)
	connect("on_level_pass", _on_level_pass)

func _on_level_pass():
	currentLevelNumber += 1
	remove_child(currentLevel)
	currentLevel = load(levelPaths[currentLevelNumber]).instantiate()
	add_child(currentLevel)
