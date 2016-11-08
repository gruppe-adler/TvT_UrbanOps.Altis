/*    Executes all passed scripts sequentially
*
*     Params:
*     0-99    path to script
*/

[_this] spawn {
    {
        if (typeName _x == "STRING") then {
            _handle = execVM _x;
            waitUntil {scriptDone _handle};
        };

        if (typeName _x == "CODE") then {
            call _x;
        };

    } forEach _this;
};
