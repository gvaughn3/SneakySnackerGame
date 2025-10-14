var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)
var w = string_width(back_str) * scale
var h = string_height(back_str) * scale
if (mx >= back_px && mx <= back_px + w && my >= back_py && my <= my + h) {
    room_goto(Menu)
}

