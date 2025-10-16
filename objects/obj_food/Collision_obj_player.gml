if (collectible) {
    obj_player.food_collected += 1; // Add this line
    instance_destroy(self);
}