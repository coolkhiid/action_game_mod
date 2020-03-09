/// @description Insert description here
// You can write your code in this editor
randomize();
alarm[2] = random_range(1,3)*room_speed

if(curr_num_platforms < max_num_platforms){
	randomize();
	var x_pos = random_range(100, 900);
	var y_pos = random_range(550, 800);
	
	
	var new_platform = instance_create_layer(x_pos, y_pos, "instances", obj_platform);
	
	curr_num_platforms ++;
} 


	
