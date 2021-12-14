extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func print_tree_pretty_custom(file: File, node: Node, prefix: String, last: bool, parent_id: int, child_id: int) -> void:
	#write hierarchy tree normal
	#var new_prefix = " ┖╴" if last else " ┠╴"
	#file.store_string(prefix + new_prefix + node.get_name() + "\n")
	#var children = node.get_children()
	#for i in range(children.size()):
		#new_prefix = "   " if last else " ┃ "
		#print_tree_pretty_custom(file, children[i], prefix + new_prefix, i == (children.size() - 1))
	
	#write hiearchy tree graphviz
	#var parent_id = id+1
		#var id1 = id+1
	
	file.store_string("dot.node('"+ str(child_id) + "', '" + node.get_name() + "')\n")
	var children = node.get_children()
	
	if parent_id != child_id:
		file.store_string("dot.edge('" + str(parent_id) + "' , '" + str(child_id) + "')\n") 
	
	parent_id = parent_id+1	
	
	print(children.size())
	print(node.get_name())
	print(children)

	for i in range(children.size()):
		child_id = child_id + 1			
		print_tree_pretty_custom(file, children[i], "", i == (children.size() - 1), parent_id, child_id)

	#run python script
	var global_dir_path = ProjectSettings.globalize_path("res://")
	var ERR = OS.execute("python", [global_dir_path + "/helloworld.py"], true)
		#if ERR == OK:
		 #   get_token_from_JSON()
		#else:
		 #   push_error("ERROR EXECUTING 'get_credentials.py' WITH ERROR CODE: %s"%ERR)
