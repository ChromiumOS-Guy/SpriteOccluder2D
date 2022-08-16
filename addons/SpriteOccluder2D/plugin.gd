tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("SpriteOccluder", "Sprite", preload("res://addons/SpriteOccluder2D/SpriteOccluder2D.gd"), preload("res://addons/SpriteOccluder2D/Sprite_Icon.png"))
	add_custom_type("AnimatedSpriteOccluder", "AnimatedSprite", preload("res://addons/SpriteOccluder2D/AnimatedSpriteOccluder2D.gd"), preload("res://addons/SpriteOccluder2D/AnimatedSprite_Icon.png"))


func _exit_tree():
	remove_custom_type("SpriteOccluder")
	remove_custom_type("AnimatedSpriteOccluder")
