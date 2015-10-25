if ( isNil "GRLIB_respawn_loadout" ) then {
	removeAllWeapons player;
	player linkItem "NVGoggles";
} else {
	[ player, GRLIB_respawn_loadout ] call F_setLoadout;
};