disableSerialization;
_source = [14742.2,22059.1,7.00939];
_target = [15128.1,22241.8,0];
_renderTarget = "rendertarget0";
(["lvlayer0"] call bis_fnc_rscLayer) cutRsc ["previewWeather", "plain", 0, true];

_idc = 1600;
_display = uiNamespace getVariable "previewWeather";
_control =  _display displayCtrl _idc;
_pos = ctrlposition _control;
_pos set [3,(_pos select 2)];

_control ctrlSetText format ["#(argb,512,512,1)r2t(%1,1.0)",_renderTarget];
_control ctrlSetTextColor [1,1,1,1];
_control ctrlCommit 0;

_camera = "camera" camCreate getpos player;
_camera camPreparePos _source;
_camera camPrepareTarget _target;
_camera camCommitPrepared 0;
_camera cameraEffect ["internal", "back", _renderTarget];
