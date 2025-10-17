global.time_remaining = 90 * room_speed
global.game_over = false

global.lives = 3
global.score = 0

target_score = 100;
time_limit = 120 * 60;
timer = time_limit;

game_over = false;
player_won = false;

global.game_over = false

if (audio_is_playing(menumusic)) {
    audio_stop_sound(menumusic);
}

audio_play_sound(backgroundmusic, 1, true);

if (global.lives <= 0) {
    audio_stop_all();
    room_goto(Menu);
}