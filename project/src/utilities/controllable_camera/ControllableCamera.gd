#
#  ControllableCamera.gd
#  Copyright 2021 ItJustWorksTM
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

class_name ControllableCamera
extends Spatial

var rot_x = 0
var rot_y = 0
var lookaround_speed = 0.01

#CamController Stuff
signal cam_locked
signal cam_freed

var locked_cam: Spatial = null

export(NodePath) var inter_path: NodePath

var locked = null
#Cam controller stuff ends

var isLocked = false

export(int, 5, 100, 1) var scroll_limit_low = 5
export(int, 5, 100, 1) var scroll_limit_high = 20

const Inter_pol = preload("InterPolCamera.gd")
onready var inter_pol = Inter_pol.new()

const Free_Cam = preload("FreeCam.gd")
onready var free_cam = Free_Cam.new()

export(int, 0, 90) var y_angle_limit = 20 setget set_y_angle_limit
var _y_angle_limit = 0
func set_y_angle_limit(limit: float) -> void:
	if !isLocked:
		free_cam.set_y_angle_limit(limit)
		return
		
	_y_angle_limit = range_lerp(limit, 0, 90, 0, PI/2)
	y_angle_limit = y_angle_limit
	_update_pos()

var _zoom = 9

var target: Spatial = null setget set_target, get_target
func set_target(trgt: Spatial) -> void:	
	if is_instance_valid(target):
		target.queue_free()
		target = null
		set_process(false)
	
	if is_instance_valid(trgt):
		target = Spatial.new()
		trgt.add_child(target)
		set_process(true)
	
	_update_pos()


func get_target():
	return target.get_parent() if is_instance_valid(target) else null


func _unhandled_input(event: InputEvent) -> void:
	if !isLocked && free_cam != null:
		free_cam.unhandled_input(event)
		return
		
	
	_zoom += 0.5 * int(event.is_action("scroll_down")) - int(event.is_action("scroll_up"))
	_zoom = clamp(_zoom, scroll_limit_low, scroll_limit_high)
	
	
	if event is InputEventMouseMotion and Input.is_action_pressed("mouse_left"):

		rot_x -= event.relative.x * lookaround_speed
		rot_y -= event.relative.y * lookaround_speed
		_update_pos()


func _update_pos():
	if !isLocked:
		free_cam.update_pos()
		return
		
	rot_y = clamp(rot_y, _y_angle_limit, PI - _y_angle_limit)
	if is_instance_valid(target):
		target.transform.basis = Basis(Quat(Vector3(rot_y, rot_x, 0)))


func _ready():
	set_y_angle_limit(y_angle_limit)
	_update_pos()


func _process(delta: float) -> void:
	if ! is_instance_valid(target):
		set_process(false)
		return
	global_transform.origin = target.global_transform.origin + target.global_transform.basis.xform((Vector3.UP) * _zoom)
	look_at(target.global_transform.origin, Vector3.UP)

#cam controller stuff	

func lock_cam(node: Spatial) -> void:
	if ! is_instance_valid(node) || ! node.is_inside_tree():
		return
	isLocked = true
	locked_cam.set_target(node)
	inter_path = locked_cam.get_path()
	free_cam.set_disabled(true)
	emit_signal("cam_locked", node)
	locked = node
	if ! node.is_connected("tree_exiting", self, "_on_free"):
		node.connect("tree_exiting", self, "_on_free", [node])


func free_cam() -> void:
	if free_cam == null:
		free_cam = Free_Cam.new()
		
	isLocked = false
	free_cam.set_disabled(false)
	free_cam.transform = locked_cam.transform
	emit_signal("cam_freed")
	if is_instance_valid(locked):
		locked.disconnect("tree_exiting", self, "_on_free")
	locked = null


func set_cam_position(transform: Transform = Transform()) -> void:
	free_cam()
	locked_cam.global_transform = transform
	free_cam.global_transform = transform
	self.global_transform = transform


func _on_free(node) -> void:
	if node == locked:
		free_cam()

func _physics_process(delta):
	
	if !isLocked && free_cam != null:
		free_cam.physics_process(delta)
		self.global_transform = free_cam.transform
		return
		
	if inter_path == "":
		return
	
	
	inter_pol.interpolate(self,self.get_node(inter_path) as Node)
