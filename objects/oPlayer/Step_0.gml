/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

//Get player input
key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space);

if (key_left) || (key_right) || (key_jump) {
	controller = 0;
}

if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2){
	key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
	key_right = max(gamepad_axis_value(0,gp_axislh),0);
	controller = 1;

}

if gamepad_button_check(0,gp_padl){
	key_left = 1;
	controller = 1;
}

if gamepad_button_check(0,gp_padr){
	key_right = 1;
	controller = 1;
}

if (gamepad_button_check_pressed(0,gp_face1))||gamepad_button_check(0,gp_shoulderrb)||gamepad_button_check(0,gp_stickr){
	controller = 1;
	key_jump = 1;

}


//calculate movement
var move = key_right - key_left;


hsp = move * walksp;


vsp = vsp + grv;

if (place_meeting(x, y+1, oWall)) && (key_jump) { //estamos en el piso? 
	vsp = -8;
}

//horizontal collision
if (place_meeting(x+hsp,y,oWall)) {
	while (!place_meeting(x+sign(hsp),y,oWall)) {
		x = x+sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

//vertical collision
if (place_meeting(x,y+vsp,oWall)) {
	while (!place_meeting(x,y+sign(vsp),oWall)) 	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;


//Animation
if (!place_meeting(x, y+1, oWall)) { //estoy en el aire

	sprite_index = sPlayerA;
	image_speed = 0;

	if (sign(vsp) > 0) image_index = 1; else image_index = 0;

} else {//estoy en el piso

	image_speed = 1;
	if (hsp == 0) sprite_index = sPlayer; else sprite_index = sPlayerR;
		
}

if (hsp != 0) image_xscale = sign(hsp);







