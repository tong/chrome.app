package chrome;

import js.html.ArrayBuffer;

typedef OpenOptions = {
	var bitrate : Int;
}

typedef OpenInfo = {
	var connectionId : Int;
}

typedef ReadInfo = {
	var bytesRead : Int;
	var data : ArrayBuffer;
}

typedef WriteInfo = {
	var bytesWritten : Int;
}

typedef ControlSignalOptions = {
	@:optional var cts : Bool;
	@:optional var dcd : Bool;
	@:optional var dtr : Bool;
	@:optional var rts : Bool;
}

@:require(chrome_app)
@:native("chrome.serial") extern class Serial {
	static function getPorts( cb : Array<String>->Void ) : Void;
	static function open( port : String, ?options : OpenOptions, cb : OpenInfo->Void ) : Void;
	static function close( connectionId : Int, cb : Bool->Void ) : Void;
	static function read( connectionId : Int, cb : ReadInfo->Void ) : Void;
	static function write( connectionId : Int, data : ArrayBuffer, cb : WriteInfo->Void ) : Void;
	static function flush( connectionId : Int, cb : Bool->Void ) : Void;
	static function getControlSignals( connectionId : Int, cb : Bool->Void ) : Void;
	static function setControlSignals( connectionId : Int, options : ControlSignalOptions, cb : Bool->Void ) : Void;
}
