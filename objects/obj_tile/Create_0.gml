/// @description Insert description here
// You can write your code in this editor

enum State {
	unavailable,
	available,
	planned,
	developing,
	upgrading,
	developed
}

planIndexes = [0, 2];
state = State.available;

function updateColor() {
		switch state {
		case State.unavailable:
		break;
	
		case State.available:
		image_blend = c_white;
		break;
	
		case State.planned:
		break;
	
		case State.developed:
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