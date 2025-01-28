/// @description Insert description here
// You can write your code in this editor
global.user_data = new user_data_struct();

if (file_exists("save_data.json")){
	var _user_data = scr_load_json("user_data.json");
	
	global.user_data.load_values(_user_data);
}

scr_save_json(global.user_data, "user_data.json");





