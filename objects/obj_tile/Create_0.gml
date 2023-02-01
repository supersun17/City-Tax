/// @description Insert description here
// You can write your code in this editor

enum State {
	unavailable,
	available,
	planned,
	developing,
	upgrading,
	developed
}

function updateColor() {
		switch state {
		case State.unavailable:
		break;
	
		case State.available:
		image_blend = c_yellow;
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

state = State.available;

updateColor();