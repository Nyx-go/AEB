if(!obj_player.shield_on && !obj_player.dash_on){
	global.health -= obj_boss2.damage;
	audio_play_sound(sound_damaged_player,8,false);
}
instance_destroy();








