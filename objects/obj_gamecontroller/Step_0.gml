if (global.time_remaining > 0){
	global.time_remaining -= 1}
	else{
		game_end()
	}
if (global.score >= 100){
	show_message("You Win!")
	game_end()
}

if (global.lives <= 0){
	show_message("Game Over!")
	game_ends()
}