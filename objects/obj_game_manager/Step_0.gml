// Check the current number of platforms that exist in the room
curr_num_platforms = instance_number(obj_platform);

if(curr_num_platforms <= min_num_platforms){
	randomize();
	var x_pos = random_range(80, 1000);
	var y_pos = random_range(60, 600);
	
	
	var new_platform = instance_create_layer(x_pos, y_pos, "instances", obj_platform);
	
	curr_num_platforms ++;
}




