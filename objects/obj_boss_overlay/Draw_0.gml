//health

if(instance_exists(obj_boss))
{
	draw_sprite(spr_boss_health_bar, spr_boss_health_bar, 1366-355, 5)
	draw_healthbar(1366-355+46, 21, (1366-355+345), 50, (obj_boss.boss_health/obj_boss.boss_max_health)*100, c_black, c_orange, c_yellow, 0, true, true);

	draw_set_color(c_black);
	draw_set_font(f_arial_big)
	draw_text(1366-325,60, "Aki, le plus ancien des dieux")
	draw_set_font(f_arial)
	
}else{
	draw_sprite(spr_boss_health_bar, spr_boss_health_bar, 1366-355, 5)

	draw_set_color(c_black);
	draw_set_font(f_arial_big)
	draw_text(1366-325,60, "Aki, le plus ancien des dieux")
	draw_set_font(f_arial)

}






