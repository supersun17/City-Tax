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

planIndexes = [0, 1];
state = State.undiscover;

function updateColor() {
		switch state {
		case State.undiscover:
		break;
	
		case State.available:
		sprite_index = spr_tile_available;
		break;
	
		case State.planned:
		sprite_index = spr_tile_planned;
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

function updateGame() {
	switch state {
		case State.undiscover:
		// Undiscover -> Available
		var newBudget = global.budget - 10;
		if newBudget >= 0 {
			global.budget = newBudget;
			state = State.available;
		}
		break;
	
		case State.available:
		var panelX = x - (sprite_get_width(spr_panel) - sprite_get_width(spr_tile_available)) / 2;
		var panelY = y - (sprite_get_height(spr_panel));
		var panel = instance_create_layer(panelX, panelY, "Panels", obj_panel);
		panel.createPlans(state, getPlanNames());
		panel.sourceTile = id;
		break;
	
		case State.planned:
		var newBudget = global.budget - 20;
		if newBudget >= 0 {
			global.budget = newBudget;
		}
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