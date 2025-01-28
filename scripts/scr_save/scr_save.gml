// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_json(_struct, _name){
	var _json_string = json_stringify(_struct);
	var _buffer = buffer_create(string_byte_length(_json_string)+1,buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json_string);
	buffer_save(_buffer, _name);
	buffer_delete(_buffer);
}

function scr_load_json(_name){
	var _buffer = buffer_load("save_data.json");
	if (_buffer != -1){
		var _json_string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		return json_parse(_json_string);
	} else {
		return undefined;
	}
}

function user_data_struct() constructor {
	level = 0;
	sigils = [0,1,2,3,4,5,6];
	mastervol = 1;
	musicvol = 1;
	effectvol = 1;
	
	load_values = function(_data){
		var _load_data = _data;
		var _fields = variable_struct_get_names(_load_data);
		
		for (var i = 0; i < array_length(_fields); i++){
			self[$ _fields[i]] = _load_data[$ _fields[i]];	
		}
	}
	
	update_value = function(_name, _value) {
		self[$ _name] = _value;
		scr_save_json(self, "save_data.json");
	}
}