if (!isServer) exitWith {};

_object_recycled = _this select 0;
if ( isNull _object_recycled ) exitWith {};

deleteVehicle _object_recycled;
_objectinfo = ( [ (light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles + buildings ), { typeof _object_recycled == _x select 0 } ] call BIS_fnc_conditionalSelect ) select 0;
resources_ammo = resources_ammo + (round ((_objectinfo select 2) * recycling_percentage));
please_recalculate = true;
stats_vehicles_recycled = stats_vehicles_recycled + 1;