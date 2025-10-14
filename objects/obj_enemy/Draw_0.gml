draw_self();

if (has_spotted_player) {
    draw_set_color(c_red);
} else {
    draw_set_color(c_yellow);
}
draw_set_alpha(0.3);

var cone_length = detection_range;
var cone_x = x + (cone_length * move_dir);
draw_line_width(x, y, cone_x, y, 40);

draw_set_alpha(1);
draw_set_color(c_white);