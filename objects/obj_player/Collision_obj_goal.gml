if (food_collected > 0) {
    food_saved += food_collected;
    food_collected = 0;
    
    show_debug_message("Food saved! Total: " + string(food_saved));
}