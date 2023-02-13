/// @description Insert description here
// You can write your code in this editor
global.budget = 100;
global.cost = 0;
global.income = 0;
// TODO: use struct
global.plans = [spr_tile_condo, spr_tile_restaurant];

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
	// Update tiles' display
	for(var i = 0; i < instance_number(obj_tile); i += 1) {
		var tile = instance_find(obj_tile, i);
		if tile.hasChange() && tile.desiredPlan == spr_tile_available {
			tile.sprite_index = tile.desiredPlan;
		} else if tile.hasChange() && array_contains(global.plans, tile.desiredPlan) {
			tile.sprite_index = tile.desiredPlan;
			tile.yield = 5;
		} else if tile.hasChange() && tile.desiredPlan == spr_tile_demolition {
			tile.sprite_index = tile.desiredPlan;
			tile.yield = 0;
			// TODO: add demolition special effect: adjacent tiles buff
		} else if !tile.hasChange() && tile.state() == State.developed {
			tile.yield = max(tile.yield - agingFactor, 1);
		} 
		global.income += tile.yield;
		tile.currentPlan = tile.desiredPlan;
	}
	turn += 1;
}