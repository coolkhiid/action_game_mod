// Move the camera in the end step so that everything else has moved first
// Could also do this in Draw Begin if there's other stuff happening in End Step

var numplayers = instance_number(obj_player);
var new_y = 0;

// Simple camera that tries to keep the first alive player in view and never goes outside the bounds of the room
for (i = 0; i < numplayers; i++){
	var p = instance_find(obj_player, i); // grab a reference to the next player
	// If the player hasn't fallen off the bottom, have the camera follow them
	if (!p.gone) {
		new_y = p.y - (camera_get_view_height(view_camera[0]) / 2);
		break;
	}
}

// Move 60% of the way to this average position
cam_y = lerp(camera_get_view_y(view_camera[0]), new_y, 0.6);

// Clamp position to room boundaries: don't want to move outside the room!
cam_y = max(cam_y, 0);
cam_y = min(cam_y, room_height - camera_get_view_height(view_camera[0]));


// Camera doesn't move in x -- force it to 0 every frame just in case
x = 0;

// Finally, set the position of the camera
camera_set_view_pos(view_camera[0], x, cam_y);
