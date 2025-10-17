if (other.object_index == obj_jar) {
	audio_play_sound(breakglass, 5, false);
    instance_create_layer(other.x, other.y, "Instances", obj_food);
    
    other.visible = false;
    other.respawn_timer = 600;
    other.picked_up = false;
    other.thrown = false;
    other.hspeed = 0;
    other.vspeed = 0;
    other.x = other.spawn_x;
    other.y = other.spawn_y;
} else {
    with (other) {
        instance_destroy();
    }
}

instance_destroy();