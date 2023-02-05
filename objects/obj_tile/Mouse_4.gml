/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_panel) {
	instance_destroy(obj_panel);
	return;
}

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
	// Available -> Developed
	var panelX = x - (sprite_get_width(spr_panel) - sprite_get_width(spr_tile_available)) / 2;
	var panelY = y - (sprite_get_height(spr_panel));
	var panel = instance_create_layer(panelX, panelY, "Panels", obj_panel);
	state = State.developed;
	panel.createPlans(state, getPlanNames());
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

updateColor();



