//get input
up_key = keyboard_check_pressed(global.up);
down_key = keyboard_check_pressed(global.down);
accept_key = keyboard_check_pressed(global.accept);
back_key = keyboard_check_pressed(vk_escape);

option[3,0] = "Up ("+ string(chr(global.up)) + ")";
option[3,1] = "Down ("+ string(chr(global.down)) + ")";
option[3,2] = "Left ("+ string(chr(global.left)) + ")";
option[3,3] = "Right ("+ string(chr(global.right)) + ")";
option[3,4] = "Dash ("+ string(chr(global.dash)) + ")";
option[3,5] = "Accept ("+ string(chr(global.accept)) + ")";
option[3,6] = "Back";

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
			//fullscreen
			case 1:
			if window_get_fullscreen(){
					        window_set_fullscreen(false);
					    }
					    else
					    {
					        window_set_fullscreen(true);
					    }
					break;
			//sound
			case 2: break;
			//back
			case 3: menu_level=0;break;
		}
		break;
		
		case 3:
			switch(pos){
				//up
				case 0:
					accept = true;
					var inp = instance_create_depth(0,0,0,obj_input);
					inp.pos = pos
					inp.input = "up"
					break;
					
				//down
				case 1:
					accept = true;
					var inp = instance_create_depth(0,0,0,obj_input);
					inp.pos = pos
					inp.input = "down"
					break;
				
				//left
				case 2:
					accept = true;
					var inp = instance_create_depth(0,0,0,obj_input);
					inp.pos = pos
					inp.input = "left"
					break;	
				
				//right
				case 3:
					accept = true;
					var inp = instance_create_depth(0,0,0,obj_input);
					inp.pos = pos
					inp.input = "right"
					break;
					
				//dash
				case 4:
					accept = true;
					var inp = instance_create_depth(0,0,0,obj_input);
					inp.pos = pos
					inp.input = "dash"
					break;
					
				//accept
				case 5:
					accept = true;
					var inp = instance_create_depth(0,0,0,obj_input);
					inp.pos = pos
					inp.input = "accept"
					break;
			
			
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