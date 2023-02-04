/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_plans) {
	instance_destroy(obj_plans);
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



