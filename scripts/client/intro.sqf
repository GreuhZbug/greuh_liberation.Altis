
if ( isNil "cinematic_camera_started" ) then { cinematic_camera_started = false };
sleep 0.5;
waitUntil { time > 0 };

[] spawn cinematic_camera;

sleep 1;

cutRsc ["intro1","PLAIN",1,true];

sleep 5.5;

cutRsc ["intro2","PLAIN",1,true];

sleep 10;


showcaminfo = true;

dostartgame = 0;
_dialog = createDialog "liberation_menu";
waitUntil { dialog };
waitUntil { dostartgame == 1 || !dialog };

closeDialog 0;
cinematic_camera_started = false;
introDone = true;