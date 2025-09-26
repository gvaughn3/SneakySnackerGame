var move = keyboard_check(vk_right) - keyboard_check(vk_left);
hspeed = move * 4;

if (!place_meeting(x, y + 1, obj_platform)) {
    vspeed += 0.5;
} else {
    vspeed = 0;
	if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up)) {
		vspeed = -8;
	}

}

x += hspeed;
y += vspeed;

if (keyboard_check_pressed(ord("E")) && place_meeting(x, y, obj_jar) && holding_jar == noone)
{ var found_jar = instance_place(x, y, obj_jar)
	if (found_jar != noone){
		holding_jar = found_jar
		found_jar.picked_up = true
	}
}

if (holding_jar != noone && keyboard_check_pressed(ord("F"))){
	holding_jar.picked_up = false
	holding_jar.thrown = true
	holding_jar.vspeed = -6
	holding_jar.hspeed = facing_right ? 6 : -6
	holding_jar = noone
}
	
