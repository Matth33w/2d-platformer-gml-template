currentX = 0;
currentY = 0;

entitySpeed = 0.7;
entityGravity = 0.2;

xMax = 3;
yMax = 8;

lastX = x;
lastY = y;

lastXDirection = 1;

jumping = false;
jumpingTimeout = 0;

onGround = place_meeting(x, y + 1, ground_group);

if(!instance_exists(obj_player_sprite)) {
	instance_create_layer(x, y, "Objects", obj_player_sprite);
}