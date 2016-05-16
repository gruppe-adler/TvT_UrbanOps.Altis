/*  Sets up play area
*
*   executed via server\setup\chosenCityListener.sqf on server
*/

CITYPOSITION = locationPosition CHOSENLOCATION;
publicVariable "CITYPOSITION";

CITYAREASIZE = switch (type CHOSENLOCATION) do {
  case "NameVillage": {VILLAGEMARKERSIZE};
  case "NameCity": {CITYMARKERSIZE};
  case "NameCityCapital": {CAPITALMARKERSIZE};
  case "NameLocal": {OTHERMARKERSIZE};
};
publicVariable "CITYAREASIZE";

AIAREASIZE = CITYAREASIZE + 0.6 * CITYAREASIZE;
publicVariable "AIAREASIZE";

//DELETE LOCATION MARKERS ======================================================
{
  deleteMarker _x;
} forEach LOCATIONMARKERS;

//CREATE PLAY AREA MARKERS =====================================================
//city area
_marker = createMarker ["CITYAREAMARKER", CITYPOSITION];
_marker setMarkerColor "COLOREAST";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "Border";
_marker setMarkerSize [CITYAREASIZE, CITYAREASIZE];

//blufor distance
_marker = createMarker ["BLUFORSPAWNINNER", CITYPOSITION];
_marker setMarkerColor "COLORWEST";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "Border";
_marker setMarkerSize [BLUFORSPAWNDIST, BLUFORSPAWNDIST];

_marker = createMarker ["BLUFORSPAWNOUTER", CITYPOSITION];
_marker setMarkerColor "COLORWEST";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "Border";
_marker setMarkerSize [BLUFORSPAWNDIST+BLUFORSPAWNBAND, BLUFORSPAWNDIST+BLUFORSPAWNBAND];
