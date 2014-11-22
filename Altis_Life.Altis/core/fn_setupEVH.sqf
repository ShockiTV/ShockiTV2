/*
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call life_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Fired",{_this call life_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
"life_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
if(playerSide != west) then {
     player addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count __GETC__(life_safe_points) > 0) then
            {
             	deleteVehicle (_this select 6);
             	[[getPlayerUID player,name player,"188"],"life_fnc_wantedAdd",false,false]
             	[[player,false],"life_fnc_jail",player,false] spawn life_fnc_MP;
             	titleText [localize "STR_Safe_Zone", "PLAIN", 3];
             };
     }];  
};