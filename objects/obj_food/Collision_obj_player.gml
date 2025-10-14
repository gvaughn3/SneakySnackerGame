if (collectible) {
    global.score += 5;
    obj_player.food_collected += 1; // Add this line
    instance_destroy(self);
}