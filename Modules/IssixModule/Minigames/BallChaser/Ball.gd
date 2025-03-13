tool
extends Control

func _draw():
	draw_circle(Vector2(10.0, 10.0), 10.0, Color("#b2d90a"))

func _process(_delta):
	.set_position(self.get_position()+Vector2(0, 4.0))

