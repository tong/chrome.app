package chrome;

import js.html.ArrayBuffer;

typedef SerialConnectOptions = {
	@:optional var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : Int;
	@:optional var bitrate : Int;
	@:optional var dataBits : Int;
	@:optional var parityBit : Int;
	@:optional var stopBits : Int;
	@:optional var ctsFlowControl : Bool;
	@:optional var receiveTimeout : Int;
	@:optional var sendTimeout : Int;
}

typedef SerialConnectionInfo = {
	var connectionId : Int;
	var paused : Bool;
	var persistent : Bool;
	var name : String;
	var bufferSize : Int;
	var receiveTimeout : Int;
	var sendTimeout : Int;
	@:optional var bitrate : Int;
	@:optional var dataBits : Int;
	@:optional var parityBit : Int;
	@:optional var stopBits : Int;
	@:optional var ctsFlowControl : Bool;
}

//@:enum(String)
private enum Error {
	disconnected;
	pending;
	timeout;
	system_error;
}

typedef SendInfo = {
	var bytesSent : Int;
	var error : Error;
}

typedef Signals = {
	var dcd : Bool;
	var cts : Bool;
	var ri : Bool;
	var dsr : Bool;
}

@:require(chrome_app)
@:native("chrome.serial")
extern class Serial {
	static function getDevices( f : Array<{path:String}>->Void ) : Void;
	static function connect( path : String, ?options : SerialConnectOptions, f : SerialConnectionInfo->Void ) : Void;
	static function update( connectionId : Int, options : SerialConnectOptions, f : Bool->Void ) : Void;
	static function disconnect( connectionId : Int, f : Bool->Void ) : Void;
	static function setPaused( connectionId : Int, paused : Bool, f : Void->Void ) : Void;
	static function getInfo( connectionId : Int, f : SerialConnectionInfo->Void ) : Void;
	static function getConnections( f : Array<SerialConnectionInfo>->Void ) : Void;
	static function send( connectionId : Int, data : ArrayBuffer, f : Dynamic->Void ) : Void;
	static function flush( connectionId : Int, f : Bool->Void ) : Void;
	static function getControlSignals( connectionId : Int, f : Bool->Void ) : Void;
	static function setControlSignals( connectionId : Int, signals : {?dtr:Bool,?rts:Bool}, f : Bool->Void ) : Void;
	static var onReceive : Event<{connectionId:Int,data:ArrayBuffer}->Void>;
	static var onReceiveError : Event<{connectionId:Int,error:Error}->Void>;
}
