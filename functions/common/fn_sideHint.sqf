params ["_side", "_lines"];

if (!hasInterface) exitWith {};
if (side player != _side) exitWith {};

if (typeName _lines != "ARRAY") then {_lines = [_lines]};

_rule = parseText "<t align='center'><t color='#708090'>-----------------------------------------------------<br /></t></t>";
_lineBreak = parseText "<br />";

_hintArray = [_rule];
{
    if (typeName _x == "TEXT") then {
        _hintArray pushBack _x;
    } else {
        _hintArray pushBack parseText format ["<t align='center' size='1.4'>%1</t>",_x];
    };

    _hintArray pushBack _lineBreak;
} forEach _lines;
_hintArray pushBack _rule;

hint composeText _hintArray;
