package chrome;

import js.html.ArrayBuffer;
import chrome.Events;

typedef AdapterState = {
	var address : String;
	var name : String;
	var powered : Bool;
	var available : Bool;
	var discovering : Bool;
}

@:enum abstract VendorIdSource(String) from String to String {
	var bluetooth = "bluetooth";
	var usb = "usb";
}

@:enum abstract DeviceType(String) from String to String {
	var computer = "computer";
	var phone = "phone";
	var modem = "modem";
	var audio = "audio";
	var carAudio = "carAudio";
	var peripheral = "peripheral";
	var gamepad = "gamepad";
	var keyboard = "keyboard";
	var mouse = "mouse";
	var tablet = "tablet";
	var keyboardMouseCombo = "keyboardMouseCombo";
}

typedef Device = {
	var address : String;
	@:optional var name : String;
	@:optional var deviceClass : Int;
	@:optional var vendorIdSource : VendorIdSource;
	@:optional var vendorId : Int;
	@:optional var productId : Int;
	@:optional var deviceId : Int;
	@:optional var type : DeviceType;
	@:optional var paired : Bool;
	@:optional var connected : Bool;
	@:optional var uuids : Array<String>;
	@:optional var inquiryRssi : Int;
	@:optional var inquiryTxPower : Int;
}

@:require(chrome_app)
@:native("chrome.bluetooth")
extern class Bluetooth {
	static function getAdapterState( callback : AdapterState->Void ) : Void;
	static function getDevice( deviceAddress : String, callback : Device->Void ) : Void;
	static function getDevices( callback : Array<Device>->Void ) : Void;
	static function startDiscovery( ?callback : Void->Void ) : Void;
	static function stopDiscovery( ?callback : Void->Void ) : Void;
	static var onAdapterStateChanged(default,never) : Event<AdapterState->Void>;
	static var onDeviceAdded(default,never) : Event<Device->Void>;
	static var onDeviceChanged(default,never) : Event<Device->Void>;
	static var onDeviceRemoved(default,never) : Event<Device->Void>;
}
