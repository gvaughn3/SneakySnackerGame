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
    if (!has_spotted_player) {
        audio_play_sound(alert, 5, false);
        has_spotted_player = true;
        
        with (obj_player) {
            is_caught = true;
            caught_timer = 180;
            
            vspeed = 0;
            hspeed = 0;
            
            if (food_collected > 0) {
				show_debug_message("Dropping food: " + string(food_collected));
				repeat(food_collected) {
		        var food = instance_create_layer(x, y, "Instances", spr_food);
		        food.sprite_index = spr_food;
		        food.hspeed = random_range(-4, 4);
		        food.vspeed = random_range(-6, -2);
		        food.gravity = 0.3;
			  }
    
			    food_collected = 0;
			}
        }
    }
    spotted_cooldown = 120;
}
}

if (instance_exists(obj_player)) {
    var distance = point_distance(x, y, obj_player.x, obj_player.y);
    var max_distance = 1500;
    var volume = clamp(1 - (distance / max_distance), 0, 1);
    
    audio_sound_gain(walk_sound, volume, 100);
    
}