obj_boss1.boss_health -= global.damage;
audio_play_sound(sound_damaged_boss,10,false);
instance_destroy();
