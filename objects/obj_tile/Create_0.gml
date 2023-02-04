/// @description Insert description here
// You can write your code in this editor

enum State {
	undiscover,
	available,
	planned,
	developing,
	upgrading,
	developed
}

planIndexes = [0, 2];
state = State.undiscover;

function updateColor() {
		switch state {
		case State.undiscover:
		break;
	
		case State.available:
		sprite_index = spr_tile_available;
		break;
	
		case State.planned:
		break;
	
		case State.developed:
		sprite_index = spr_tile_developed;
		break;
	
		case State.developing:
		break;
	
		case State.upgrading:
		break;

	}
}

function getPlanNames() {
	var planNames = [];
	for(var i = 0; i < array_length(planIndexes); i += 1) {
		var index = planIndexes[i];
		planNames = array_concat(planNames, [global.plans[index]]);
	}
	return planNames
}

updateColor();