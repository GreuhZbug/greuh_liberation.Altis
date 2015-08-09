if (!isServer) exitWith {};

_new_fob = _this select 0;
all_fobs pushback _new_fob;
publicVariable "all_fobs";
trigger_server_save = true;

sleep 3;
[ [ _new_fob, 0 ] , "remote_call_fob" ] call BIS_fnc_MP;

stats_fobs_built = stats_fobs_built + 1;