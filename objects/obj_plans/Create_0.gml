/// @description Insert description here
// You can write your code in this editor
function createPlans(state) {
	switch state {
		case State.unavailable:
		break;
	
		case State.available:
		plan = instance_create_layer(x, y, "Panels",obj_plan);
		with(plan) {
			depth -= 1;
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
}