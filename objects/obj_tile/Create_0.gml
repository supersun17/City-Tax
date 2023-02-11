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

developmentAge = 0;
yield = 0;
planIndexes = [0, 1];
state = State.undiscover;
hasChange = false;

function updateColor() {
		switch state {
		case State.undiscover:
		sprite_index = spr_tile_undiscover;
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
		global.cost += 10;
		state = State.available;
		hasChange = true
		break;
	
		case State.available:
		if hasChange {
			// Cancel: Available -> Undiscover
			global.cost -= 10;
			state = State.undiscover;
			hasChange = false;
			updateColor();
			return;
		}
		var panelX = x - (sprite_get_width(spr_panel) - sprite_get_width(spr_tile_available)) / 2;
		var panelY = y - (sprite_get_height(spr_panel));
		var panel = instance_create_layer(panelX, panelY, "Panels", obj_panel);
		panel.createPlans(state, getPlanNames());
		panel.sourceTile = id;
		break;
	
		case State.planned:
		if hasChange {
			// Cancel: Planned -> Available
			global.cost -= 20;
			state = State.available;
			hasChange = false;
			updateColor();
			return;
		}
		global.cost += 20;
		hasChange = true
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