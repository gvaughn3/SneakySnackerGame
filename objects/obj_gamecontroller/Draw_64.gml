var seconds = floor(global.time_remaining / room_speed)
draw_set_color(c_black)
draw_text(room_width - 100, 16, "Time: " + string(seconds))

draw_text(16, 16, "Score: " + string(global.score))