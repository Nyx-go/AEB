var accept_key = keyboard_check_pressed(global.accept);

if (accept_key) {
	audio_play_sound(sound_accept,500,false);
}
