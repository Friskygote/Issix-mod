extends WorldEditBase

func _init():
	id = "IssixWorldEdit"
	
func apply(world: GameWorld):
	if(getFlag("IssixModule.Issix_Introduced")):
		world.setRoomSprite("hall_ne_corner", RoomStuff.RoomSprite.PERSON)
