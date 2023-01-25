pos = 0;

option[0][0] = spr_background_boss1_menu;
option[1][0] = global.boss_stat[0][1]
option[0][1] = spr_background_boss2_menu;
option[1][1] = global.boss_stat[1][1]
option[0][2] = spr_background_boss3_menu;
option[1][2] = global.boss_stat[2][1]

option_x = 200;
option_y = 334;

op_length = 0;

depth = -bbox_bottom

if(global.retry && global.boss_vaincu == 2){
	if(global.boss_stat[1][1] <= 0){
		room_goto(scene_gameOver)
	}
}