kill_manager = compileFinal preprocessFileLineNumbers "scripts\shared\kill_manager.sqf";

build_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\build_remote_call.sqf";
build_fob_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\build_fob_remote_call.sqf";
recycle_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\recycle_remote_call.sqf";

remote_call_sector = compileFinal preprocessFileLineNumbers "scripts\client\remote_call_sector.sqf";
remote_call_fob = compileFinal preprocessFileLineNumbers "scripts\client\remote_call_fob.sqf";
remote_call_battlegroup = compileFinal preprocessFileLineNumbers "scripts\client\remote_call_battlegroup.sqf";
remote_call_endgame = compileFinal preprocessFileLineNumbers "scripts\client\remote_call_endgame.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\shared\scan_skill.sqf";

