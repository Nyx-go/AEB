//inputs
var right_key = keyboard_check(global.right);
var up_key = keyboard_check(global.up);
var left_key = keyboard_check(global.left);
var down_key = keyboard_check(global.down);
var attack_key = mouse_check_button_pressed(global.attack);
var dash_key = keyboard_check_pressed(global.dash);
var shield_key = mouse_check_button(global.shield);

//get xspd et yspd
var xspd = (right_key - left_key) * move_speed_player;
var yspd = (down_key - up_key) * move_speed_player;

//direction
if yspd == 0{
	if xspd > 0 {face = RIGHT};
	if xspd < 0 {face = LEFT};
}
if xspd == 0{
	if yspd > 0 {face = DOWN};
	if yspd < 0 {face = UP};
}

//move the player
x += xspd;
y += yspd;

//animate
if xspd == 0 && yspd == 0{
	sprite_index = spr_Player_idle;
}else{
	image_index = 0;
}

depth = -bbox_bottom

//coup d'épée
if(attack_key){
	instance_create_depth(x+36, y, -9999, obj_coup_epee)
}

//dash
if(dash_key && dash_dispo > 0){
	switch(face){
		
		case RIGHT:
			x += dash_player;
			break;
		case DOWN:
			y += dash_player;
			break;
		case LEFT:
			x -= dash_player;
			break;
		case UP:
			y -= dash_player;
			break;
			
	}
	
	dash_dispo --;
	alarm[0] = cd_dash
}

//shield
if(shield_key && !overshield){
	
	shield_dispo--;
	cd_shield = max_shield - shield_dispo;
	
	if(shield_dispo == 0){
		overshield = true
	}
}
if(cd_shield > 0 && alarm_get(2) == -1 && !shield_key){
		alarm[2] = 3;
}
	





