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


//animate
if(coup == 1){
	if xspd == 0 && yspd == 0{
		switch(face){
		case RIGHT:
			sprite_index = spr_player_idle;
			image_xscale = 1;
			break;
		case DOWN:
			sprite_index = spr_player_idle_front;
			image_xscale = 1;
			break;
		case LEFT:
			sprite_index = spr_player_idle;
			image_xscale = -1;
			break;
		case UP:
			sprite_index = spr_player_idle_back;
			image_xscale = 1;
			break;
		}	
	}else{
		switch(face){
		case RIGHT:
			sprite_index = spr_player_run;
			image_xscale = 1;
			break;
		case DOWN:
			sprite_index = spr_player_run_front;
			image_xscale = 1;
			break;
		case LEFT:
			sprite_index = spr_player_run;
			image_xscale = -1;
			break;
		case UP:
			sprite_index = spr_player_run_back;
			image_xscale = 1;
			break;
		}
	}
}

//move the player
x += xspd;
y += yspd;

depth = -bbox_bottom

//coup d'épée
if(attack_key && coup > 0 && can_attack){
	switch(face){
		
		case RIGHT:
			instance_create_depth(x+36, y, -9999, obj_coup_epee)
			sprite_index = spr_player_attack;
			image_xscale = 1;
			break;
		case DOWN:
			instance_create_depth(x, y+36, -9999, obj_coup_epee)
			sprite_index = spr_player_attack_front;
			image_xscale = 1;
			break;
		case LEFT:
			instance_create_depth(x-36, y, -9999, obj_coup_epee)
			sprite_index = spr_player_attack;
			image_xscale = -1;
			break;
		case UP:
			instance_create_depth(x, y-36, -9999, obj_coup_epee)
			sprite_index = spr_player_attack_back;
			image_xscale = 1;
			break;
			
	}
	coup--;
	alarm[1] = cd_coup;
}

//dash
if(dash_key && dash_dispo > 0 && can_dash){
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
	can_dash = false;
	can_attack = false;
	shield_on = true;
	stock_dash = dash_dispo;
	
	move_speed_player = 3;
	
	if(shield_dispo == 0){
		overshield = true;
	}
	
}else if(!shield_key && !can_dash){
	can_dash = true;
	can_attack = true;
	shield_on = false;
	move_speed_player = const_speed_player;
	
	if(stock_dash + dash_dispo <= max_dash){
		dash_dispo += stock_dash;
		stock_dash = 0;
	}
}

if(shield_dispo != max_shield && alarm_get(2) == -1 && !shield_key){
		alarm[2] = 3;
}

	





