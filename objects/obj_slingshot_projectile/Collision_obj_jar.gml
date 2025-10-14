// Check if it's a jar - spawn food
if (other.object_index == obj_jar) {
    instance_create_layer(other.x, other.y, "Instances", obj_food);
}

// Destroy the object that was hit
with (other) {
    instance_destroy();
}

// Destroy the projectile
instance_destroy();