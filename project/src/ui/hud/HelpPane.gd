# HelpPane.gd

extends PanelContainer

signal toggled

onready var toggle_btn: Button = $VBoxContainer/MarginContainerBottom/Toggle


# Called when the node enters the scene tree for the first time.
func _ready():
	toggle_btn.connect("pressed", self, "emit_signal", ["toggled"])
	pass
