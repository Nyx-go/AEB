//input
left_key = keyboard_check_pressed(global.left);
right_key = keyboard_check_pressed(global.right);
accept_key = keyboard_check_pressed(global.accept);
back_key = keyboard_check_pressed(vk_escape);

//store num of options cur menu
op_length = array_length(option);

//move through the menu
pos += right_key - left_key;
if pos >= global.boss_vaincu {pos=0};
if pos < 0 {pos=global.boss_vaincu-1};

if(back_key){
	switch(global.boss_vaincu){
		case 1:
			room_goto(salle_boss2)
			break;
		case 2:
			room_goto(salle_boss3)
			break;
	}
}

if accept_key {
	switch(pos){
		//boss1
		case 0: room_goto(salle_boss1); break;
		//boss2
		case 1: room_goto(salle_boss2); break;
		//boss3
		case 2: room_goto(salle_boss3); break;

	}
}





