extends WorldEditBase

func _init():
	id = "AzazelWorldHack"
	isRegular = true

# This here is a hack to do something after MainScene applies Minimap changes for blindfold which cannot be changed in event/scene because they are hard overwritten later by MainScene in updateThings(). THIS IS NOT HOW IT SHOULD BE but Game should have a way to modders to better manipulate those effects

func apply(world: GameWorld):
	if GM.pc.getLocation().begins_with("petsdream_cellblock_corridor_part"):
		var room_id = int(GM.pc.getLocation().substr(33))
		if room_id > 1 and room_id < 17:
			world.setDarknessVisible(true)
			world.setDarknessSize(int(lerp(100, 8, room_id/17.0)))
		elif room_id == 1:
			world.setDarknessVisible(false)
