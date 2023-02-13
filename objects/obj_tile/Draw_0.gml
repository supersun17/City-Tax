/// @description Insert description here
// You can write your code in this editor
draw_self();

if state() == State.developed {
	var yieldTxt = "+" + string(yield);
	draw_text_color(x + 5, y + 5, yieldTxt, c_yellow, c_red, c_red, c_yellow, 1);
	var additionalYieldTxt = "+" + string(additionalYield);
	draw_text_color(x + 5, y + 25, additionalYieldTxt, c_yellow, c_red, c_red, c_yellow, 1);
}