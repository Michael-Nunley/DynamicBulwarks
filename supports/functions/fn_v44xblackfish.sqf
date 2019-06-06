/**
*  fn_v44xblackfish
*
*  Spawns a V-44 X Blackfish (Armed), and puts the purchaser and who ever is closest(if they exist) as left and right gunners, respectively.
*  Based off of fn_droneControl.
*
*  Domain: Server
**/

//--- Sorting function
// see https://forums.bohemia.net/forums/topic/123243-getpos-nearest-player/
SortByDistance = {
Private["_current","_nearest","_nearestDistance","_object","_objects","_sorted"];

_object = _this select 0;
_objects = +(_this select 1);

_sorted = [];
for '_i' from 0 to count(_objects)-1 do {
	_nearest = ObjNull;
	_nearestDistance = 100000;

	for '_j' from count(_objects)-1 to 0 step -1 do {
		_current = _objects select _j;
		_distance = _current distance _object;
		if (_distance < _nearestDistance) then {_nearest = _current;_nearestDistance = _distance};
	};

	_sorted = _sorted + [_nearest];
	_objects = _objects - [_nearest];
};

_sorted
};


//--- Determine the players if MP, else use player itself.
_units = [player];
if (isMultiplayer) then {
_units = [];
{if (isPlayer _x) then {_units = _units + [_x]}} forEach playableUnits;
};
_sorted = [_player, _units] Call SortByDistance;



_player = _this select 0;
_player2 = _sorted select 0;
_uavSpawnPos = [_player, 1500, 1550, 0, 1] call BIS_fnc_findSafePos;
_dirToPlayer = _uavSpawnPos getDir _player;
_playerPos = getPos _player;



//if _player2 = _player then false

_player addweapon "B_UavTerminal";
_player connectTerminalToUAV objNull;
_drone = [[_uavSpawnPos select 0, _uavSpawnPos select 1, (_playerPos select 2) + 500], _dirToPlayer + 35, "B_T_VTOL_01_armed_F", WEST] call BIS_fnc_spawnVehicle;
_drone =

_supportUav = _drone select 0;
_uavGroup = _drone select 2;
mainZeus addCuratorEditableObjects [[_supportUav], true];

_bulwarkPos = position bulwarkBox;
_loiterWP = (_uavGroup) addWaypoint [[_bulwarkPos select 0, _bulwarkPos select 1, (_bulwarkPos select 2) + 500], 0];
_loiterWP setWaypointType "LOITER";
_loiterWP setWaypointLoiterType "CIRCLE_L";
_loiterWP setWaypointLoiterRadius 600;
_uavGroup setCurrentWaypoint _loiterWP;

sleep 2;

_bool = _player connectTerminalToUAV _supportUav;
_player remoteControl driver _supportUav;
driver _supportUav switchCamera "Internal";

sleep 600;
if (alive _supportUav) then {
  _supportUav setDamage 1;
};
