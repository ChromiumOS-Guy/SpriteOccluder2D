# postponed until further notice

Due to a predicament I won't be able to work on this project for a while

# SpriteOccluder2D
SpriteOccluder2D is a godot plugin that adds special sprites that act like LightOccluders
SpriteOccluder2D adds two node types
SpriteOccluder and AnimatedSpriteOccluder
both calculate a LightOccluder2D
on runtime

Just use SpriteOccluder as a normal Sprite
and AnimatedSpriteOccluder as a normal AnimatedSprite

Epsilon is accuracy
the lower it is the more accuracte but the lower it is
the more resource intensive it is

Smoothing Experimental is by default off
Its a simple algorithm that checks to see if 
theres a point in polygon that is to close to its neighbors
if it is it snaps it inside its neighbors

it uses:
```GDScript
bitmap.create_from_image_alpha(image)
bitmap.opaque_to_polygons()
```
to create a polygon which later get used inside a LightOccluder2D
if theres more then one polygon then it creates more LightOccluder2D's
and then deletes them next frame


# Warning ⚠️

Currently does not support rotation

You can't rotate without breaking

the shadow
