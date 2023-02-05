/// @description Insert description here
// You can write your code in this editor

plans = [];

function createPlans(state, planNames) {
	switch state {
		case State.undiscover:
		break;
	
		case State.available:
		for(var i = 0; i < array_length(planNames); i += 1) {
			var offset = i * sprite_get_width(obj_plan); 
			var plan = instance_create_layer(x + offset, 
											 y, 
											 "Panels", 
											 obj_plan);
			with(plan) {
				panel = other.id;
				name = planNames[i];
				updateColor();
				depth -= 1;
			}
			plans = array_concat(plans, [plan.id]);
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