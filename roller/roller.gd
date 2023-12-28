extends ReferenceRect

@onready var roller_world = $SubViewportContainer/SubViewport/RollerWorld

func apply_relative(rel:Vector2):
	roller_world.apply_relative(rel)
