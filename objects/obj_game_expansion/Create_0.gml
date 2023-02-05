global.budget = 100;
global.income = 0;
global.planCost = 0;
// TODO: use struct
global.plans = ["restaurant", "gold mine", "hotel", "school", "bank"];


var centerTile = instance_create_layer(0, 0, "Instances", obj_tile);
var tileWidth = centerTile.sprite_width;
var tileHeight = centerTile.sprite_height;
centerTile.x = (room_width - tileWidth) / 2;
centerTile.y = (room_height - tileHeight) / 2;

var adjacentTileOffsets = [
	[0,-1],[-1,0],[0,1],[1,0]
];
for (var i = 0; i < array_length(adjacentTileOffsets); i += 1) {
	var offset = adjacentTileOffsets[i]
	instance_create_layer(centerTile.x + offset[0] * tileWidth, 
						  centerTile.y + offset[1] * tileHeight,
						  "Instances",
						  obj_tile);	
}