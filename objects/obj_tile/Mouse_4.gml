/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_plans) {
	instance_destroy(obj_plans);
	return;
}

switch state {
	case State.unavailable:
	break;
	
	case State.available:
	var plansPanelX = x - sprite_get_width(spr_plans) / 2 + sprite_width / 2;
	var plansPanelY = y - sprite_get_height(spr_plans);
	var plansPanel = instance_create_layer(plansPanelX,
										   plansPanelY,
										   "Panels",
										   obj_plans);
	with(plansPanel) {
		createPlans(other.state);
	}
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




