/*    Shows formatted hint during wave respawn time
*
*/

_rule = parseText "<t align='center'><t color='#708090'>-----------------------------------------------------<br /></t></t>";
_lineBreak = parseText "<br />";

_hintArray = [_rule];
{
    _hintArray pushBack _x;
    _hintArray pushBack _lineBreak;
} forEach _this;
_hintArray pushBack _rule;

hintSilent composeText _hintArray;
