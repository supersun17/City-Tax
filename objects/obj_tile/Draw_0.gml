/// @description Insert description here
// You can write your code in this editor
draw_self();

if state = State.developed {
	var incomeTxt = "+" + string(yield);
	draw_text_color(x + 5, y + 5, incomeTxt, c_yellow, c_red, c_red, c_yellow, 1);
}