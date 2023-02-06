/// @description Insert description here
// You can write your code in this editor
var turnTxt = "Turn: " + string(turn);

var budgetTxt = "    Budget: " + string(global.budget);
if global.cost != 0 {
	budgetTxt += " -" + string(global.cost);
}

var incomeTxt = "    Income: +" + string(global.income);

draw_text_color(5, 5, turnTxt + budgetTxt + incomeTxt, c_yellow, c_red, c_red, c_yellow, 1);



