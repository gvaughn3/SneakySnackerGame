if (!audio_is_playing(snd_pickup)) {
    audio_play_sound(snd_pickup, 1, false);
}

if (collectible) {
    obj_player.food_collected += 10; // Add this line
    instance_destroy(self);
}