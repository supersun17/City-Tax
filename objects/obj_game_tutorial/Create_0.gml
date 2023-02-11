/// @description Insert description here
// You can write your code in this editor
global.budget = 100;
global.cost = 0;
global.income = 0;
// TODO: use struct
global.plans = [spr_plan_condo, spr_plan_restaurant];

agingFactor = 0.1;
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
	// Update tiles' state and yield
	for(var i = 0; i < instance_number(obj_tile); i += 1) {
		var tile = instance_find(obj_tile, i);
		switch tile.state {
			case State.planned:
				tile.state = State.developed;
				tile.updateColor();
				tile.yield = 5;
				break;
			case State.developed:
				tile.yield = max(tile.yield - agingFactor, 1);
				break;
			default:
				break;
		}
		global.income += tile.yield;
		tile.hasChange = false;
	}
	turn += 1;
}