//télépoter lorsque toucher

if(place_meeting(x,y,obj_player))
{
	if(global.boss_vaincu == 3){
		room_goto(scene_win);
	}
	else
	{
		room_goto(remonte_le_temps_menu)
	}
	instance_destroy();
}