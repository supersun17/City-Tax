/// @description Insert description here
// You can write your code in this editor
var sourceTile = panel.sourceTile;
sourceTile.state = State.planned;
sourceTile.plannedSelected = sprite_index;
sourceTile.updateGame();
sourceTile.updateColor();
instance_destroy(panel);