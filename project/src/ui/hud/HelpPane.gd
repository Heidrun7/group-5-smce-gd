# HelpPane.gd

extends PanelContainer

signal toggled

onready var toggle_btn: Button = $VBoxContainerToggle/MarginContainerToggle/Toggle
onready var button1: Button = $VBoxContainer/Button1
onready var button2: Button = $VBoxContainer/Button2
onready var button3: Button = $VBoxContainer/Button3
onready var button4: Button = $VBoxContainer/Button4
onready var button5: Button = $VBoxContainer/Button5
onready var button6: Button = $VBoxContainer/Button6
onready var button7: Button = $VBoxContainer/Button7
onready var button8: Button = $VBoxContainer/Button8
onready var button9: Button = $VBoxContainer/Button9


# Called when the node enters the scene tree for the first time.
func _ready():
	toggle_btn.connect("pressed", self, "emit_signal", ["toggled"])
	button1.connect("pressed", self, "_button1_pressed")
	button2.connect("pressed", self, "_button2_pressed")
	button3.connect("pressed", self, "_button3_pressed")
	button4.connect("pressed", self, "_button4_pressed")
	button5.connect("pressed", self, "_button5_pressed")
	button6.connect("pressed", self, "_button6_pressed")
	button7.connect("pressed", self, "_button7_pressed")
	button8.connect("pressed", self, "_button8_pressed")
	button9.connect("pressed", self, "_button9_pressed")
	
	
	pass


func _button1_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki")

func _button2_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki/Arch-based-Linux-setup")
	

func _button3_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki/Compiling-a-sketch")


func _button4_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki/Configuration")


func _button5_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki/Debian-based-Linux-setup")


func _button6_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki/MacOS-setup")


func _button7_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki/Modding")


func _button8_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki/Vehicle-Capabilities")


func _button9_pressed():
	OS.shell_open("https://github.com/ItJustWorksTM/smce-gd/wiki/Windows-setup")



