/// @description Insert description here
// You can write your code in this editor

enum State {
	undiscover,
	available,
	planned,
	developed
}

yield = 0;
planIndexes = [0, 1];
currentPlan = spr_tile_undiscover;
desiredPlan = spr_tile_undiscover;

function hasChange() { 
	return currentPlan != desiredPlan;
}

function state() {
	if hasChange() {
		return State.planned;
	}
	if currentPlan == spr_tile_undiscover {
		return State.undiscover
	}
	if currentPlan == spr_tile_available {
		return State.available;
	}
	return State.developed;
}

function updateColor() {
	sprite_index = hasChange() ? spr_tile_planned : currentPlan;
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
	var panelX = x - (sprite_get_width(spr_panel) - sprite_get_width(spr_tile_undiscover)) / 2;
	var panelY = y - (sprite_get_height(spr_panel));
	var panel = instance_create_layer(panelX, panelY, "Panels", obj_panel);	
	panel.sourceTile = id;
	return panel.id;
}

function handlePlanSelection(plan) {
	desiredPlan = plan;
	global.cost += 20;
	updateColor();
}