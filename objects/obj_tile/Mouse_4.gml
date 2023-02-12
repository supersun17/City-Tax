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

switch state {
	case State.undiscover:
		if hasChange {
			// Won't happen	
			break;
		}
		global.cost += 10;
		state = State.available;
		hasChange = true
		updateColor();
		break;
	
	case State.available:
		if hasChange {
			// Cancel: Available -> Undiscover
			global.cost -= 10;
			state = State.undiscover;
			hasChange = false;
			updateColor();
			break;
		}
		var panel = createPanel();
		panel.createPlans(state, getPlanSprites());
		break;
	
	case State.planned:
		if hasChange {
			// Cancel: Planned -> Available
			global.cost -= 20;
			state = State.available;
			hasChange = false;
			updateColor();
			break;
		}
		
		break;
		
	case State.developed:
		if hasChange {
			// Cancel: Demolition -> Developed
			global.cost -= 20;
			hasChange = false;
			updateColor();
			break;	
		}
		if yield <= 1 {
			var panel = createPanel();
			panel.createPlans(state,[spr_tile_demolition]);
			break;
		}
		break;
	
	default:
		break;
}