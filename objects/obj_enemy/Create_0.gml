move_speed = 5;
move_dir = 1;
patrol_left = x - 600;
patrol_right = x + 600;

detection_range = 400;
has_spotted_player = false;

walk_sound = audio_play_sound(enemywalk, 3, true);
audio_sound_gain(walk_sound, 0, 0); // Start silent

