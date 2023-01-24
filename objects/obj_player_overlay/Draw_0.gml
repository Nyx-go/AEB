//overlay
draw_health_ = lerp(draw_health_, global.health, .5);

//health
draw_sprite(spr_player_health_bar, spr_player_health_bar, 5, 5)
draw_healthbar(51,21,251,51, (draw_health_/global.max_health)*100, c_black,  c_red, c_green, 0, true, true)

draw_set_color(c_black);
draw_text(15, 26, string(global.health))

//shield
draw_healthbar(0, 60, 251, 70, (obj_player.shield_dispo/obj_player.max_shield)*100, c_black, c_aqua, c_blue, 0, true, true);
if(obj_player.overshield){
	draw_sprite(spr_icon_shield_break, spr_icon_shield_break, 261, 50)
}else{
	draw_sprite(spr_icon_shield, spr_icon_shield, 261, 50)
}

//dash
for(var i=0; i<obj_player.dash_dispo; i++){
	draw_sprite(spr_player_dash, spr_player_dash, 260+i*32, 10)
}