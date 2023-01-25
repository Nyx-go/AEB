draw_set_font(f_arial_big)
draw_set_color(c_black)
draw_text(560, 150, "'Esc' = niveau suivant")
draw_set_font(f_arial)


for(var i=0; i<global.boss_vaincu; i++){
	
	draw_sprite(option[0][i], option[0][i], option_x + (350*i), option_y)
	if(pos != i){
		draw_sprite(spr_cadre_retry, spr_cadre_retry, option_x + (350*i), option_y)
	}else{
		draw_sprite(spr_cadre_retry_red, spr_cadre_retry_red, option_x + (350*i), option_y)
	}
	
}

for(var i=0; i<global.boss_vaincu; i++){
	
	draw_set_font(f_arial_big)
	draw_set_color(c_black)
	draw_text(option_x + (350*i) + 115, option_y + 175, option[1][i])
	draw_set_font(f_arial)

	
}








