package chrome;

import js.html.ArrayBuffer;

typedef HidDeviceInfo = {
	var deviceId : Int;
	var vendorId : Int;
	var productId : Int;
	var collections : Array<{usagePage:Int,usage:Int,reportIds:Array<Int>}>;
	var maxInputReportSize : Int;
	var maxOutputReportSize : Int;
	var maxFeatureReportSize : Int;
	var reportDescriptor : ArrayBuffer;
}

typedef DeviceFilter = {
	@:optional var vendorId : Int;
	@:optional var productId : Int;
	@:optional var usagePage : Int;
	@:optional var usage : Int;
}

@:require(chrome_app)
@:native("chrome.hid")
extern class Hid {
	static function getDevices( options : {?vendorId:Int,?productId:Int,?filters:Array<DeviceFilter>}, cb : Array<HidDeviceInfo>->Void ) : Void;
	static function connect( deviceId : Int, cb : {connectionId:Int}->Void ) : Void;
	static function disconnect( deviceId : Int, cb : Void->Void ) : Void;
	static function receive( connectionId : Int, cb : Int->ArrayBuffer->Void ) : Void;
	static function send( connectionId : Int, reportId : Int, data : ArrayBuffer, cb : Void->Void ) : Void;
	static function receiveFeatureReport( connectionId : Int, reportId : Int, cb : ArrayBuffer->Void ) : Void;
	static function sendFeatureReport( connectionId : Int, reportId : Int, data : ArrayBuffer, cb : Void->Void ) : Void;
	static var onDeviceAdded(default,null) : Event<HidDeviceInfo->Void>;
	static var onDeviceRemoved(default,null) : Event<Int->Void>;
}
