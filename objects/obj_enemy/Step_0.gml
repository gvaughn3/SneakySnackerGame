// Move in current direction
x += move_speed * move_dir;

// Flip sprite based on direction
if (move_dir == 1) {
    image_xscale = 1; // Facing right
} else {
    image_xscale = -1; // Facing left
}

// Turn around at patrol boundaries
if (x >= patrol_right) {
    move_dir = -1;
    x = patrol_right; // Snap to boundary
}

if (x <= patrol_left) {
    move_dir = 1;
    x = patrol_left;
}
spotted_cooldown = 0;

if (spotted_cooldown > 0) {
    spotted_cooldown -= 1;
}

var dist_to_player = point_distance(x, y, obj_player.x, obj_player.y);

if (dist_to_player <= detection_range && spotted_cooldown == 0) {
    var player_is_in_front = false;
    
    if (move_dir == 1 && obj_player.x > x) {
        player_is_in_front = true;
    }
    if (move_dir == -1 && obj_player.x < x) {
        player_is_in_front = true;
    }
    
    if (player_is_in_front && !obj_player.is_hiding) {
        has_spotted_player = true;
        spotted_cooldown = 120;
        with (obj_player) {
            event_user(0);
        }
    }
}