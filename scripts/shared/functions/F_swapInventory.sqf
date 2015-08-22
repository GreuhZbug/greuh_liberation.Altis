
_unit1 = _this select 0;
_unit2 = _this select 1;

removeAllWeapons _unit2;

if ( backpack _unit2 == '' && backpack _unit1 != '' ) then { 
	_unit2 addBackpack (backpack unit1); 
};

{ _unit2 addMagazine _x } foreach ( magazines _unit1 );

if ( primaryWeapon _unit1 != '' ) then { 
	_unit2 addWeapon ( primaryWeapon _unit1 );
	if ( count (primaryWeaponItems _unit1) > 0 ) then {
		{ _unit2 addPrimaryWeaponitem _x } foreach (primaryWeaponItems _unit1);
	};
};

if ( secondaryWeapon _unit1 != '' ) then { 
	_unit2 addWeapon ( secondaryWeapon _unit1 );
	if ( count (secondaryWeaponItems _unit1) > 0 ) then {
		{ _unit2 addSecondaryWeaponItem _x } foreach (secondaryWeaponItems _unit1);
	};
};

if ( handgunWeapon _unit1 != '' ) then { 
	_unit2 addWeapon ( handgunWeapon _unit1 );
	if ( count (handgunItems _unit1) > 0 ) then {
		{ _unit2 addHandgunItem _x } foreach (handgunItems _unit1);
	};
};
