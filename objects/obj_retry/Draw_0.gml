for(var i=0; i<global.boss_vaincu; i++){
	
	draw_sprite(option[i], option[i], option_x + (350*i), option_y)
	if(pos != i){
		draw_sprite(spr_cadre_retry, spr_cadre_retry, option_x + (350*i), option_y)
	}else{
		draw_sprite(spr_cadre_retry_red, spr_cadre_retry_red, option_x + (350*i), option_y)
	}
}








