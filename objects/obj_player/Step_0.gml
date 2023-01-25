//inputs
var right_key = keyboard_check(global.right);
var up_key = keyboard_check(global.up);
var left_key = keyboard_check(global.left);
var down_key = keyboard_check(global.down);
var attack_key = mouse_check_button_pressed(global.attack);
var dash_key = keyboard_check_pressed(global.dash);
var shield_key = mouse_check_button(global.shield);

mask_index = spr_player_idle_front

//get xspd et yspd
xspd = (right_key - left_key) * move_speed_player;
yspd = (down_key - up_key) * move_speed_player;

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
		audio_stop_sound(sound_footsteps);
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
		
		if (!audio_is_playing(sound_footsteps)) {
			audio_play_sound(sound_footsteps,-1,false);
		}
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

//collisions
if (place_meeting(x+xspd, y, obj_col_block) || place_meeting(x+xspd, y, obj_boss) || place_meeting(x+xspd, y, obj_boss1) || place_meeting(x+xspd, y, obj_boss2)){
	xspd = 0;
}
if (place_meeting(x, y+yspd, obj_col_block) || place_meeting(x, y+yspd, obj_boss) || place_meeting(x, y+yspd, obj_boss1)) || place_meeting(x, y+yspd, obj_boss2){
	yspd = 0;
}

//move the player
x += xspd;
y += yspd;

depth = -bbox_bottom

//coup d'épée
if(attack_key && coup > 0 && can_attack){
	//play sound
	audio_play_sound(sound_slash,5,false);
	
	switch(face){
		
		case RIGHT:
			instance_create_depth(x+6, y-5, -9999, obj_coup_epee)
			sprite_index = spr_player_attack;
			image_xscale = 1;
			break;
		case DOWN:
			instance_create_depth(x-2, y+7, -9999, obj_coup_epee)
			sprite_index = spr_player_attack_front;
			image_xscale = 1;
			break;
		case LEFT:
			instance_create_depth(x-6, y-5, -9999, obj_coup_epee)
			sprite_index = spr_player_attack;
			image_xscale = -1;
			break;
		case UP:
			instance_create_depth(x-2, y-10, -9999, obj_coup_epee)
			sprite_index = spr_player_attack_back;
			image_xscale = 1;
			break;
			
	}
	coup--;
	alarm[1] = cd_coup;
}

//dash
if(dash_key && dash_dispo > 0 && can_dash){
	dash_on = true;
	audio_play_sound(sound_dash,2,false);
	switch(face){
		
		case RIGHT:
			if (!place_meeting(x+dash_player, y, obj_col_block)){
				x += dash_player;
			}else{
				x = 1350;
			}
			break;
		case DOWN:
			if (!place_meeting(x, y+dash_player, obj_col_block)){
				y += dash_player;
			}else{
				y = 848;
			}
			break;
		case LEFT:
			if (!place_meeting(x-dash_player, y, obj_col_block)){
				x -= dash_player;
			}else{
				x = 18;
			}
			break;
		case UP:
		
			if(!place_meeting(x, y-dash_player, obj_col_block)){
				y -= dash_player;
			}else{
				y = 128;
			}
			break;
			
	}
	
	dash_dispo --;
	alarm[0] = cd_dash
	dash_on = false;
}

//shield
if(shield_key && !overshield){
	if(!instance_exists(obj_shield)){
		instance_create_depth(x,y,0,obj_shield);
		audio_play_sound(sound_shield,6,true);
	}
	shield_dispo--;
	can_dash = false;
	can_attack = false;
	shield_on = true;
	stock_dash = dash_dispo;
	
	move_speed_player = 3;
	
	if(shield_dispo == 0){
		instance_destroy(obj_shield);
		overshield = true;
		audio_stop_sound(sound_shield)
	}
	
}else if(!shield_key && !can_dash){
	audio_stop_sound(sound_shield)
	instance_destroy(obj_shield);
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

//mort
if(global.health <= 0){
	room_goto(scene_gameOver);
}



