draw_self();

if (is_charging) {
    draw_set_color(c_yellow);
    var aim_length = slingshot_charge * 5;
    var aim_dir = point_direction(x, y, mouse_x, mouse_y);
    var end_x = x + lengthdir_x(aim_length, aim_dir);
    var end_y = y + lengthdir_y(aim_length, aim_dir);
    draw_line_width(x, y, end_x, end_y, 2);
    
    draw_set_color(c_white);
    draw_rectangle(x - 20, y - 40, x + 20, y - 35, false);
    draw_set_color(c_lime);
    draw_rectangle(x - 20, y - 40, x - 20 + (slingshot_charge * 2), y - 35, false);
}

draw_set_color(c_white);

draw_self();

if (is_hiding) {
    draw_set_color(c_lime);
    draw_text(x, y - 50, "HIDING");
    draw_set_color(c_white);
}

draw_self();

draw_set_color(c_white);
draw_text(x, y - 60, "Lives: " + string(lives));
draw_text(10, 10, "Carrying: " + string(food_collected));
draw_text(10, 30, "Saved: " + string(food_saved));
draw_set_color(c_white);