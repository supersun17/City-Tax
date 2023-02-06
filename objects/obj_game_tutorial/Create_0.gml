/// @description Insert description here
// You can write your code in this editor
global.budget = 100;
global.cost = 0;
global.income = 0;
// TODO: use struct
global.plans = ["restaurant", "gold mine", "hotel", "school", "bank"];

turn = 1;

function next() {
	global.budget -= global.cost;
	global.cost = 0;
	global.budget += global.income;
	global.income = 0;
	// Update tiles' state and yield
	for(var i = 0; i < instance_number(obj_tile); i += 1) {
		var tile = instance_find(obj_tile, i);
		if tile.state == State.planned {
			tile.state = State.developed;
			tile.updateColor();
			tile.yield = 5;
		}
		global.income += tile.yield;
	}
	turn += 1;
}