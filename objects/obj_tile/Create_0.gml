/// @description Insert description here
// You can write your code in this editor

#region Foundation
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
		array_push(planSprites, global.plans[index]);
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


function findAdjacentTiles() {
	var result = [];
	var width = sprite_width;
	var height = sprite_height;
	var centerX = x + 0.5 * width;
	var centerY = y + 0.5 * height;
	var positions = [
		[centerX + width, centerY],
		[centerX, centerY - height],
		[centerX - width, centerY],
		[centerX, centerY + height]
	]
	for(var i = 0; i < 4; i += 1) {
		var xx = positions[i][0];
		var yy = positions[i][1];
		var inst = instance_position(xx, yy, obj_tile);
		if inst != noone {
			array_push(result, inst.id);
		}
	}
	return result;
}
#endregion

#region Buffs
buffs = [];
buffsLastFor = [];
additionalYield = 0;

function applyDemolitionBuff() {
	array_push(buffs, global.buffs.park.yield);
	array_push(buffsLastFor, global.buffs.park.lastFor);
}

function checkoutBuffs() {
	var result = 0;
	for(i = 0; i < array_length(buffs); i += 1) {
		var buff = buffs[i];
		var buffLastFor = buffsLastFor[i];
		if buffLastFor > 0 {
			result += buff;
			buffsLastFor[i] = buffLastFor - 1;
		} else {
			array_delete(buffs, i, 1);
			array_delete(buffsLastFor, i, 1);
		}
	}
	additionalYield = result;
}

#endregion