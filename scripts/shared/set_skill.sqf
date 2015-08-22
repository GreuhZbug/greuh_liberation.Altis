params [ "_unit"];
private [ "_side", "_wounded", "_skillmodifier" ];

_side = side _unit;
_wounded = false;
(group _unit) allowFleeing 0;
if ( damage _unit > 0.25 ) then { _wounded = true; };

_skillmodifier = sqrt GRLIB_difficulty_modifier;

if ( _wounded ) then {
	_unit setSkill ["aimingspeed", [ 0.15 * _skillmodifier ] call F_limitSkill ];
	_unit setSkill ["aimingaccuracy", [ 0.03 * _skillmodifier ] call F_limitSkill ];
	_unit setSkill ["aimingshake", 0];
	_unit setSkill ["spottime", 0.5];
	_unit setSkill ["spotdistance", 0.25];
	_unit setSkill ["commanding", 0.1];
	_unit setSkill ["reloadSpeed", 0.1];
} else {
	if ( _side == WEST || _side == EAST ) then {
		_unit setSkill ["aimingspeed", [ 0.4 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["aimingaccuracy", [ 0.33 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["aimingshake", [ 0.5 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["spottime", [ 1.0 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["spotdistance", [ 0.75 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["commanding", 1.0];
		_unit setSkill ["reloadSpeed", 0.75];
	} else {
		_unit setSkill ["aimingspeed", [ 0.4 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["aimingaccuracy", [ 0.25 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["aimingshake", [ 0.35 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["spottime", [ 0.8 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["spotdistance", [ 0.4 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["commanding", 1.0];
		_unit setSkill ["reloadSpeed", 0.5];
	};
};