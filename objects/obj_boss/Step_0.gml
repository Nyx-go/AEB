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

if(coup > 0 && ((-45<obj_player.x-x && obj_player.x-x<45) && (-45<obj_player.y-y && obj_player.y-y<45)) || can_attack){
	if(!can_attack){
		alarm[1] = cd_av_coup;
	}
	else{
		
		switch(face){
			case RIGHT:
				instance_create_depth(x+15, y-5, -9999, obj_coup_boss)
				sprite_index = spr_player_attack;
				image_xscale = 1;
				break;
			case DOWN:
				instance_create_depth(x, y-2, -9999, obj_coup_boss)
				sprite_index = spr_player_attack_front;
				image_xscale = 1;
				break;
			case LEFT:
				instance_create_depth(x-15, y-5, -9999, obj_coup_boss)
				sprite_index = spr_player_attack;
				image_xscale = -1;
				break;
			case UP:
				instance_create_depth(x, y-36, -9999, obj_coup_boss)
				sprite_index = spr_player_attack_back;
				image_xscale = 1;
				break;
			
		}
		can_attack = false;
	}
	coup--;
	alarm[0] = cd_coup;
}