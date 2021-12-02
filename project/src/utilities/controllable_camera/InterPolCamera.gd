func extern_class_name():
	return "InterPolCamera"
	
export(float, 0, 1, 0.1) var transition_speed := 0.5 
export(float, 0, 1, 0.1) var rotation_speed := 0.5
export(float, 0, 10, 0.1) var offset := 5

func interpolate(current, target):
	
	if target == null:
		return
	
	var local_origin =  Transform(Basis(), current.get_global_transform().origin)
	#var local_basis = Transform(current.get_global_transform().basis, Vector3())
	
	var target_xform = target.get_global_transform()
	
	var locTarVec = local_origin.origin - target_xform.origin
	var normLocTarVec = locTarVec.normalized()
	var offsetVec = normLocTarVec * offset
	target_xform.origin += offsetVec
	
	local_origin = local_origin.interpolate_with(target_xform, transition_speed)
	#local_basis = local_basis.interpolate_with(target_xform, rotation_speed)
	current.set_global_transform(Transform(current.transform.basis,local_origin.origin))



