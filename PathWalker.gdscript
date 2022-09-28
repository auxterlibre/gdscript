class_name PathWalker
extends KinematicBody2D

onready var nav_agent:NavigationAgent2D = $NavigationAgent

var max_speed:float = 200.0
var acceleration:float = 500.0

var _velocity:Vector2 = Vector2.ZERO
var _look_direction:Vector2 = Vector2.DOWN
var _move_angle:float = 0
var _direction_x:int = 0
var _direction_y:int = 0
var _target_pos:Vector2
var _path:PoolVector2Array
var _is_at_destination:bool


func _ready():
	_target_pos = global_position


func _physics_process(_delta):
	if _path.size() > 0:
		var dist_to_next_point:float = position.distance_to(_path[0])
		if dist_to_next_point > 5.0:
			_target_pos = _path[0]
		else:
			_path.remove(0)
	
	_velocity = position.direction_to(_target_pos) * max_speed
	if position.distance_to(_target_pos) > 2.0:
		_is_at_destination = false
		_velocity = move_and_slide(_velocity)
	else:
		if _path.size() == 0 and !_is_at_destination:
				set_position(position)
				on_destination_reached()
	
	update_animation(_velocity)


func set_target_pos(value:Vector2):
	_target_pos = value
	nav_agent.set_target_location(value)


func set_position(pos:Vector2):
	_target_pos = pos
	position = pos
	var _p = _path.empty()
	_velocity = Vector2.ZERO


func set_path(new_path:PoolVector2Array):
	_path = new_path


func find_path_to(pos:Vector2):
	Signals.emit_signal(Signals.EVT_PATH_REQUESTED, self, pos)
	

func on_destination_reached():
	_is_at_destination = true


func update_animation(_vel:Vector2):
	pass
