//health

if(instance_exists(obj_boss1))
{
	draw_sprite(spr_boss_health_bar, spr_boss_health_bar, 1366-355, 5)
	draw_healthbar(1366-355+46, 21, (1366-355+345), 50, (obj_boss1.boss_health/obj_boss1.boss_max_health)*100, c_black, c_orange, c_yellow, 0, true, true);

	draw_set_color(c_black);
	draw_set_font(f_arial_big)
	draw_text(1366-325,60, "Cupid, le vif")
	draw_set_font(f_arial)
	
}else{
	draw_sprite(spr_boss_health_bar, spr_boss_health_bar, 1366-355, 5)

	draw_set_color(c_black);
	draw_set_font(f_arial_big)
	draw_text(1366-325,60, "Cupid, le vif")
	draw_set_font(f_arial)

}






