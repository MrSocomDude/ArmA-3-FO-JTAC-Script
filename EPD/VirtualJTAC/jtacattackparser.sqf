/**
DO NOT EDIT THIS FILE. If you would like to remove certain ordinance or a category of ordinance, simply remove them from the EPDJtacAvailableAttacks array in jtacsettings.sqf.
**/

PARSE_AVAILABLE_JTAC_ATTACKS = {
	private ["_jtackAttackI", "_bulletsI"];

	private _bullets = [];
	private _shells = [];
	private _bombs = [];
	private _rockets = [];
	private _guidedMissiles = [];
	private _mines = [];
	private _strafingRun = [];
	private _smoke = [];
	private _night = [];

	private _numJtacAttacks = count EPDJtacAvailableAttacks;

	for "_jtackAttackI" from 0 to _numJtacAttacks -1 do {
		private _currentAttack = EPDJtacAvailableAttacks select _jtackAttackI;
		private _attackType = _currentAttack select 0;
		if(_attackType == "BULLETS") then {
			_bullets set [ count _bullets, [_currentAttack select 0, _currentAttack select 1, _currentAttack select 2, _currentAttack select 3, _currentAttack select 4, _currentAttack select 5]];
		} else { if(_attackType == "SHELLS") then {
			_shells set [ count _shells, [_currentAttack select 0, _currentAttack select 1, _currentAttack select 2, _currentAttack select 3, _currentAttack select 4, _currentAttack select 5]];
		} else { if(_attackType == "BOMBS") then {
			_bombs set [ count _bombs, [_currentAttack select 0, _currentAttack select 1, _currentAttack select 2, _currentAttack select 3, _currentAttack select 4, _currentAttack select 5]];
		} else { if(_attackType == "ROCKETS") then {
			_rockets set [ count _rockets, [_currentAttack select 0, _currentAttack select 1, _currentAttack select 2, _currentAttack select 3, _currentAttack select 4, _currentAttack select 5]];
		} else { if(_attackType == "GUIDEDMISSILE") then {
			_guidedMissiles set [ count _guidedMissiles, [_currentAttack select 0, _currentAttack select 1, _currentAttack select 2, _currentAttack select 3, _currentAttack select 4, _currentAttack select 5]];
		} else { if(_attackType == "MINES") then {
			_mines set [ count _mines, [_currentAttack select 0, _currentAttack select 1, _currentAttack select 2, _currentAttack select 3, _currentAttack select 4, _currentAttack select 5]];
		} else { if(_attackType == "STRAFINGRUN") then {
			_strafingRun set [ count _strafingRun, [_currentAttack select 0, _currentAttack select 1, _currentAttack select 2, _currentAttack select 3, _currentAttack select 4, _currentAttack select 5]];
		} else { if(_attackType == "SMOKE") then {
			_smoke set [ count _smoke, [_currentAttack select 0, _currentAttack select 1, _currentAttack select 2, _currentAttack select 3, _currentAttack select 4, _currentAttack select 5]];
		} else { if(_attackType == "NIGHT") then {
			_night set [ count _night, [_currentAttack select 0, _currentAttack select 1, _currentAttack select 2, _currentAttack select 3, _currentAttack select 4, _currentAttack select 5]];
		} else {
			diag_log format ["VirtualJTAC :::: Ignoring unknown payloadCategory for: %1",  _currentAttack];
		};};};};};};};};};
	};
	
	JtacMainMenu = [
		["EPD JTAC", true]
	];
	private _keyNumber = 2;

	private _bulletsCount = count _bullets;
	JtacBulletMenu = [["JTAC Bullets", true]];
	for "_bulletsI" from 0 to _bulletsCount -1 do {
		private _currentBullet = _bullets select _bulletsI;
		private _innerExpressionString = format ["[['%1', %2, %3, '[",  _currentBullet select 0, _currentBullet select 2, _currentBullet select 3] +
								"%1, %2," +
								format["%1", _currentBullet select 5] +
								format["] call %1;'], 'average'] call CLIENT_REQUEST_PERMISSION_TO_FIRE;", _currentBullet select 4];
		JtacBulletMenu set [_bulletsI + 1, 
			[_currentBullet select 1, [_bulletsI + 2], "", -5, [["expression", _innerExpressionString]], "1", "1"]
		];
	};

	if (count JtacBulletMenu > 1) then {
		JtacMainMenu = JtacMainMenu + [["Bullets", [_keyNumber], "#USER:JtacBulletMenu", -5, [["expression", ""]], "1", "1"]];
		_keyNumber = _keyNumber + 1;
	};

	_bulletsCount = count _shells;
	JtacShellMenu = [["JTAC Shells", true]];
	for "_bulletsI" from 0 to _bulletsCount -1 do {
		private _currentBullet = _shells select _bulletsI;
		private _innerExpressionString = format ["[['%1', %2, %3, '[",  _currentBullet select 0, _currentBullet select 2, _currentBullet select 3] +
								"%1, %2," +
								format["%1", _currentBullet select 5] +
								format["] call %1;'], 'average'] call CLIENT_REQUEST_PERMISSION_TO_FIRE;", _currentBullet select 4];
		JtacShellMenu set [_bulletsI + 1, 
			[_currentBullet select 1, [_bulletsI + 2], "", -5, [["expression", _innerExpressionString]], "1", "1"]
		];
	};

	if (count JtacShellMenu > 1) then {
		JtacMainMenu = JtacMainMenu + [["Shells", [_keyNumber], "#USER:JtacShellMenu", -5, [["expression", ""]], "1", "1"]];
		_keyNumber = _keyNumber + 1;
	};

	_bulletsCount = count _strafingRun;
	JtacStrafingRunMenu = [["JTAC Strafing Run", true]];
	for "_bulletsI" from 0 to _bulletsCount -1 do {
		private _currentBullet = _strafingRun select _bulletsI;
		private _innerExpressionString = format ["[['%1', %2, %3, '[",  _currentBullet select 0, _currentBullet select 2, _currentBullet select 3] +
								"%1, %2," +
								format["%1", _currentBullet select 5] +
								format["] call %1;'], 'average'] call CLIENT_REQUEST_PERMISSION_TO_FIRE;", _currentBullet select 4];
		JtacStrafingRunMenu set [_bulletsI + 1,
			[_currentBullet select 1, [_bulletsI + 2], "", -5, [["expression", _innerExpressionString]], "1", "1"]
		];
	};

	if (count JtacStrafingRunMenu > 1) then {
		JtacMainMenu = JtacMainMenu + [["Strafing Run", [_keyNumber], "#USER:JtacStrafingRunMenu", -5, [["expression", ""]], "1", "1"]];
		_keyNumber = _keyNumber + 1;
	};

	_bulletsCount = count _bombs;
	JtacBombsMenu = [["JTAC Bombs", true]];
	for "_bulletsI" from 0 to _bulletsCount -1 do {
		private _currentBullet = _bombs select _bulletsI;
		private _innerExpressionString = format ["[['%1', %2, %3, '[",  _currentBullet select 0, _currentBullet select 2, _currentBullet select 3] +
								"%1, %2," +
								format["%1", _currentBullet select 5] +
								format["] call %1;'], 'average'] call CLIENT_REQUEST_PERMISSION_TO_FIRE;", _currentBullet select 4];
		JtacBombsMenu set [_bulletsI + 1, 
			[_currentBullet select 1, [_bulletsI + 2], "", -5, [["expression", _innerExpressionString]], "1", "1"]
		];
	};

	if (count JtacBombsMenu > 1) then {
		JtacMainMenu = JtacMainMenu + [["Bombs", [_keyNumber], "#USER:JtacBombsMenu", -5, [["expression", ""]], "1", "1"]];
		_keyNumber = _keyNumber + 1;
	};

	_bulletsCount = count _rockets;
	JtacRocketsMenu = [["JTAC Rockets", true]];
	for "_bulletsI" from 0 to _bulletsCount -1 do {
		private _currentBullet = _rockets select _bulletsI;
		private _innerExpressionString = format ["[['%1', %2, %3, '[",  _currentBullet select 0, _currentBullet select 2, _currentBullet select 3] +
								"%1, %2," +
								format["%1", _currentBullet select 5] +
								format["] call %1;'], 'average'] call CLIENT_REQUEST_PERMISSION_TO_FIRE;", _currentBullet select 4];
		JtacRocketsMenu set [_bulletsI + 1,
			[_currentBullet select 1, [_bulletsI + 2], "", -5, [["expression", _innerExpressionString]], "1", "1"]
		];
	};

	if (count JtacRocketsMenu > 1) then {
		JtacMainMenu = JtacMainMenu + [["Rocket Barrage", [_keyNumber], "#USER:JtacRocketsMenu", -5, [["expression", ""]], "1", "1"]];
		_keyNumber = _keyNumber + 1;
	};
	
	_bulletsCount = count _guidedMissiles;
	JtacGuidedMissilesMenu = [["JTAC Guided Missiles", true]];
	for "_bulletsI" from 0 to _bulletsCount -1 do {
		private _currentBullet = _guidedMissiles select _bulletsI;
		private _innerExpressionString = format ["[['%1', %2, %3, '[",  _currentBullet select 0, _currentBullet select 2, _currentBullet select 3] +
								"_this select 0, %2," +
								format["""%1""", _currentBullet select 5 select 0] +
								format["] call %1;'], '%2'] call CLIENT_REQUEST_PERMISSION_TO_FIRE;", _currentBullet select 4, _currentBullet select 5 select 1];
		JtacGuidedMissilesMenu set [_bulletsI + 1,
			[_currentBullet select 1, [_bulletsI + 2], "", -5, [["expression", _innerExpressionString]], "1", "1"]
		];
	};

	if (count JtacGuidedMissilesMenu > 1) then {
		JtacMainMenu = JtacMainMenu + [["Guided Missiles", [_keyNumber], "#USER:JtacGuidedMissilesMenu", -5, [["expression", ""]], "1", "1"]];
		_keyNumber = _keyNumber + 1;
	};

	_bulletsCount = count _mines;
	JtacMinesMenu = [["JTAC Mines", true]];
	for "_bulletsI" from 0 to _bulletsCount -1 do {
		private _currentBullet = _mines select _bulletsI;
		private _innerExpressionString = format ["[['%1', %2, %3, '[",  _currentBullet select 0, _currentBullet select 2, _currentBullet select 3] +
								"%1, %2," +
								format["%1", _currentBullet select 5] +
								format["] call %1;'], 'average'] call CLIENT_REQUEST_PERMISSION_TO_FIRE;", _currentBullet select 4];
		JtacMinesMenu set [_bulletsI + 1,
			[_currentBullet select 1, [_bulletsI + 2], "", -5, [["expression", _innerExpressionString]], "1", "1"]
		];
	};

	if (count JtacMinesMenu > 1) then {
		JtacMainMenu = JtacMainMenu + [["Mine Field", [_keyNumber], "#USER:JtacMinesMenu", -5, [["expression", ""]], "1", "1"]];
		_keyNumber = _keyNumber + 1;
	};

	_bulletsCount = count _smoke;
	JtacSmokeMenu = [["JTAC Smoke", true]];
	for "_bulletsI" from 0 to _bulletsCount -1 do {
		private _currentBullet = _smoke select _bulletsI;
		private _innerExpressionString = format ["[['%1', %2, %3, '[",  _currentBullet select 0, _currentBullet select 2, _currentBullet select 3] +
								"%1, %2," +
								format["%1", _currentBullet select 5] +
								format["] call %1;'], 'average'] call CLIENT_REQUEST_PERMISSION_TO_FIRE;", _currentBullet select 4];
		JtacSmokeMenu set [_bulletsI + 1,
			[_currentBullet select 1, [_bulletsI + 2], "", -5, [["expression", _innerExpressionString]], "1", "1"]
		];
	};

	if (count JtacSmokeMenu > 1) then {
		JtacMainMenu = JtacMainMenu + [["Smoke", [_keyNumber], "#USER:JtacSmokeMenu", -5, [["expression", ""]], "1", "1"]];
		_keyNumber = _keyNumber + 1;
	};

	_bulletsCount = count _night;
	JtacNightMenu = [["JTAC Night", true]];
	for "_bulletsI" from 0 to _bulletsCount -1 do {
		private _currentBullet = _night select _bulletsI;
		private _innerExpressionString = format ["[['%1', %2, %3, '[",  _currentBullet select 0, _currentBullet select 2, _currentBullet select 3] +
								"%1, %2," +
								format["%1", _currentBullet select 5] +
								format["] call %1;'], 'average'] call CLIENT_REQUEST_PERMISSION_TO_FIRE;", _currentBullet select 4];
		JtacNightMenu set [_bulletsI + 1,
			[_currentBullet select 1, [_bulletsI + 2], "", -5, [["expression", _innerExpressionString]], "1", "1"]
		];
	};

	if (count JtacNightMenu > 1) then {
		JtacMainMenu = JtacMainMenu + [["Night", [_keyNumber], "#USER:JtacNightMenu", -5, [["expression", ""]], "1", "1"]];
		_keyNumber = _keyNumber + 1;
	};

	JtacDirectionsMenu = [
		["Fire Direction", true],
		["Random", [2], "", -5, [["expression", "JtacIncomingAngle = 'RANDOM'; titleText ['Fire missions will fire from a random direction.', 'PLAIN']; titleFadeOut 2;"]], "1", "1"],
		["North", [3], "", -5, [["expression", "JtacIncomingAngle = 0; titleText ['Fire missions will fire from the North.', 'PLAIN']; titleFadeOut 2;"]], "1", "1"],
		["Northwest", [4], "", -5, [["expression", "JtacIncomingAngle = 315; titleText ['Fire missions will fire from the Northwest.', 'PLAIN']; titleFadeOut 2;"]], "1", "1"],
		["Northeast", [5], "", -5, [["expression", "JtacIncomingAngle = 45; titleText ['Fire missions will fire from the Northeast.', 'PLAIN']; titleFadeOut 2;"]], "1", "1"],
		["West", [6], "", -5, [["expression", "JtacIncomingAngle = 270; titleText ['Fire missions will fire from the West.', 'PLAIN']; titleFadeOut 2;"]], "1", "1"],
		["East", [7], "", -5, [["expression", "JtacIncomingAngle = 90; titleText ['Fire missions will fire from the East.', 'PLAIN']; titleFadeOut 2;"]], "1", "1"],
		["South", [8], "", -5, [["expression", "JtacIncomingAngle = 180; titleText ['Fire missions will fire from the South.', 'PLAIN']; titleFadeOut 2;"]], "1", "1"],
		["Southwest", [9], "", -5, [["expression", "JtacIncomingAngle = 225; titleText ['Fire missions will fire from the Southwest.', 'PLAIN']; titleFadeOut 2;"]], "1", "1"],
		["Southeast", [10], "", -5, [["expression", "JtacIncomingAngle = 135; titleText ['Fire missions will fire from the Southeast.', 'PLAIN']; titleFadeOut 2;"]], "1", "1"]
	];
	JtacMainMenu = JtacMainMenu + [["Fire Direction", [_keyNumber], "#USER:JtacDirectionsMenu",-5,[["expression",""]],"1","1"]];
	_keyNumber = _keyNumber + 1;

	JtacTargetingMethodMenu = [
		["Targeting Method", true],
		["Laser", [2], "", -5, [["expression", "JtacTargetingMethod = 'LASER'; titleText ['Targets will be selected using your laser designator.', 'PLAIN']; titleFadeOut 3;"]], "1", "1"],
		["Map", [3], "", -5, [["expression", "JtacTargetingMethod = 'MAP'; titleText ['Targets will be selected using your map.', 'PLAIN']; titleFadeOut 3;"]], "1", "1"]
	];
	JtacMainMenu = JtacMainMenu + [["Targeting Method", [_keyNumber], "#USER:JtacTargetingMethodMenu",-5,[["expression",""]],"1","1"]];

	_keyNumber = _keyNumber + 1;
	JtacMainMenu = JtacMainMenu + [["Reload Status", [_keyNumber], "",-5,[["expression","player remoteExec ['GET_RELOAD_STATUS_ARRAY', 2, false];"]],"1","1"]];
};
