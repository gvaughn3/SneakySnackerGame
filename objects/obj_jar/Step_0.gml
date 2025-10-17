if (picked_up) {
    x = obj_player.x - 100;
    y = obj_player.y - 150;
}

if (thrown) {
    vspeed += 0.5;
    x += hspeed;
    y += vspeed;
    
    if (place_meeting(x, y, obj_block)) {
        instance_create_layer(x, y, "Instances", obj_food);
        
        visible = false;
        respawn_timer = 600;
        thrown = false;
        hspeed = 0;
        vspeed = 0;
        x = spawn_x;
        y = spawn_y;
    }
}

if (picked_up && obj_player.holding_jar != id) {
    visible = false;
    respawn_timer = 600;
    picked_up = false;
}

if (!visible) {
    respawn_timer -= 1;
    
    if (respawn_timer <= 0) {
        visible = true;
        thrown = false;
        hspeed = 0;
        vspeed = 0;
    }
}