extends WorldEditBase

func _init():
	id = "PierreWorldEdit"
	
func apply(world: GameWorld):
	if(getFlag("PierreModule.Pierre_Introduced")):
		world.setRoomSprite("hall_ne_corner", RoomStuff.RoomSprite.PERSON)
