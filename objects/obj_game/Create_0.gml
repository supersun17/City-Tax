/// @description Insert description here
// You can write your code in this editor
global.budget = 1000;
global.cost = 0;
global.income = 0;
global.plans = [spr_tile_condo, spr_tile_restaurant];

global.buffs = {
	demolition: { yield: 5, lastFor: 5 }
}

enum State {
	undiscover,
	available,
	planned,
	developed
}

agingFactor = 1;
turn = 1;

function next() {
	if global.budget < global.cost {
		show_message("Not enough budget!!!");
		return;
	}
	global.budget -= global.cost;
	global.cost = 0;
	global.budget += global.income;
	global.income = 0;
	
	var tiles = [];
	#region Foundations
	for(var i = 0; i < instance_number(obj_tile); i += 1) {
		var tile = instance_find(obj_tile, i);	
		array_push(tiles, tile.id);
		
		if tile.hasChange() && tile.desiredPlan == spr_tile_available {
			tile.sprite_index = tile.desiredPlan;
		} else if tile.hasChange() && array_contains(global.plans, tile.desiredPlan) {
			tile.sprite_index = tile.desiredPlan;
			tile.yield = 5;
		} else if tile.hasChange() && tile.desiredPlan == spr_tile_demolition {
			tile.sprite_index = tile.desiredPlan;
			tile.yield = 0;
			var adjacentTiles = tile.findAdjacentTiles();
			for(var j = 0; j < array_length(adjacentTiles); j += 1) {
				var adjacentTile = adjacentTiles[j];
				adjacentTile.applyDemolitionBuff();
			}
		} else if !tile.hasChange() && tile.state() == State.developed {
			tile.yield = max(tile.yield - agingFactor, 1);
		} 
		global.income += tile.yield;
		tile.currentPlan = tile.desiredPlan;
	}
	#endregion
	
	#region Buffs
	for(var i = 0; i < array_length(tiles); i += 1) {
		var tile = tiles[i];
		tile.checkoutBuffs();
		global.income += tile.additionalYield;
	}
	#endregion
	
	turn += 1;
}