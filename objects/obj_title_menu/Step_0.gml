//get input
up_key = keyboard_check_pressed(global.up);
down_key = keyboard_check_pressed(global.down);
accept_key = keyboard_check_pressed(global.accept);
back_key = keyboard_check_pressed(vk_escape);

//store num of options cur menu
op_length = array_length(option[menu_level]);

//move through the menu
pos += down_key - up_key;
if pos >= op_length {pos=0};
if pos < 0 {pos=op_length-1};

//using the options
if accept_key {
	
	switch (menu_level) {
		case 0:
		switch(pos){
			//play
			case 0: menu_level=1; break;
			//start tutorial
			case 1: break;
			//settings
			case 2: menu_level=2; break;
			//quit game
			case 3: game_end(); break;
		}
		break;
		
		case 1:
		switch(pos){
			//start game
			case 0: room_goto_next(); break;
			//not implemented feature
			case 1: break;
			//back
			case 2: menu_level=0; break;
		}
		break;
		
		case 2:
		switch(pos){
			//controls
			case 0: menu_level=3; break;
		}
		break;
		
		case 3:
		switch(pos){
			//back
			case 6: menu_level=2 ; break;
		}
		break;

	}
}

//going back in the menu or quitting
if back_key {
	switch (menu_level) {
		case 0: game_end(); break;
		case 1: menu_level=0; break;
		case 2: menu_level=0; break;
		case 3: menu_level=2; break;
	}
}