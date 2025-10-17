var seconds = floor(global.time_remaining / room_speed);
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(35, 10, 200, 90, false);

draw_set_alpha(1);
draw_set_color(c_yellow);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var time_text = "Time: " + string(seconds);
var score_text = "Score: " + string(global.score);
draw_set_color(c_black);
draw_text_transformed(46, 40, time_text, 2, 2, 0);
draw_text_transformed(46, 10, score_text, 2, 2, 0);
draw_set_color(c_yellow);
draw_text_transformed(45, 40, time_text, 2, 2, 0);
draw_text_transformed(45, 10, score_text, 2, 2, 0);
draw_set_color(c_white);

var rect_width = 175;
var rect_height = 75;

var x1 = display_get_width() - rect_width - 185; // 20px padding from the right edge
var y1 = 25;                                   // 20px from the top
var x2 = x1 + rect_width;
var y2 = y1 + rect_height;

draw_set_color(c_black);
draw_set_alpha(0.7)
draw_rectangle(x1, y1, x2, y2, false);

var life_x = 1160;
var life_y = 36;
var life_spacing = 50;

for (var i = 0; i < global.lives; i++) {
    draw_sprite_ext(spr_heart, 0, life_x + (i * life_spacing), life_y, 0.6, 0.6, 0, c_yellow, 1);
}