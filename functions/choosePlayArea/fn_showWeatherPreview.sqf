disableSerialization;
"showWeatherPreview" cutRsc ["RscPIP","PLAIN",0,true];

private _pipDisplay = uinamespace getVariable "RscPIP";
private _pipPIPCtrl = _pipDisplay displayCtrl 2300;

private _rendertarget = "renderToPIP";
private _cam = "camera" camCreate [worldSize/2,worldSize/2,20];
_cam cameraEffect ["Fixed", "FRONT", _rendertarget];
_cam camPreload 0;

_pipPIPCtrl ctrlsettext format ["#(argb,256,256,1)r2t(%1,1.0)",_rendertarget];
