extends Node2D

signal on_level_pass()

var currentLevelNumber = 0
# não mecha nesse variável, essa variável deve ser preenchida apenas por script
const levelPaths: Array[String] = [ 
	"res://Levels/level_1.tscn",
]

var currentLevel = preload(levelPaths[0])
