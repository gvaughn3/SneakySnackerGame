// cheat codes

// Alt + H to toggle perma hiding (in obj_player)

// Alt + R to restart
if (keyboard_check(vk_alt)) {
    if (keyboard_check_pressed(ord("R"))) {
        room_restart();
    }
	
// Alt + L to add 5 lives
if (keyboard_check_pressed(ord("L"))) {
        global.lives += 5;
    }
	
// Alt + T to teleport to spawn
if (keyboard_check_pressed(ord("T"))) {
        obj_player.x = obj_player.start_x;
        obj_player.y = obj_player.start_y;
    }

// Alt + S to spawn 10 food
if (keyboard_check_pressed(ord("S"))) {
        var spawn_x, spawn_y;
        for (var i = 0; i < 10; i++) {
            spawn_x = obj_player.x + random_range(-80, -40);  
            spawn_y = obj_player.y - 48 - random_range(80, 100); 
            instance_create_layer(spawn_x, spawn_y, "Instances", obj_food);
        }
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