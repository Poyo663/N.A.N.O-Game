import os

os.chdir("Levels")
levels = os.listdir(os.getcwd())
os.chdir("..")

levelManager = open("Scripts/level_manager.gd", "r")

lines = levelManager.readlines()
currentLineDecrement = 0

for i in range(7, len(lines)):
    if lines[i + currentLineDecrement] == "]\n":
        break

    lines.pop(i + currentLineDecrement)
    currentLineDecrement -= 1

currentLineIncrement = 0
for level in levels:
    lines.insert(7 + currentLineIncrement, f'\t"res://Levels/{level}",\n')
    currentLineIncrement += 1

levelManager.close()

levelManager = open("Scripts/level_manager.gd", "w")
levelManager.writelines(lines)
