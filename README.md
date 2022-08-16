# SpriteOccluder2D
SpriteOccluder2D is a godot plugin that adds special sprites that act like LightOccluders
tthe adds two node types
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
```GDscript
bitmap.opaque_to_polygons
```
