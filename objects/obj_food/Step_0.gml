if (collect_delay > 0){
	collect_delay -= 1
} else {
	collectible = true
}

vspeed += 0.3;

x += hspeed;

if (!place_meeting(x, y + vspeed, obj_platform)) {
    y += vspeed;
} else {
    while (!place_meeting(x, y + sign(vspeed), obj_platform)) {
        y += sign(vspeed);
    }
    vspeed = 0;
    hspeed = 0;
}
