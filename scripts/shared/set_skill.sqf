_unit = _this select 0;
_side = side _unit;
_wounded = false;
(group _unit) allowFleeing 0;
if ( damage _unit > 0.25 ) then { _wounded = true; };

if ( _wounded ) then {
	_unit setSkill ["aimingspeed", 0.15];
	_unit setSkill ["aimingaccuracy", 0.05];
	_unit setSkill ["aimingshake", 0];
	_unit setSkill ["spottime", 0.5];
	_unit setSkill ["spotdistance", 0.25];
	_unit setSkill ["commanding", 0.1];
	_unit setSkill ["reloadSpeed", 0.1];
} else {
	if ( _side == WEST || _side == EAST ) then {
		_unit setSkill ["aimingspeed", 0.25];
		_unit setSkill ["aimingaccuracy", 0.25];
		_unit setSkill ["aimingshake", 0.3];
		_unit setSkill ["spottime", 1.0];
		_unit setSkill ["spotdistance", 0.75];
		_unit setSkill ["commanding", 1.0];
		_unit setSkill ["reloadSpeed", 0.5];
	} else {
		_unit setSkill ["aimingspeed", 0.2];
		_unit setSkill ["aimingaccuracy", 0.2];
		_unit setSkill ["aimingshake", 0.2];
		_unit setSkill ["spottime", 1.0];
		_unit setSkill ["spotdistance", 0.5];
		_unit setSkill ["commanding", 1.0];
		_unit setSkill ["reloadSpeed", 0.25];
	};
};