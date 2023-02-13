/// @description Insert description here
// You can write your code in this editor

// If plan is on top of this, stop
if position_meeting(mouse_x, mouse_y, obj_plan) {
	return;
}

if instance_exists(obj_panel) {
	instance_destroy(obj_panel);
	return;
}

switch currentPlan {
	case spr_tile_undiscover:
		if hasChange() {
			global.cost -= 10;
			desiredPlan = currentPlan;
		} else {
			global.cost += 10;
			desiredPlan = spr_tile_available;
		}
		updateColor();
		break;
	
	case spr_tile_available:
		if hasChange() {
			global.cost -= 20;
			desiredPlan = currentPlan;
			updateColor();
		} else {
			var panel = createPanel();
			panel.createPlans(state, getPlanSprites());
		}
		break;
		
	case spr_tile_condo:
	case spr_tile_restaurant:
	case spr_tile_demolition:
		if hasChange() {
			global.cost -= 20;
			desiredPlan = currentPlan;
			updateColor();
		} else if yield <= 1 {
			var panel = createPanel();
			panel.createPlans(state,[spr_tile_demolition]);
		}
		break;
	
	default:
		break;
}