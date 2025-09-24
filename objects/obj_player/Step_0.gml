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
