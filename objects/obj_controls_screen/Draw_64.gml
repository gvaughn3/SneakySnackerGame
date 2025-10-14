var gw = display_get_gui_width();
var gh = display_get_gui_height();

draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(gw * 0.5, gh * 0.5, screen_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
