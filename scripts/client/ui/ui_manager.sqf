disableSerialization;

_overlayshown = false;
_sectorcontrols = [201,202,203,244,205];
GRLIB_ui_notif = "";

waitUntil { !isNil "synchro_done" };
waitUntil { synchro_done };

if ( isNil "cinematic_camera_started" ) then { cinematic_camera_started = false };

while { true } do {

	if ( isNull ((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (101)) && _overlayshown ) then { _overlayshown = false };
	if ( alive player && !dialog && !_overlayshown && !cinematic_camera_started ) then {
		cutRsc["statusoverlay", "PLAIN", 1];
		_overlayshown = true;
	};
	if ( ( !alive player || dialog || cinematic_camera_started ) && _overlayshown) then {
		cutRsc["blank", "PLAIN", 0];
		_overlayshown = false;
	};
	if ( _overlayshown ) then {
		((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (101)) ctrlSetText format [ "%1/%2",(floor resources_infantry),infantry_cap ];
		((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (102)) ctrlSetText format [ "%1",(floor resources_ammo) ];
		((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (103)) ctrlSetText format [ "%1/%2",(floor resources_fuel),fuel_cap ];
		((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (104)) ctrlSetText format [ "%1/%2",unitcap,([] call F_localCap) ];
		((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (105)) ctrlSetText format [ "%1%2",round(combat_readiness),"%" ];
		((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (266)) ctrlSetText format [ "%1", GRLIB_ui_notif ];
		((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (267)) ctrlSetText format [ "%1", GRLIB_ui_notif ];
		
		_color_readiness = [0.8,0.8,0.8,1];
		if ( combat_readiness >= 25 ) then { _color_readiness = [0.8,0.8,0,1] };
		if ( combat_readiness >= 50 ) then { _color_readiness = [0.8,0.6,0,1] };
		if ( combat_readiness >= 75 ) then { _color_readiness = [0.8,0.3,0,1] };
		if ( combat_readiness >= 100 ) then { _color_readiness = [0.8,0,0,1] };
		
		((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (105)) ctrlSetTextColor _color_readiness;
		((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (135)) ctrlSetTextColor _color_readiness;

		
		_nearest_active_sector = [ sector_size ] call F_getNearestSector;
		if ( _nearest_active_sector != "" ) then {
			_zone_size = capture_size;
			if ( _nearest_active_sector in sectors_bigtown ) then {
				_zone_size = capture_size * 2;
			};
			
			"zone_capture" setmarkerposlocal (markerpos _nearest_active_sector);
			_colorzone = "ColorGrey";
			if ( [ markerpos _nearest_active_sector, _zone_size ] call F_sectorOwnership == WEST ) then { _colorzone = "ColorBLUFOR" };
			if ( [ markerpos _nearest_active_sector, _zone_size ] call F_sectorOwnership == EAST ) then { _colorzone = "ColorOPFOR" };
			if ( [ markerpos _nearest_active_sector, _zone_size ] call F_sectorOwnership == RESISTANCE ) then { _colorzone = "ColorCivilian" };
			"zone_capture" setmarkercolorlocal _colorzone;
			
			_ratio = [_nearest_active_sector] call F_getForceRatio;
			_barwidth = 0.084 * safezoneW * _ratio;
			_bar = (uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (244);
			_bar ctrlSetPosition [(ctrlPosition _bar) select 0,(ctrlPosition _bar) select 1,_barwidth,(ctrlPosition _bar) select 3];
			_bar ctrlCommit 0; 
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (205)) ctrlSetText (markerText _nearest_active_sector);
			{ ((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (_x)) ctrlShow true; } foreach  _sectorcontrols;
			if ( _nearest_active_sector in blufor_sectors ) then {
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (205)) ctrlSetTextColor [0,0.2,0.7,1];
			} else {
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (205)) ctrlSetTextColor [0.7,0,0,1];
			};
			
			"zone_capture" setMarkerSizeLocal [ _zone_size,_zone_size ];
		} else {
			{ ((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (_x)) ctrlShow false; } foreach  _sectorcontrols;
			"zone_capture" setmarkerposlocal markers_reset;
		};
		
	};
	uiSleep 0.1;
};