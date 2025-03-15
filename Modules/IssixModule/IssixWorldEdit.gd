extends WorldEditBase

func _init():
	id = "IssixWorldEdit"
	
func apply(world: GameWorld):
	world.setRoomSprite("hall_ne_corner", RoomStuff.RoomSprite.PERSON)
