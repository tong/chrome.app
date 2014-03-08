package chrome;

import js.html.ArrayBuffer;

@:enum abstract SerialDataBits(String) {
	var seven = "seven";
	var eight = "eight";
}

@:enum abstract SerialParityBit(String) {
	var no = "no";
	var odd = "odd";
	var even = "even";
}

@:enum abstract SerialStopBits(String) {
	var one = "one";
	var two = "two";
}

typedef SerialConnectionOptions = {
	@:optional var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : Int;
	@:optional var bitrate : Int;
	@:optional var dataBits : SerialDataBits;
	@:optional var parityBit : SerialParityBit;
	@:optional var stopBits : SerialStopBits;
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
	@:optional var dataBits : SerialDataBits;
	@:optional var parityBit : SerialParityBit;
	@:optional var stopBits : SerialStopBits;
	@:optional var ctsFlowControl : Bool;
}

@:enum abstract SerialSendInfo(String) {
	var disconnected = "disconnected";
	var pending = "pending";
	var timeout = "timeout";
	var system_error = "system_error";
}

typedef SerialSignals = {
	var dcd : Bool;
	var cts : Bool;
	var ri : Bool;
	var dsr : Bool;
}

@:enum abstract SerialError(String) {
	var disconnected = "disconnected";
	var timeout = "timeout";
	var device_lost = "device_lost";
	var system_error = "system_error";
}

@:require(chrome)
@:require(chrome_app)
@:native("chrome.serial")
extern class Serial {
	static function getDevices( f : Array<{path:String,?vendorId:Int,?productId:Int,?displayName:String}>->Void ) : Void;
	static function connect( path : String, ?options : SerialConnectionOptions, f : SerialConnectionInfo->Void ) : Void;
	static function update( connectionId : Int, options : SerialConnectionOptions, f : Bool->Void ) : Void;
	static function disconnect( connectionId : Int, f : Bool->Void ) : Void;
	static function setPaused( connectionId : Int, paused : Bool, f : Void->Void ) : Void;
	static function getInfo( connectionId : Int, f : SerialConnectionInfo->Void ) : Void;
	static function getConnections( f : Array<SerialConnectionInfo>->Void ) : Void;
	static function send( connectionId : Int, data : ArrayBuffer, f : SerialSendInfo->Void ) : Void;
	static function flush( connectionId : Int, f : Bool->Void ) : Void;
	static function getControlSignals( connectionId : Int, f : SerialSignals->Void ) : Void;
	static function setControlSignals( connectionId : Int, signals : {?dtr:Bool,?rts:Bool}, f : Bool->Void ) : Void;
	static var onReceive : Event<{connectionId:Int,data:ArrayBuffer}->Void>;
	static var onReceiveError : Event<{connectionId:Int,error:SerialError}->Void>;
}
