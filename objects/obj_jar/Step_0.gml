if (picked_up) {
	x = obj_player.x;
	y = obj_player.y - 120;
}

if (thrown){
	vspeed += .4
	y += vspeed 
	x += hspeed
	
	if (place_meeting(x, y + 1, obj_block)){
		thrown = false;
		audio_play_sound(breakglass, 5, false);
		instance_destroy(self);
		instance_create_layer(x, y - 120, "Instances", obj_food)
	}
}