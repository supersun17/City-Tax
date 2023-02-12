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
		sprite_index = planSelected;
		break;
	
		case State.developing:
		break;
	
		case State.upgrading:
		break;
	}
}

function getPlanSprites() {
	var planSprites = [];
	for(var i = 0; i < array_length(planIndexes); i += 1) {
		var index = planIndexes[i];
		planSprites = array_concat(planSprites, [global.plans[index]]);
	}
	return planSprites
}

function createPanel() {
	var panelX = x - (sprite_get_width(spr_panel) - sprite_get_width(spr_tile_available)) / 2;
	var panelY = y - (sprite_get_height(spr_panel));
	var panel = instance_create_layer(panelX, panelY, "Panels", obj_panel);	
	panel.sourceTile = id;
	return panel.id;
}

function handlePlanSelection(plan) {
	planSelected = plan;
	global.cost += 20;
	state = State.planned;
	hasChange = true
	updateColor();
}

updateColor();