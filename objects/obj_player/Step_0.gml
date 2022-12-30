currentX += global.horizontal * entitySpeed;
currentY += 0.3;

if(global.horizontal == 0) {
	if(currentX > 0 && currentX >= entitySpeed) {
		currentX -= entitySpeed;
	} else if(currentX > 0 && currentX < entitySpeed) {
		currentX = 0;
	}
	
	if(currentX < 0 && currentX <= -entitySpeed) {
		currentX += entitySpeed;
	} else if(currentX < 0 && currentX > -entitySpeed) {
		currentX = 0;
	}
}

currentX = clamp(currentX, -xMax, xMax);
currentY = clamp(currentY, -yMax, yMax);

onGround = place_meeting(x, y + 1, ground_group);

if(global.horizontal != 0)
	lastXDirection = global.horizontal;

obj_player_sprite.image_speed = 1;
obj_player_sprite.image_xscale = lastXDirection;

if(!place_meeting(x, y - abs(round(currentX)), ground_group) && onGround) {
	while(place_meeting(x + round(currentX), y, ground_group) && !place_meeting(x + round(currentX), y - abs(round(currentX)), ground_group)) {
		y -= 1;
	}
}

if(!place_meeting(x + round(currentX), y, ground_group)) {
	x += round(currentX);
} else {
	while(!place_meeting(x + sign(currentX), y, ground_group)) {
		x += sign(currentX);
	}
}

if(place_meeting(x, y + abs(round(currentX)) + 1, ground_group) && onGround) {
	while(!place_meeting(x, y + 1, ground_group)) {
		y += 1;
	}
}

if(!onGround && !global.jumpHold || !onGround && jumpingTimeout == 0)
	currentY += entityGravity;
	
if(!onGround && global.jumpHold && jumpingTimeout > 0) {
	currentY = -8;
	jumpingTimeout--;
}

if(!place_meeting(x, y + round(currentY), ground_group)) {
	y += round(currentY);
} else {
	while(!place_meeting(x, y + sign(currentY), ground_group)) {
		y += sign(currentY);
	}
	
	currentY = 0;
}

if(!jumping && currentY < 0 && !onGround && obj_player_sprite.sprite_index != spr_player_falling) {
	jumping = true;
	obj_player_sprite.image_index = 0;
} else if(jumping && obj_player_sprite.image_index >= obj_player_sprite.image_number - 1) {
	jumping = false;
	obj_player_sprite.image_index = 0;
}

if(onGround) {
	jumpingTimeout = 10;
	
	if(!place_meeting(x + currentX, y - abs(round(currentX)), ground_group) && global.horizontal != 0) {
		obj_player_sprite.sprite_index = spr_player_walk;
	} else {
		obj_player_sprite.sprite_index = spr_player_idle;
	}
} else {
	if(jumping)
		obj_player_sprite.sprite_index = spr_player_jump;
	else
		obj_player_sprite.sprite_index = spr_player_falling;
}

if(!onGround && !global.jumpHold)
	jumpingTimeout = 0;

if(onGround && global.jump) {
	currentY = -8;
	obj_player_sprite.image_index = 0;
}

if(obj_player_sprite.sprite_index == spr_player_jump &&  obj_player_sprite.image_index >= obj_player_sprite.image_number - 1) {
	   obj_player_sprite.image_speed = 0;
}

if(obj_player_sprite.sprite_index == spr_player_falling &&  obj_player_sprite.image_index >= obj_player_sprite.image_number - 1) {
	   obj_player_sprite.image_speed = 0;
}