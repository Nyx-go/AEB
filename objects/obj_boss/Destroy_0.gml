global.boss_stat[0][1] = global.health;

if(global.boss_vaincu == 0){
	global.boss_vaincu++;
}

if(global.retry){
	
	if(global.boss_vaincu == 2){
		global.boss_stat[1][1] = global.boss_stat[0][1] - (global.boss_stat[1][0] - global.boss_stat[1][1])
		global.boss_stat[1][0] = global.boss_stat[0][1]
	}
}