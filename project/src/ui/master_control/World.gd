#
#  World.gd
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

extends Node

var world_name = null
var world: Spatial = null

var debug_car: Spatial = null
var vehicle_spawn_pos = null

onready var ctrl_cam: ControllableCamera = $Camera


#Function to be able to spawn a debug-car in the world.
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_car_spawn"):
		if debug_car:
			debug_car.queue_free()
		debug_car = preload("res://src/objects/ray_car/RayCar.tscn").instance()
		add_child(debug_car)
		debug_car.global_transform.origin = Vector3(0,3,0)
	
	if event.is_action_pressed("debug_car_cam") and debug_car:
		if ctrl_cam.locked == debug_car:
			ctrl_cam.free_cam()
		else:
			ctrl_cam.lock_cam(debug_car)


func _ready() -> void:
	DebugCanvas.disabled = true
	_setup_cams()


#Set-up for the different cameras to follow the car.
func _setup_cams() -> void:
	ctrl_cam.locked_cam = $Camera/LockedCam
	ctrl_cam.free_cam = $Camera/FreeCam
	ctrl_cam.interp_cam = $Camera/InterPolCamera


#Creating a world from a given scene.
func load_world(scene: PackedScene) -> bool:
	yield(get_tree(), "idle_frame")
	var instance = scene.instance()
	if is_instance_valid(instance):
		yield(clear_world(), "completed")
		
		add_child(instance)
		world = instance
		
		if world.has_method("init_cam_pos"):
			ctrl_cam.set_cam_position(world.init_cam_pos())
		else:
			ctrl_cam.set_cam_position()
			
		if world.has_method("init_vehicle_pos"):
			vehicle_spawn_pos = world.init_vehicle_pos()
		else:
			vehicle_spawn_pos = Vector3(0,3,0)
		
		return true
	return false


#Removes the current world (scene).
func clear_world() -> void:
	yield(get_tree(), "idle_frame")
	if is_instance_valid(world):
		world.queue_free()
		
		if world.is_inside_tree():
			yield(world, "tree_exited")


func to_dict() -> Dictionary:
	return { "environment": world_name }
