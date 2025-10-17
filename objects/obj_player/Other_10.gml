

if (food_collected > 0) {
    repeat(food_collected) {
        var drop_x = x + random_range(-30, 30);
        var drop_y = y + random_range(-30, 30);
        var dropped_food = instance_create_layer(drop_x, drop_y, "Instances", obj_food);
        
        dropped_food.is_dropped = true;
        dropped_food.alarm[0] = 30;
    }
    
    food_collected = 0;
}

x = xstart;
y = ystart;

if (lives <= 0) {
    game_restart();
}