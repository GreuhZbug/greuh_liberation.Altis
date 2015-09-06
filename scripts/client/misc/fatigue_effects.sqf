if ( GRLIB_fatigue > 0.1 && GRLIB_fatigue < 0.9 ) then {

	private [ "_oldfatigue", "_newfatigue", "_fatigueincrease" ];

	_oldfatigue = 0;
	_fatigueincrease = 0;
	_newfatigue = 0;

	while { true } do {
		waitUntil { alive player };
		_newfatigue = getFatigue player;
		if ( _newfatigue > _oldfatigue ) then {
			_fatigueincrease = GRLIB_fatigue * (_newfatigue - _oldfatigue);
			player setFatigue (_oldfatigue + _fatigueincrease);
			_oldfatigue = getFatigue player;
		};

		sleep 1;
	};
};