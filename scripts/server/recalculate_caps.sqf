base_infantry_cap = 50;
base_fuel_cap = 20;

infantry_cap = base_infantry_cap;
fuel_cap = base_fuel_cap;

{
	if ( _x in sectors_capture ) then {
		infantry_cap = infantry_cap + 10;
	};
	if ( _x in sectors_factory ) then {
		fuel_cap = fuel_cap + 20;
	};
} foreach blufor_sectors;