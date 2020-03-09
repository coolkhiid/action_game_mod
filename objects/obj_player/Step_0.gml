if (player_num == 1) {
	if (keyboard_check(ord("A"))) {
		x_vel -= x_accel;
		image_xscale = -1;
	}
	if (keyboard_check(ord("D"))) {
		x_vel += x_accel;
		image_xscale = 1;
	}
} else if (player_num == 2) {
	if (keyboard_check(vk_left)) {
		x_vel -= x_accel;	
		image_xscale = -1;
	}
	if (keyboard_check(vk_right)) {
		x_vel += x_accel;
		image_xscale = 1;
	}
}



 
	if (x_vel < 0) {
		x_vel = max(x_vel, -x_vel_max);
	} else {
		x_vel = min(x_vel, x_vel_max);
	}


y_vel += grav;

x_move = round(x_vel);
y_move = round(y_vel);



for (var i = 0; i < abs(x_move); i++) {
	if (x+sign(x_vel) >= room_width - sprite_width/2) { 
		x_vel *= -1; 
	} else if (x+sign(x_vel) <= sprite_width/2) {
		x_vel = -x_vel; 
	}
	x += sign(x_vel);
}

// Move the player in the y direction, checking for collisions with platforms (only from the top!)
var sy = sign(y_vel);
if (!gone){ // don't bother with any of this if we're already gone
	while (y_move != 0){ // do this whole loop one pixel at a time until there are no pixels left to move
		
		var colliding = false; // have we collided with a platform? 
		var collidewith = noone; // storage var for our collision check
		
		if (sy >= 0){ // only check collisions if we're moving down, otherwise just move
			
			// Rather than checking place_meeting, use instance_place so that we also get a reference
			// to the object that we will collide with (if any)
			collidewith = instance_place(x, y+sy, obj_platform);
			
			// Check if instance_place returned a valid reference to an instance of the obj_platform object
			if (collidewith != noone) 
			{    
				// In order to get 1-way collisions, we only want to treat the collision as valid if
				// the player was not already overlapping the object: if they were, then we necessarily
				// came from inside (i.e. below) it and should ignore the collision. To do this, check
				// our current position for collision, instead of the y+sy position we just checked.
				if (place_meeting(x, y, collidewith) == false){
					colliding = true;
					collidewith.alarm[0] = 1;	
					
					
					// All of the above code that uses the collidewith variable 
				}
			}	
		}
		
		if (!colliding) { // no collision, move one more pixel
			y += sy;
			y_move -= sy; // we just moved a pixel, now one pixel closer to being done
		}  else {
			// We hit a platform, so set our position to the hit location and start our jump
			y = y + sy;
			y_vel = jump_vel;	
			
			// Reset our animation so it does the jump frames again
			image_speed = 1;
			image_index = 0;
			
			// And break out of the loop because we want to see the player hit the platform before they jump
			break;
		}
				
	}
} 

// If the player is off the bottom of the screen, then they're gone and the game needs reset
if (y > room_height + sprite_height) {
	if(player_num == 1){
		player1_gone = true
		
	} else if(player_num == 2){
		player2_gone = true
	}
}


// Reset the game if we press R. Having a simple way to quickly reset your game without closing
// and reopening it will make testing it much easier and faster. I put this in every one of my games.
// For this demo, there's no respawn behavior, so we super need this!
if (keyboard_check_pressed(ord("R"))) {
	room_restart();	
}