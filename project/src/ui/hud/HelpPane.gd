# HelpPane.gd

extends PanelContainer

signal toggled

onready var toggle_btn: Button = $VBoxContainerToggle/MarginContainerToggle/Toggle
onready var buttonHome: Button = $VBoxContainer/ButtonHome
onready var buttonCompile: Button = $VBoxContainer/ButtonCompile
onready var buttonConfiguration: Button = $VBoxContainer/ButtonConfiguration
onready var buttonModding: Button = $VBoxContainer/ButtonModding
onready var buttonCapabilitites: Button = $VBoxContainer/ButtonCapabilities


# Called when the node enters the scene tree for the first time.
func _ready():
	toggle_btn.connect("pressed", self, "emit_signal", ["toggled"])
	buttonHome.connect("pressed", self, "_buttonHome_pressed")
	buttonCompile.connect("pressed", self, "_buttonCompile_pressed")
	buttonConfiguration.connect("pressed", self, "_buttonConfiguration_pressed")
	buttonModding.connect("pressed", self, "_buttonModding_pressed")
	buttonCapabilitites.connect("pressed", self, "_buttonCapabilitites_pressed")
	
	
	pass


func _buttonHome_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki")
	

func _buttonCompile_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki/Compiling-a-sketch")


func _buttonConfiguration_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki/Configuration")


func _buttonModding_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki/Modding")


func _buttonCapabilitites_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki/Vehicle-Capabilities")


