#
#  Entry.gd
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

export var main_scene: PackedScene = null

onready var _header: Label = $Header
onready var _log: RichTextLabel = $Log
onready var _button: Button = $Button

var error: String = ""
var devTool =  preload("res://printScript.tscn").instance()

# Function to be able to set user custom directory with environment
func _ready():
	var custom_dir = OS.get_environment("SMCEGD_USER_DIR")
	if custom_dir != "":
		print("Custom user directory set")
		if !Global.set_user_dir(custom_dir):
			return _error("Failed to setup custom user directory")
	
	_button.connect("pressed", self, "_on_clipboard_copy")
	print("Reading version file..")
	var file = File.new()
	var version = "unknown"
	var exec_path = OS.get_executable_path()
	if file.open("res://share/version.txt", File.READ) == OK:
		version = file.get_as_text()
		file.close()
		
# Checks version support
	Global.version = version

	OS.set_window_title("SMCE-gd: %s" % version)
	print("Version: %s" % version)
	print("Executable: %s" % exec_path)
	print("Mode: %s" % "Debug" if OS.is_debug_build() else "Release")
	print("User dir: %s" % Global.user_dir)
	print()
	
# Error handling on loading resources
	var dir = Directory.new()
	
	if dir.open("res://share/RtResources") != OK:
		return _error("Internal RtResources not found!")
	
	if ! Util.copy_dir("res://share/RtResources", Global.usr_dir_plus("RtResources")):
		return _error("Failed to copy in RtResources")
	
	if ! Util.copy_dir("res://share/library_patches", Global.usr_dir_plus("library_patches")):
		return _error("Failed to copy in library_patches")
	
	Util.mkdir(Global.usr_dir_plus("mods"))
	Util.mkdir(Global.usr_dir_plus("config/profiles"), true)
	
	print("Copied RtResources")

	var bar = Toolchain.new()
	if ! is_instance_valid(bar):
		return _error("Shared library not loaded")
	
	var res = bar.init(Global.user_dir)
	if ! res.ok():
		return _error("Unsuitable environment: %s" % res.error())
	print(bar.resource_dir())
	bar.free()
	
	Global.scan_named_classes("res://src")
	
# somehow destroys res://
	ModManager.load_mods()
	
	var treeFile = File.new()
	var tree = get_tree().get_root()

	treeFile.open("res://src//devTree2.txt", File.WRITE)
	var parent_id=0
	var child_id=0
	devTool.print_tree_pretty_custom(treeFile, tree,  "", true, parent_id, child_id)
	
	treeFile.close()
	
	_continue()
 
#func print_tree_pretty_custom(file: File, node: Node, prefix: String, last: bool) -> void:
#	var new_prefix = " ┖╴" if last else " ┠╴"
#	file.store_string(prefix + new_prefix + node.get_name() + "\n")
#	var children = node.get_children()
#	for i in range(children.size()):
#		new_prefix = "   " if last else " ┃ "
#		print_tree_pretty_custom(file, children[i], prefix + new_prefix, i == (children.size() - 1))
	
		
# Check if main scene exist or not
func _continue():
	if ! main_scene:
		return _error("No Main Scene")
	get_tree().change_scene_to(main_scene)

# Function to report log file successful or not
func _error(message: String) -> void:
	var file: File = File.new()
	var result = file.open("user://logs/godot.log", File.READ)
	var logfile = file.get_as_text()
	file.close()

	_log.text = logfile
	_header.text += "\n" + message
	error = "Error Reason: " + message + "\n" + logfile

# Checks if clipboard error
func _on_clipboard_copy() -> void:
	OS.clipboard = error
