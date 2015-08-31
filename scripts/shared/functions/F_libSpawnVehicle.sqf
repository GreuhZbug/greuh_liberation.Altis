
_sectorpos = _this select 0;
_classname = _this select 1;
_newvehicle = objNull;

_spawnpos = [0,0,0];
while { surfaceIsWater _spawnpos } do {
	_spawnpos = ( [ _sectorpos, random 150, random 360 ] call bis_fnc_relpos ) findEmptyPosition [10, 100, 'B_Heli_Transport_01_camo_F'];
	if ( count _spawnpos == 0 ) then { _spawnpos = [0,0,0]; };
};

_newvehicle = objNull;
if ( _classname in opfor_choppers ) then {
	_newvehicle = createVehicle [_classname, _spawnpos, [], 0, 'FLY'];
	_newvehicle flyInHeight (100 + (random 200));
} else {
	_newvehicle = _classname createVehicle _spawnpos;
	_newvehicle setpos _spawnpos;
};
_newvehicle allowdamage false;

clearWeaponCargoGlobal _newvehicle;
clearMagazineCargoGlobal _newvehicle;
clearItemCargoGlobal _newvehicle;
clearBackpackCargoGlobal _newvehicle;

if ( _classname in militia_vehicles ) then {
	[ _newvehicle ] call F_libSpawnMilitiaCrew;
} else {
	createVehicleCrew _newvehicle;
	sleep 0.1;
	{ _x addMPEventHandler ['MPKilled', {_this spawn kill_manager}]; } foreach (crew _newvehicle);
};

_newvehicle addMPEventHandler ['MPKilled', {_this spawn kill_manager}];
_newvehicle setdir (random 360);
_newvehicle setVectorUp surfaceNormal position _newvehicle;

sleep 0.1;
_newvehicle allowdamage true;
_newvehicle setdamage 0;

[ _newvehicle ] spawn csat_abandon_vehicle;

_newvehicle
