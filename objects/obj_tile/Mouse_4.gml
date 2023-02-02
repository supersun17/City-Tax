/// @description Insert description here
// You can write your code in this editor
switch state {
	case State.unavailable:
	break;
	
	case State.available:
	var plansPanel = instance_create_layer(x,
										   y, 
										   "Panels", 
										   obj_plans) 
	with(plansPanel) {
		x = x - sprite_width / 2 + other.sprite_width / 2;
		y = y - sprite_height;
	};
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




