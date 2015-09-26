package chrome;

import js.html.ArrayBuffer;
import chrome.Events;

@:enum abstract DataBits(String) from String to String {
	var seven = "seven";
	var eight = "eight";
}

@:enum abstract ParityBit(String) from String to String {
	var no = "no";
	var odd = "odd";
	var even = "even";
}

@:enum abstract StopBits(String) from String to String {
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

@:enum abstract SendInfo(String) from String to String {
	var disconnected = "disconnected";
	var pending = "pending";
	var timeout = "timeout";
	var system_error = "system_error";
}

@:enum abstract SerialError(String) from String to String {
	var disconnected = "disconnected";
	var timeout = "timeout";
	var device_lost = "device_lost";
	var _break = "break";
	var frame_error = "frame_error";
	var overrun = "overrun";
	var buffer_overflow = "buffer_overflow";
	var parity_error = "parity_error";
	var system_error = "system_error";
}

@:require(chrome_app)
@:native("chrome.serial")
extern class Serial {
	static function getDevices( callback : Array<{path:String,?vendorId:Int,?productId:Int,?displayName:String}>->Void ) : Void;
	static function connect( path : String, ?options : ConnectionOptions, callback : ConnectionInfo->Void ) : Void;
	static function update( connectionId : Int, options : ConnectionOptions, callback : Bool->Void ) : Void;
	static function disconnect( connectionId : Int, callback : Bool->Void ) : Void;
	static function setPaused( connectionId : Int, paused : Bool, callback : Void->Void ) : Void;
	static function getInfo( connectionId : Int, callback : ConnectionInfo->Void ) : Void;
	static function getConnections( callback : Array<ConnectionInfo>->Void ) : Void;
	static function send( connectionId : Int, data : ArrayBuffer, callback : SendInfo->Void ) : Void;
	static function flush( connectionId : Int, callback : Bool->Void ) : Void;
	static function getControlSignals( connectionId : Int, callback : {dcd:Bool,cts:Bool,ri:Bool,dsr:Bool}->Void ) : Void;
	static function setControlSignals( connectionId : Int, signals : {?dtr:Bool,?rts:Bool}, callback : Bool->Void ) : Void;
	static function setBreak( connectionId : Int, callback : Bool->Void ) : Void;
	static function clearBreak( connectionId : Int, callback : Bool->Void ) : Void;
	static var onReceive(default,null) : Event<{connectionId:Int,data:ArrayBuffer}->Void>;
	static var onReceiveError(default,null) : Event<{connectionId:Int,error:SerialError}->Void>;
}
