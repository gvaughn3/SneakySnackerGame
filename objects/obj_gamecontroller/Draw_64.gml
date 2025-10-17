var seconds = floor(global.time_remaining / room_speed)
draw_set_color(c_green)
draw_text(45, 35, "Time: " + string(seconds))

draw_text(45, 16, "Score: " + string(global.score))