/// @description Insert description here
// You can write your code in this editor
var turnTxt = "Turn: " + string(turn);
draw_text_color(5, 5, turnTxt, c_yellow, c_red, c_red, c_yellow, 1);

var budgetTxt = "Budget: " + string(global.budget);
if global.cost != 0 {
	budgetTxt += " -" + string(global.cost);
}
draw_text_color(5, 25, budgetTxt, c_yellow, c_red, c_red, c_yellow, 1);

var incomeTxt = "Income: +" + string(global.income);
draw_text_color(5, 45, incomeTxt, c_yellow, c_red, c_red, c_yellow, 1);