if(boss_health <= 0){
	boss_health = 0;
	//instance_destroy(obj_vie);
	instance_create_depth(1266,484,0,obj_portail);
	instance_destroy();
}