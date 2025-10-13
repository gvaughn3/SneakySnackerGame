var move = keyboard_check(vk_right) - keyboard_check(vk_left);
var speed_multiplier = (holding_jar != noone) ? 0.5 : 1;
hspeed = move * 4 * speed_multiplier;

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
    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up)) {
        vspeed = -12;
		sprite_index = sp_player_jump;
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


x = clamp(x, 0, room_width)
y = clamp(y, 0, room_height)