/// @description Insert description here
// You can write your code in this editor

plans = [];

function createPlans(state, planSprites) {
	for(var i = 0; i < array_length(planSprites); i += 1) {
		var sprite = planSprites[i];
		var offset = i * sprite_get_width(sprite);
		var plan = instance_create_layer(x + offset, 
											y, 
											"Panels", 
											obj_plan);
		with(plan) {
			panel = other.id;
			sprite_index = sprite;
			depth -= 1;
		}
		plans = array_concat(plans, [plan.id]);
	}
}