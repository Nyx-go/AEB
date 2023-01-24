//overlay
draw_health_ = lerp(draw_health_, global.health, .5);

draw_sprite(spr_player_health_bar, spr_player_health_bar, 5, 5)
draw_set_color(c_green);
draw_rectangle(51, 21, 251*draw_health_/global.max_health, 51, false);

draw_set_color(c_black);
draw_text(15, 26, string(global.health))

draw_set_color(c_aqua);
draw_rectangle(0, 60, 251*obj_player.shield_dispo/obj_player.max_shield, 70, false);

for(var i=0; i<obj_player.dash_dispo; i++){
	draw_sprite(spr_player_dash, spr_player_dash, 260+i*32, 10)
}