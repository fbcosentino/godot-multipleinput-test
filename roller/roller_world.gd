extends Node3D

@onready var sphere = $Sphere

func apply_relative(rel: Vector2):
	sphere.rotate(Vector3.UP, rel.x*0.005)
	sphere.rotate(Vector3.RIGHT, rel.y*0.005)
