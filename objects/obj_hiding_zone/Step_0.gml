if (place_meeting(x, y, obj_player)) {
    obj_player.is_hiding = true;
} else {
    if (obj_player.is_hiding) {
        var still_hiding = false;
        with (obj_hiding_zone) {
            if (place_meeting(x, y, obj_player)) {
                still_hiding = true;
            }
        }
        if (!still_hiding) {
            obj_player.is_hiding = false;
        }
    }
}