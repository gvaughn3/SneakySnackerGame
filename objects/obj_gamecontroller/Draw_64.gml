var seconds = floor(global.time_remaining / room_speed);
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(35, 10, 200, 60, false);
draw_set_alpha(1);
draw_set_color(c_yellow);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var time_text = "Time: " + string(seconds);
var score_text = "Score: " + string(global.score);
draw_set_color(c_black);
draw_text_transformed(46, 36, time_text, 2, 2, 0);
draw_text_transformed(46, 17, score_text, 2, 2, 0);
draw_set_color(c_yellow);
draw_text_transformed(45, 35, time_text, 2, 2, 0);
draw_text_transformed(45, 16, score_text, 2, 2, 0);
draw_set_color(c_white);

var life_x = room_width - 100;
var life_y = 50;
var life_spacing = 40;

for (var i = 0; i < global.lives; i++) {
    draw_sprite(sp_player, 0, life_x + (i * life_spacing), life_y);
}