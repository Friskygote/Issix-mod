extends Control

onready var instruction = $GameScreen/Instruction
onready var barzone = $GameScreen/Panel/FailZone
onready var slider = $GameScreen/Panel/FailZone/Slider
onready var spawner = $GameScreen/Spawner
onready var score_data = $Score
onready var progress = $GameScreen/ProgressBar
onready var ball: PackedScene = preload("res://Modules/IssixModule/Minigames/BallChaser/Ball.tscn")

var game_started = false
var tick = 0
var game_time_limit = 20.0
var game_time_left = game_time_limit
var balls = []
var chosen_x = 400
var timer := Timer.new()
var score: int = 0

signal minigameCompleted(result)

# Called when the node enters the scene tree for the first time.
func _ready():
	slider.connect("gui_input", self, "_on_start_game")
	game_started = false
	tick = 0
	balls = []
	slider.set_position(Vector2(slider.get_parent_control().get_rect().get_center().x, slider.get_rect().position.y))

func _on_start_game(event):
	if game_started == false and event is InputEventMouseButton:
		instruction.hide()
		game_started = true
		choose_new_direction()
		add_child(timer)
		timer.wait_time = 0.7
		timer.connect("timeout", self, "_on_timer_timeout")
		timer.start()

func _on_timer_timeout() -> void:
	choose_new_direction()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_started:
		tick += 1
		game_time_left -= delta
		if tick % 3:
			move_spawner(delta)
			spawn_ball()
			if barzone.get_global_rect().intersects(balls[0].get_global_rect()):
				var rateball = balls.pop_front()
				calculate_score(rateball.get_global_rect().get_center().x)
				rateball.queue_free()
			update_time_bar(game_time_left / game_time_limit)
		if game_time_left <= 0:
			end_game()

func end_game():
	emit_signal("minigameCompleted", score)
	game_started = false

func update_time_bar(val: float):
	progress.value = clamp(val, 0.0, 1.0)

func calculate_score(ball_x: float):
	print(str(slider.get_global_rect().get_center().x ) + " " + str(ball_x))
	var distance_diff = abs(slider.get_global_rect().get_center().x - ball_x)
	score += int(clamp(15-distance_diff, 0, 15))
	score_data.parse_bbcode("Current score: [b]"+str(score)+"[/b]")

func choose_new_direction():
	timer.wait_time = RNG.randf_range(0.4, 0.9)
	chosen_x = RNG.randi_range(0, $GameScreen/Panel/FailZone.rect_size.x)

func move_spawner(delta):
	spawner.rect_position = spawner.rect_position.linear_interpolate(Vector2(chosen_x, spawner.rect_position.y), delta * 3.5)

func spawn_ball():
	var new_ball: Control = ball.instance()
	new_ball.visible = true
	new_ball.set_position(spawner.rect_position)
	balls.append(new_ball)
	.add_child(new_ball)
	move_child(new_ball, 1)
