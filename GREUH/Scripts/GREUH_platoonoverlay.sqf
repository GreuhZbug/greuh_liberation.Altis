platoon_icon1 = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
platoon_icon2 = "\A3\ui_f\data\igui\cfg\cursors\board_ca.paa";

["platoon_overlay", "onEachFrame", {

	if ( show_platoon ) then {
		_groups = [];
		{
			if (
			(!(_x in _groups)) && 
			(side _x == side player) && 
			((count units _x > 1) || ((count units _x == 1) && (leader _x != player))) &&
			(isplayer (leader _x))
			) then { _groups = _groups + [_x]; }; 
		} foreach allGroups;

		{
			if (count (units _x) != 0) then {
				totalx = 0; 
				totaly = 0;
				totalz = 0;
				_grouppos = [];
				unitstocount = [];
				{ 
					if ( _x distance (leader group _x) < 300) then {
						unitstocount = unitstocount + [_x];
						totalx = totalx + (getpos _x select 0); 
						totaly = totaly + (getpos _x select 1); 
						totalz = totalz + (getpos _x select 2); 
					};
				} foreach units _x;
				totalx = totalx / (count unitstocount);
				totaly = totaly / (count unitstocount);
				totalz = totalz / (count unitstocount);
				
				if ( totalz > 2.1 ) then { 
					_grouppos = [totalx, totaly, totalz + 10]; 
				} else { 
					_grouppos = [totalx, totaly, 2.1]; 
				};
				_alpha = 0.5;
				_textalpha = 0;
				_size = 0.8;
				
				_screenpos = worldToScreen _grouppos;
				
				if (count _screenpos != 0) then {
					if ( (abs (((worldToScreen _grouppos) select 0) - 0.5) < 0.06) && (abs (((worldToScreen _grouppos) select 1) - 0.5) < 0.08)) then {
						_alpha = 1;
						_textalpha = 1;
						_size = 1;
					};
				};
				
				_dist = player distance _grouppos;
				_distlabel = "";
				if ( _dist > 200 ) then {
					if ( _dist >= 1000 ) then {
						_distlabel = format [" (%1km)", floor (_dist / 1000)];
					} else {
						_distlabel = format [" (%1m)", (floor (_dist / 100)) * 100];
					};
				};
				
				_color = [0.8,1,0.2,_alpha];
				if ( _x == group player) then { _color = [1,0.9,0.3,_alpha] };
				drawIcon3D [platoon_icon1, _color, _grouppos, _size / 2, _size / 2,0, format ["%1 - %2%3",groupID _x, name (leader _x),_distlabel], 2, 0.03 * _textalpha, "puristaMedium"];
				drawIcon3D [platoon_icon2, _color, _grouppos, _size, _size,0, "", 2, 0.04, "puristaMedium"];
			};
		} foreach _groups;
	
	};
	
}] call BIS_fnc_addStackedEventHandler;