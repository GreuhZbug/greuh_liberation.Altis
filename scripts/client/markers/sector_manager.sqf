private [ "_sector_count" ];

waitUntil { !isNil "sectors_allSectors" };
waitUntil { !isNil "save_is_loaded" };
waitUntil { !isNil "blufor_sectors" };

_sector_count = -1;

uiSleep 1;

while { true } do {
	waitUntil {
		uiSleep 1;
		count blufor_sectors != _sector_count
	};

	{ _x setMarkerColorLocal "ColorOPFOR"; } foreach (sectors_allSectors - blufor_sectors);
	{ _x setMarkerColorLocal "ColorBLUFOR"; } foreach blufor_sectors;

	_sector_count = count blufor_sectors;
};