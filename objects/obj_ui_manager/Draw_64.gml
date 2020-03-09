// Draw GUI event does not move when the camera moves, so we can safely use it to draw things we want to be always-on-screen.
// downside is it doesn't respect camera scaling so we also have to manually scale the text.

draw_set_font(font0);
var ww = window_get_width();

// draw text for player 1 being gone
draw_set_halign(fa_left);
var p0 = instance_find(obj_player,0); // both players are derived from obj_player, so searching for the parent allows us to get refs to either
if (p0 != noone && p0.gone == true) { // check that we found something and if so, that they are gone
	draw_text_transformed_colour(10,10,P1score,3,3,0,c_blue,c_blue,c_teal,c_teal,1);
}

// draw text for player 2 being gone
draw_set_halign(fa_right);
var p1 = instance_find(obj_player,1); // both players are derived from obj_player, so searching for the parent allows us to get refs to either
if (p1 != noone && p1.gone == true) { // check that we found something and if so, that they are gone
	draw_text_transformed_colour(ww-10,10,P2score,3,3,0,c_red,c_red,c_maroon,c_maroon,1);
}
