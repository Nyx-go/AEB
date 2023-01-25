//télépoter lorsque toucher

if(place_meeting(x,y,obj_player))
{
	room_goto(remonte_le_temps_menu)
	instance_destroy();
}