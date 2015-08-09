
_labelwidth = -1;
_labelpos = [];
_tick = 0;

while { dialog && alive player } do {
	if ( !isNil "public_bleedout_message" && !isNil "public_bleedout_timer") then {
		if (_labelwidth == -1) then { _labelwidth = (ctrlPosition ((findDisplay 5566) displayCtrl 6699)) select 2 };
		_labelpos = [ctrlPosition ((findDisplay 5566) displayCtrl 6699) select 0, ctrlPosition ((findDisplay 5566) displayCtrl 6699) select 1,_labelwidth * (public_bleedout_timer / FAR_BleedOut), ctrlPosition ((findDisplay 5566) displayCtrl 6699) select 3];
		((findDisplay 5566) displayCtrl 6699) ctrlSetPosition _labelpos;
		ctrlSetText [5567,public_bleedout_message];
				
		if (public_bleedout_timer <= 30) then {
			((findDisplay 5566) displayCtrl 5567) ctrlSetTextColor [1, 0, 0, 1];
			if ( public_bleedout_timer % 2 == 0 ) then {
				((findDisplay 5566) displayCtrl 6698) ctrlSetTextColor [1, 0, 0, 1];
			} else {
				((findDisplay 5566) displayCtrl 6698) ctrlSetTextColor [1, 1, 1, 1];
			}
		} else {
			((findDisplay 5566) displayCtrl 5567) ctrlSetTextColor [1, 1, 1, 1];
		};
		((findDisplay 5566) displayCtrl 6699) ctrlCommit 0.5;
		((findDisplay 5566) displayCtrl 6698) ctrlCommit 0.5;
		
	};
	if ( _tick % 5 == 0 ) then {
		[ 10000 ] call BIS_fnc_bloodEffect;
	};
	_tick = _tick + 1;
	sleep 0.5;
};