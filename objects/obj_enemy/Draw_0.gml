draw_self();

if (has_spotted_player) {
    draw_set_color(c_yellow);
} else {
    draw_set_color(c_yellow);
}
draw_set_alpha(0.3);

var cone_length = detection_range;
var cone_width = 150;
var y_offset = 80; // Vertical shift
var x_offset = 55; // Horizontal shift outwards

var cone_start_x = x + (x_offset * move_dir);
var cone_end_x = cone_start_x + (cone_length * move_dir);

// Draw a triangle for the cone
draw_triangle(
    cone_start_x, y + y_offset,                           // Point at enemy
    cone_end_x, y + y_offset - cone_width/2,              // Top corner of cone
    cone_end_x, y + y_offset + cone_width/2,              // Bottom corner of cone
    false
);

draw_set_alpha(1);
draw_set_color(c_white);