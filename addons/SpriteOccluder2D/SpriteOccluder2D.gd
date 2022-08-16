extends Sprite

var image : Image = Image.new()
var bitmap = BitMap.new()

export (int, 0 , 20) var epsilon : int = 0 # for best results
export var smoothing_experimental: bool = false

func _ready():
	if self.texture != null:
		if self.centered: # disables centered
			self.centered = false
		image.load(self.texture.resource_path)
		bitmap.create_from_image_alpha(image)
		var polygons = bitmap.opaque_to_polygons(Rect2(Vector2(0, 0), bitmap.get_size()),epsilon)
		if smoothing_experimental:
			polygons = SmoothingThreshold(polygons,1.0)
		for polygon in polygons:
			var LightOccluder : LightOccluder2D = LightOccluder2D.new()
			var OccluderPolygon = OccluderPolygon2D.new()
			OccluderPolygon.polygon = polygon
			LightOccluder.occluder = OccluderPolygon
			LightOccluder.light_mask = self.light_mask
			add_child(LightOccluder)


func SmoothingThreshold(polygons: Array, noise_threshold: float) -> Array: # simple algoritem for filtering out noise 
	var smooth_polygons : Array = []
	for polygon in polygons:
		var smooth_polygon : PoolVector2Array = []
		for point in polygon.size():
			var front_point = (polygon as PoolVector2Array)[point - 1]
			var current_point = (polygon as PoolVector2Array)[point]
			var back_point = (polygon as PoolVector2Array)[(point + 1) if (point + 1) < polygon.size() else -1]
			var modifed_point = Vector2(0,0)
			var back_margin_y = margin(current_point.y , back_point.y)
			var back_margin_x = margin(current_point.x , back_point.x)
			var front_margin_y = margin(current_point.y , front_point.y)
			var front_margin_x = margin(current_point.x , front_point.x)
			
			if current_point.x == back_point.x: # check if point is too near its back point
				if back_margin_y <= noise_threshold:
					modifed_point.y = back_point.y
			if current_point.y == back_point.y:
				if back_margin_x <= noise_threshold:
					modifed_point.x = back_point.x
			
			if current_point.x == front_point.x:# check if point is too near its front point
				if front_margin_y <= noise_threshold:
					modifed_point.y = front_point.y
			if current_point.y == front_point.y:
				if front_margin_x <= noise_threshold:
					modifed_point.x = front_point.x
			
			if modifed_point.x == 0: # incase point didn't get modifed we still want to add current point
				modifed_point.x = current_point.x
			if modifed_point.y == 0:
				modifed_point.y = current_point.y
			smooth_polygon.push_back(modifed_point)
		smooth_polygons.push_back(smooth_polygon)
	return smooth_polygons


func margin(a: float , b: float): # simple function  for making the coe above cleaner
	var c = a - b
	if c < 0:
		c = c * -1
	return c
