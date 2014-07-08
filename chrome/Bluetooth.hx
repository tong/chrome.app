package chrome;

import js.html.ArrayBuffer;

private typedef ConnectOptions = {
	var deviceAddress : String;
	var serviceUuid : String;
}

private typedef Socket = {
	var device : Device;
	var id : Int;
	var serviceUuid : String;
}

private typedef DisconnectOptions = {
	var socketId : Int;
}

private typedef GetDevicesOptions = {
	?name : String,
	uuid : String
}

private typedef Device = {
	var address : String;
	var bonded : Bool;
	var connected : Bool;
	var name : String;
	var paired : Bool;
}

private typedef OutOfBandPairingData = {
	var hash : ArrayBuffer;
	var randomizer : ArrayBuffer;
}

private typedef GetServicesOptions = {
	var deviceAddress : String;
}

private typedef ServiceRecord = {
	var name : String;
	@:optional var uuid : String;
}

private typedef ReadOptions = {
	var socketId : Int;
}

private typedef SetOutOfBandPairingDataOptions = {
	var address : String;
	@:optional var data : OutOfBandPairingData;
}

private typedef StartDiscoveryOptions = {
	var deviceCallback : Device->Int;
}

@:require(chrome_app)
@:native("chrome.bluetooth")
extern class Bluetooth {
	static function connect( options : ConnectOptions, f : Socket->Void ) : Void;
	static function disconnect( options : DisconnectOptions, ?f : Void->Void ) : Void;
	static function getAddress( f : String->Void ) : Void;
	//static function getDevices( options : GetDevicesOptions, f : Array<Device>->Void ) : Void;
	static function getDevices( f : Array<Device>->Void ) : Void;
	static function getLocalOutOfBandPairingData( f : OutOfBandPairingData->Void ) : Void;
	static function getServices( options : GetServicesOptions, f : Array<ServiceRecord>->Void ) : Void;
	static function isAvailable( f : Bool->Void ) : Void;
	static function isPowered( f : Bool->Void ) : Void;
	static function read( options : ReadOptions, f : ArrayBuffer->Void ) : Void;
	static function setOutOfBandPairingData( options : SetOutOfBandPairingDataOptions, ?f : Void->Void ) : Void;
	static function startDiscovery( options : StartDiscoveryOptions, ?f : Void->Void ) : Void;
}
