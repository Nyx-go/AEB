op_border = 8 ;
op_space = 24 ;

pos=0;

//menu principal
option[0,0] = "Play";
option[0,1] = "Tuto (not implemented)";
option[0,2] = "Settings";
option[0,3] = "Quit game";

//sous menu play
option[1,0] = "Start";
option[1,1] = "Saves (not implemented)";
option[1,2] = "Back";

//sous menu settings
option[2,0] = "Controls";
option[2,1] = "Fullscreen";
option[2,2] = "Sound (NI)";
option[2,3] = "Back";

//sous menu contrôles
option[3,0] = "Up ("+ string(chr(global.up)) + ")";
option[3,1] = "Down ("+ string(chr(global.down)) + ")";
option[3,2] = "Left ("+ string(chr(global.left)) + ")";
option[3,3] = "Right ("+ string(chr(global.right)) + ")";
option[3,4] = "Dash ("+ string(chr(global.dash)) + ")";
option[3,5] = "Accept ("+ string(chr(global.accept)) + ")";
option[3,6] = "Back";

op_length = 0;
menu_level = 0;
accept=false;