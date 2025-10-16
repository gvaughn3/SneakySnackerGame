if (collect_delay > 0){
	collect_delay -= 1
} else {
	collectible = true
}

vspeed += 0.3;

x += hspeed;

if (!place_meeting(x, y + vspeed, obj_block)) {
    y += vspeed;
} else {
    while (!place_meeting(x, y + sign(vspeed), obj_block)) {
        y += sign(vspeed);
    }
    vspeed = 0;
    hspeed = 0;
}

lifetime -= 1;

if (lifetime <= 0) {
    instance_destroy();
}

// Fade out near end
if (lifetime < 30) {
    image_alpha = lifetime / 30;
}