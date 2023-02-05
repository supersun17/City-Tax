/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_panel) {
	instance_destroy(obj_panel);
	return;
}

if state == State.planned {
	return;
}

updateGame();
updateColor();



