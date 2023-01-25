//speed
const_speed_player = 6;
move_speed_player = const_speed_player;

const_dash_speed_player = 6*6*4;
dash_player = const_dash_speed_player;

face = DOWN;

//dash
max_dash = 1;
dash_dispo = max_dash;
if(max_dash < 3){
	cd_dash = room_speed
}else{
	cd_dash = room_speed*(max_dash/2)
}
can_dash = true;
can_attack = true;
dash_on = false;
stock_dash = 0;

//coup
coup = 1;
cd_coup = room_speed/2;

//shield
max_shield = 100;
shield_dispo = max_shield;
overshield = false;
shield_on = false;

//overlay
draw_health_ = 0;