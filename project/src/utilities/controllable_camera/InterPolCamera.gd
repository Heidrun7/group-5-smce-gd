func extern_class_name():
	return "InterPolCamera"
	
export(float, 0, 1, 0.1) var transition_speed := 0.5 
export(float, 0, 1, 0.1) var rotation_speed := 0.5

func interpolate(current, target):
	
	if target == null:
		return

	print(current.transform)
	print("----")
	print(target.transform)
	print("+++++++++++++++++")
	
	var local_origin =  Transform(Basis(), current.get_global_transform().origin)
	var local_basis = Transform(current.get_global_transform().basis, Vector3())
	
	var target_xform = target.get_global_transform()
	
	local_origin = local_origin.interpolate_with(target_xform, transition_speed)
	local_basis = local_basis.interpolate_with(target_xform, rotation_speed)
	current.set_global_transform(Transform(local_basis.basis,local_origin.origin))



