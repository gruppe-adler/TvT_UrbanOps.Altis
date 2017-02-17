/* Draws all locations on the entire map
*
*/

//let everyone find locations
_searchRadius = 15000;
_worldCenter = [worldSize / 2,worldSize / 2];

LOCATION_ALLVILLAGES = [nearestLocations [_worldCenter, ["NameVillage"], _searchRadius]] call uo_setup_fnc_filterLocations;
LOCATION_ALLCITIES = [nearestLocations [_worldCenter, ["NameCity"], _searchRadius]] call uo_setup_fnc_filterLocations;
LOCATION_ALLCAPITALS = [nearestLocations [_worldCenter, ["NameCityCapital"], _searchRadius]] call uo_setup_fnc_filterLocations;
LOCATION_ALLOTHER = [nearestLocations [_worldCenter, ["NameLocal"], _searchRadius]] call uo_setup_fnc_filterLocations;

//only draw on server
if (!isServer) exitWith {};

LOCATIONMARKERS = [];

for "_i" from 0 to count LOCATION_ALLVILLAGES -1 do {
	_loc = LOCATION_ALLVILLAGES select _i;
	_locationName = text _loc;
	_pos = locationPosition _loc;

	_markername = "Location_" + _locationName;
	_marker = createMarker [_markername, _pos];
	_marker setMarkerColor "COLORBLACK";
	_marker setMarkerShape "ELLIPSE";
 	_marker setMarkerBrush "Border";
	_marker setMarkerSize [VILLAGEMARKERSIZE, VILLAGEMARKERSIZE];

	LOCATIONMARKERS pushBack _markername;
};

for "_i" from 0 to count LOCATION_ALLCITIES -1 do {
	_loc = LOCATION_ALLCITIES select _i;
	_locationName = text _loc;
	_pos = locationPosition _loc;

	_markername = "Location_" + _locationName;
	_marker = createMarker [_markername, _pos];
	_marker setMarkerColor "COLORBLACK";
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerBrush "Border";
	_marker setMarkerSize [CITYMARKERSIZE, CITYMARKERSIZE];

	LOCATIONMARKERS pushBack _markername;
};

for "_i" from 0 to count LOCATION_ALLCAPITALS -1 do {
	_loc = LOCATION_ALLCAPITALS select _i;
	_locationName = text _loc;
	_pos = locationPosition _loc;

	_markername = "Location_" + _locationName;
	_marker = createMarker [_markername, _pos];
	_marker setMarkerColor "COLORBLACK";
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerBrush "Border";
	_marker setMarkerSize [CAPITALMARKERSIZE, CAPITALMARKERSIZE];

	LOCATIONMARKERS pushBack _markername;
};

for "_i" from 0 to count LOCATION_ALLOTHER -1 do {
	_loc = LOCATION_ALLOTHER select _i;
	_locationName = text _loc;
	_pos = locationPosition _loc;

	_markername = "Location_" + _locationName;
	_marker = createMarker [_markername, _pos];
	_marker setMarkerColor "COLORBLACK";
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerBrush "Border";
	_marker setMarkerSize [OTHERMARKERSIZE, OTHERMARKERSIZE];

	LOCATIONMARKERS pushBack _markername;
};

["LOG", "SERVER_SETUP", format ["fn_setLocationMarkers - Created %1 location markers.", count LOCATIONMARKERS]] call uo_common_fnc_diagReport;
