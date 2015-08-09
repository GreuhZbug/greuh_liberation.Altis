_idact = -1;
while { true } do {
	waitUntil{ alive player };
	_idact = player addAction ["<t color='#FF8000'>-- GREUH Options --</t>","GREUH\scripts\GREUH_dialog.sqf","",-999,false,true];
	waitUntil{ !alive player};
};