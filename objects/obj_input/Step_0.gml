//change input variable
var check = false, c_input;
for (i=0; i<array_length(global.stock_input); i++){
	check = check || (global.stock_input[i] == keyboard_lastkey);
}

if not check{
	c_input = keyboard_lastkey;
	
	if (input == "up"){
		global.up = c_input
		global.option[menu_level,pos] = "Up (" + string(chr(global.up)) + ")";
	}else if (input == "right"){
		global.right = c_input
		global.option[menu_level,pos] = "Right (" + string(chr(global.right)) + ")";
	}else if (input == "down"){
		global.down = c_input
		global.option[menu_level,pos] = "Down (" + string(chr(global.down)) + ")";
	}else if (input == "left"){
		global.left = c_input
		global.option[menu_level,pos] = "Left (" + string(chr(global.left)) + ")";
	}else if (input == "accept"){
		global.accept = c_input
		global.option[menu_level,pos] = "Enter (" + string(chr(global.accept_key)) + ")";
	}
	else if (input == "dash") {
		global.dash = c_input
	}
	global.stock_input = [global.up, global.right, global.down, global.left, global.dash , global.accept];
	instance_destroy()
}
else if (keyboard_lastkey == global.stock_input[pos]){
	instance_destroy();
}