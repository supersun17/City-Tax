/// @description Insert description here
// You can write your code in this editor
switch state {
	case State.unavailable:
	break;
	
	case State.available:
	// show_message("Select development plan");
	// TODO: pop the select plan panel
	instance_create_layer(x + sprite_width / 2,
						  y + sprite_height / 2,
						  "Instances",
						  obj_plans);
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




