params [ "_source", "_permission" ];
private [ "_uidvar", "_permissions", "_ret" ];

_ret = false;

if ( !GRLIB_permissions_param ) then {
	_ret = true;
} else {
	if ( !(isNil "GRLIB_permissions") && !(isNull _source) ) then {

		_uidvar = getPlayerUID _source;

		_permissions = [];
		{
			if ( _uidvar == _x select 0 ) exitWith { _permissions = _x select 1 };
		} foreach GRLIB_permissions;

		if ( count _permissions > _permission ) then {
			_ret = _permissions select _permission;
		};
	};
};

_ret