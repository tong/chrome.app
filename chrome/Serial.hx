package chrome;

import chrome.Event;
import js.html.ArrayBuffer;

typedef DeviceInfo = {
	var path : String;
	@:optional var vendorId : Int;
	@:optional var productId : Int;
	@:optional var displayName : String;
}

@:enum abstract DataBits(String) {
	var seven = "seven";
	var eight = "eight";
}

@:enum abstract ParityBit(String) {
	var no = "no";
	var odd = "odd";
	var even = "even";
}

@:enum abstract StopBits(String) {
	var one = "one";
	var two = "two";
}

typedef ConnectionOptions = {
	@:optional var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : Int;
	@:optional var bitrate : Int;
	@:optional var dataBits : DataBits;
	@:optional var parityBit : ParityBit;
	@:optional var stopBits : StopBits;
	@:optional var ctsFlowControl : Bool;
	@:optional var receiveTimeout : Int;
	@:optional var sendTimeout : Int;
}

typedef ConnectionInfo = {
	var connectionId : Int;
	var paused : Bool;
	var persistent : Bool;
	var name : String;
	var bufferSize : Int;
	var receiveTimeout : Int;
	var sendTimeout : Int;
	@:optional var bitrate : Int;
	@:optional var dataBits : DataBits;
	@:optional var parityBit : ParityBit;
	@:optional var stopBits : StopBits;
	@:optional var ctsFlowControl : Bool;
}

@:enum abstract SendInfo(String) {
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

@:require(chrome_app)
@:native("chrome.serial")
extern class Serial {
	static function getDevices( f : Array<DeviceInfo>->Void ) : Void;
	static function connect( path : String, ?options : ConnectionOptions, f : ConnectionInfo->Void ) : Void;
	static function update( connectionId : Int, options : ConnectionOptions, f : Bool->Void ) : Void;
	static function disconnect( connectionId : Int, f : Bool->Void ) : Void;
	static function setPaused( connectionId : Int, paused : Bool, f : Void->Void ) : Void;
	static function getInfo( connectionId : Int, f : ConnectionInfo->Void ) : Void;
	static function getConnections( f : Array<ConnectionInfo>->Void ) : Void;
	static function send( connectionId : Int, data : ArrayBuffer, f : SendInfo->Void ) : Void;
	static function flush( connectionId : Int, f : Bool->Void ) : Void;
	static function getControlSignals( connectionId : Int, f : SerialSignals->Void ) : Void;
	static function setControlSignals( connectionId : Int, signals : {?dtr:Bool,?rts:Bool}, f : Bool->Void ) : Void;
	static var onReceive : Event<Int->ArrayBuffer->Void>;
	static var onReceiveError : Event<{connectionId:Int,error:SerialError}->Void>;
}
