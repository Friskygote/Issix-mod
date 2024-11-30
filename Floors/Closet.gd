extends SubGameWorld



func _on_Closet_onEnter(room):
	room.addButton("Leave", "Leave the closet", "leave")


func _on_Closet_onReact(_room, key):
	if(key == "leave"):
		GM.pc.setLocation("med_lobbynw")
		GM.main.reRun()
