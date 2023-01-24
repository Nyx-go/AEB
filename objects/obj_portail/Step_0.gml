//télépoter lorsque toucher

if(place_meeting(x,y,obj_player))
{
	game_end();
	instance_destroy();
}