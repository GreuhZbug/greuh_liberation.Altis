_squadcontrols = [511,512,513,514,515,521,522,523,524,525,526,527];
_platooncontrols = [611,612,613,614];
_viewcontrols = [712,713,714,722,723,724,732,733,734];
_worldcontrols = [812,813,814,815];
_markerscontrols = [911,912,913,914];
_allbuttons = [6677,511,512,513,514,613,614,812,813,814,815,913,914,712,722,732];
_rename_controls = [521,522,523,524,525,526,527];
_leader_controls = [561,562,563,564,565,566,567];
renaming = false;
choosingleader = false;

_dialog = createDialog "GREUH_Menu";
waitUntil { dialog };

if ( GREUH_allow_customsquads ) then {
	ctrlShow [501, false];
} else {
	ctrlShow [501, true];
	{ ctrlShow [_x, false] } foreach _squadcontrols;
};

if ( GREUH_allow_platoonview ) then {
	ctrlShow [601, false];
} else {
	ctrlShow [601, true];
	{ ctrlShow [_x, false] } foreach _platooncontrols;
};
	
if ( GREUH_allow_viewdistance ) then {
	ctrlShow [701, false];
	sliderSetRange [712, 1000, 10000];
	sliderSetPosition [712, desiredviewdistance_inf];
	sliderSetSpeed [712, 500, 500];
	sliderSetRange [722, 1000, 10000];
	sliderSetPosition [722, desiredviewdistance_veh];
	sliderSetSpeed [722, 500, 500];
	sliderSetRange [732, 30, 100];
	sliderSetPosition [732, desiredviewdistance_obj];
	sliderSetSpeed [732, 5, 5];
} else {
	ctrlShow [701, true];
	{ ctrlShow [_x, false] } foreach _viewcontrols;
};

if ( GREUH_allow_worldquality ) then {
	ctrlShow [801, false];
} else {
	ctrlShow [801, true];
	{ ctrlShow [_x, false] } foreach _worldcontrols;
};

if ( GREUH_allow_mapmarkers ) then {
	ctrlShow [901, false];
} else {
	ctrlShow [901, true];
	{ ctrlShow [_x, false] } foreach _markerscontrols;
};

while { dialog && alive player } do {

	if ( renaming ) then {
		{ ctrlEnable [_x, false] } foreach (_allbuttons);
		{ ctrlShow [_x, true] } foreach _rename_controls;
		{ ctrlShow [_x, false] } foreach _leader_controls;
	} else {
		if ( choosingleader ) then {
			{ ctrlEnable [_x, false] } foreach _allbuttons;
			{ ctrlShow [_x, false] } foreach _rename_controls;
			{ ctrlShow [_x, true] } foreach _leader_controls;
		} else {
			{ ctrlEnable [_x, true] } foreach _allbuttons;
			{ ctrlShow [_x, false] } foreach (_rename_controls + _leader_controls);
			ctrlEnable [513,(leader (group player) == player)];
			ctrlEnable [514,(leader (group player) == player)];
		};
	};
	
	if ( GREUH_allow_platoonview ) then { ctrlShow [612, show_platoon]; };
	if ( GREUH_allow_mapmarkers ) then { ctrlShow [912, show_teammates]; };
	if ( GREUH_allow_customsquads ) then {
		lbClear 515;
		{ 
			_brakets = "";
			if ( _x == group player ) then { _brakets = ">> "; };
			lbAdd [515, format [ "%4%1 - %2 (%3)",groupId _x, name leader _x, count units _x,_brakets ]]; 
		} foreach groups_list;
	};
	
	if ( GREUH_allow_viewdistance ) then {
		ctrlSetText [713, format [ '%1m' ,round desiredviewdistance_inf]];
		ctrlSetText [723, format [ '%1m' ,round desiredviewdistance_veh]];
		ctrlSetText [733, format [ '%1m' ,round ((desiredviewdistance_obj / 100.0) * desiredviewdistance_inf) ]];
	};
	
	uiSleep 0.1;
};

if (!alive player) then { closeDialog 0 };

greuh_options_profile = [ desiredviewdistance_inf, desiredviewdistance_veh, desiredviewdistance_obj,show_teammates,show_platoon ];
profileNamespace setVariable [ "GREUH_OPTIONS_PROFILE",greuh_options_profile ];
saveProfileNamespace;