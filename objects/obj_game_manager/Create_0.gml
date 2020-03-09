curr_num_platforms = 0; // the number of platforms currently in the room
min_num_platforms = 8; // the min number of platforms we want in the room at any time
max_num_platforms = 15; // the max number of platforms we want in the room at any time (used only for initial population)

globalvar P1score;
globalvar P2score;

P1score = 0;
P2score = 0;

alarm[2] = random_range(1, 3)*room_speed


