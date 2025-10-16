var move = keyboard_check(vk_right) - keyboard_check(vk_left);
var speed_multiplier = (holding_jar != noone) ? 0.5 : 1;
hspeed = move * 4 * speed_multiplier;

// Handle caught state
if (is_caught) {
    caught_timer -= 1;
    
    if (caught_timer <= 0) {
        // Reset to start
        x = start_x;
        y = start_y;
        is_caught = false;
        
        // Reset enemy states
        with (obj_enemy) {
            has_spotted_player = false;
        }
    }
    
    exit; // Don't process normal movement
}
// Get horizontal movement input (Arrow keys OR WASD)
var move = keyboard_check(vk_right) - keyboard_check(vk_left) + 
           keyboard_check(ord("D")) - keyboard_check(ord("A"));

if (move < 0) {
    facing_right = false;
    image_xscale = -2;
} else if (move > 0) {
    facing_right = true;
    image_xscale = 2;
}

if(move != 0){
    if(sprite_index != sp_player_run){
        sprite_index = sp_player_run;
        image_speed = 1;
    }
} else {
    if(sprite_index != sp_player_idle){
        sprite_index = sp_player_idle;
        image_speed = 1;
    }
}

if (!place_meeting(x, y + 1, obj_block)) {
    vspeed += 0.5;
    if(sprite_index != sp_player_jump){
        sprite_index = sp_player_jump;
    }
} else {
    vspeed = 0;
    // Jump with Space, Up Arrow, OR W key
    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
        vspeed = -12;
        sprite_index = sp_player_jump;
        audio_play_sound(jump, 5, false);
        image_speed = 1;
    }
}
x += hspeed;
y += vspeed;

if (keyboard_check_pressed(ord("E")) && place_meeting(x, y, obj_jar) && holding_jar == noone) {
    var found_jar = instance_place(x, y, obj_jar);
    if (found_jar != noone) {
        holding_jar = found_jar;
        found_jar.picked_up = true;
    }
}

if (holding_jar != noone && keyboard_check_pressed(ord("F"))) {
    holding_jar.picked_up = false;
    holding_jar.thrown = true;
    holding_jar.vspeed = -6;
    holding_jar.hspeed = facing_right ? 6 : -6;
    holding_jar = noone;
}

if (mouse_check_button_pressed(mb_left)) {
    slingshot_charge = 0;
    is_charging = true;
}

if (mouse_check_button(mb_left) && is_charging) {
    slingshot_charge += 0.5;
    slingshot_charge = clamp(slingshot_charge, 0, 20);
}

if (mouse_check_button_released(mb_left) && is_charging) {
    var shoot_dir = point_direction(x, y, mouse_x, mouse_y);
    
    var proj = instance_create_layer(x, y, "Instances", obj_slingshot_projectile);
    proj.speed = slingshot_charge;
    proj.direction = shoot_dir;
    
    slingshot_charge = 0;
    is_charging = false;
}




x = clamp(x, 0, room_width)
y = clamp(y, 0, room_height)