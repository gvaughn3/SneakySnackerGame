// cheat codes

// Alt + R to restart
if (keyboard_check(vk_alt)) {
    if (keyboard_check_pressed(ord("R"))) {
        room_restart();
    }
}

if (global.time_remaining > 0) {
    global.time_remaining -= 1;
} else {
    // Time's up - check if player reached target score
    if (global.score >= 100) {
        show_message("You Win! Score: " + string(global.score));
    } else {
        show_message("Time's Up! You needed 100 points but only got " + string(global.score));
    }
    game_end();
}

if (global.score >= 100) {
    show_message("You Win!");
    game_end();
}

if (global.lives <= 0) {
    show_message("Game Over!");
    game_end();
}