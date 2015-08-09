_save_interval = 60;

while { endgame == 0 } do {
	sleep _save_interval;
	trigger_server_save = true;
};