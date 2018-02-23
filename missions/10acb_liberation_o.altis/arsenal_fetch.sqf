//spawn or execVM on a dedicated server only
private ["_result","_comp"];
waitUntil {
	if ("url_fetch" callExtension format [
		"%1",
		_this
	] == "OK") exitWith {true};
	false
};
waitUntil {
	_result = "url_fetch" callExtension "OK";
	if (_result != "WAIT") exitWith {true};
	false
};
if (_result == "ERROR") exitWith {
	//deal with error here
	diag_log format [
		">>> [url_fetch v2.0] >>> ERROR: %1; ARGUMENTS: %2",
		"url_fetch" callExtension "ERROR",
		_this
	];
};
//deal with result here
_comp = compile _result; 
call _comp;