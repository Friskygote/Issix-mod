extends Panel

var dragging = false
var mouse_x: float = 0

signal dragsignal;

func _ready():
	connect("dragsignal",self,"_set_drag_pc")
	
	
func _process(_delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		
		self.rect_position = Vector2(clamp(self.rect_position.x + (mousepos.x -mouse_x), 0, .get_parent().rect_size.x-50), 0)
		mouse_x = mousepos.x

func _set_drag_pc():
	dragging=!dragging


func _on_Panel_gui_input(event):
	print(event)
	
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			mouse_x = get_viewport().get_mouse_position().x
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			emit_signal("dragsignal")
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			self.position = event.get_position()
