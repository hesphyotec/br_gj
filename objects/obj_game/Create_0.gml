global.cs_active = false;
global.can_charge = true;
global.can_attack = true;
global.can_abil = true;
global.can_release = true;
global.musicvol = global.user_data[$"musicvol"];
global.effectvol = global.user_data[$"effectvol"];
global.mastervol = global.user_data[$"mastervol"];
global.pause = false;
global.sigils_unlocked = global.user_data[$"sigils"];
global.active_sigils =[0];
global.level_unl = global.user_data[$"level"];
global.player_dead = false;

respawn_charge = 0;

resume = function(){
	instance_activate_all();
	global.pause = false;
	obj_mainmenu.enabled = false;
}