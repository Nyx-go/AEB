if(boss_health <= 0){
	boss_health = 0;
	instance_create_depth(1266,484,0,obj_portail);
	instance_destroy();
}

if(obj_player.x>x)
{
	 move_boss_x = 1;
}else if(obj_player.x<x){
	 move_boss_x = -1;
}else{
	 move_boss_x =0;
}

if(obj_player.y>y)
{
	 move_boss_y = 1;
}else if(obj_player.y<y){
	 move_boss_y = -1;
}else{
	 move_boss_y = 0;
}

var xspd = move_boss_x * move_speed_boss;
var yspd = move_boss_y * move_speed_boss;


if (move_boss_x = 1){face = RIGHT};
if (move_boss_x = -1){face = LEFT};
if (move_boss_x = 0 && move_boss_y = 1){face = DOWN};
if (move_boss_x = 0 && move_boss_y = -1){face = UP};

if(coup > 0){
	
	x += xspd;
	y += yspd;
}

if(coup == 1){
	switch(face){
		case RIGHT:
			sprite_index = spr_boss_run;
			image_xscale = 1;
			break;
		case DOWN:
			sprite_index = spr_boss_run_front;
			image_xscale = 1;
			break;
		case LEFT:
			sprite_index = spr_boss_run;
			image_xscale = -1;
			break;
		case UP:
			sprite_index = spr_boss_run_back;
			image_xscale = 1;
			break;
	}
}

if(coup > 0 && ((-55<obj_player.x-x && obj_player.x-x<55) && (-85<obj_player.y-y && obj_player.y-y<95)) || can_attack){
	if(!can_attack){
		alarm[1] = cd_av_coup;
	}
	else{
		audio_play_sound(sound_slash,10,false);
		switch(face){
			case RIGHT:
				instance_create_depth(x+27, y, -9999, obj_coup_boss)
				sprite_index = spr_boss_attack;
				image_xscale = 1;
				break;
			case DOWN:
				instance_create_depth(x, y+32, -9999, obj_coup_boss)
				sprite_index = spr_boss_attack_front;
				image_xscale = 1;
				break;
			case LEFT:
				instance_create_depth(x-27, y, -9999, obj_coup_boss)
				sprite_index = spr_boss_attack;
				image_xscale = -1;
				break;
			case UP:
				instance_create_depth(x, y-30, -9999, obj_coup_boss)
				sprite_index = spr_boss_attack_back;
				image_xscale = 1;
				break;
			
		}
		can_attack = false;
	}
	coup--;
	alarm[0] = cd_coup;
}