//get input
up_key = keyboard_check_pressed(global.up);
down_key = keyboard_check_pressed(global.down);
accept_key = keyboard_check_pressed(global.accept);
back_key = keyboard_check_pressed(vk_escape);

if back_key {
	room_goto(title_screen);
}

//move through the menu
pos += down_key - up_key;
if pos >= op_length {pos=0};
if pos < 0 {pos=op_length-1};

if accept_key {
	switch(pos){
		case 0:
		
			global.max_health = 100;
			global.health = global.max_health;

			global.damage = 10;

			global.boss_stat = [[0,0], [0,0], [0,0]]
			global.boss_vaincu = 0;
			
			room_goto(title_screen); 
			break;
			
		case 1: game_end();break;
	}
}