package chrome;

import js.html.ArrayBuffer;

typedef Device = {
	var device : Int;
	var vendorId : Int;
	var productId : Int;
}

typedef ConnectionHandle = {
	var handle : Int;
	var vendorId : Int;
	var productId : Int;
}

typedef GenericTransferInfo = {
	var direction : Dynamic;
	var endpoint : Int;
	@:optional var length : Int;
	@:optional var data : ArrayBuffer;
}

@:fakeEnum(String) enum EndpointType {
	control;
	interrupt;
	isochronous;
	bulk;
}

@:fakeEnum(String) enum Direction {
	@:native("in") _in;
	out;
}

@:fakeEnum(String) enum Usage {
	data;
	feedback;
	explicitFeedback;
}

typedef Endpoint = {
	var address : Int;
	var type : EndpointType;
	var direction : Direction;
	var maximumPacketSize : Int;
	var synchronization : Int;
	@:optional var usage : Usage;
	@:optional var pollingInterval : Int;
}

typedef Descriptor = {
	var interfaceNumber : Int;
	var alternateSetting : Int;
	var interfaceClass : Int;
	var interfaceSubclass : Int;
	var interfaceProtocol : Int;
	@:optional var description : String;
	var endpoints : Array<Dynamic>;
}

@:fakeEnum(String) enum Recipient {
	device;
	@:native("interface") _interface;
	endpoint;
	other;
}

@:fakeEnum(String) enum RequestType {
	standard;
	@:native("class") _class;
	vendor;
	reserved;
}

typedef TransferInfo = {
	var direction : Direction;
	var recipient : Recipient;
	var requestType : RequestType;
	var request : Int;
	var index : Int;
	@:optional var length : Int;
	@:optional var data : ArrayBuffer;
}

typedef TransferResultInfo = {
	@:optional var resultCode : Int;
	@:optional var recipient : ArrayBuffer;
}

@:require("chrome_app")
@:native("chrome.usb")
extern class Usb {
	static function getDevices( options : {vendorId:Int,productId:Int}, f : Array<Device>->Void ) : Void;
	static function requestAccess( device : Device, interfaceId : Int, f : Bool->Void ) : Void;
	static function openDevice( device : Device, f : ConnectionHandle->Void ) : Void;
	static function findDevices( options : {vendorId:Int,productId:Int,?interfaceId:Int}, f : Array<ConnectionHandle>->Void ) : Void;
	static function closeDevice( handle : ConnectionHandle, ?f : Void->Void ) : Void;
	static function listInterfaces( handle : ConnectionHandle, f : Array<Descriptor>->Void ) : Void;
	static function claimInterface( handle : ConnectionHandle, interfaceNumber : Int, f : Void->Void ) : Void;
	static function releaseInterface( handle : ConnectionHandle, interfaceNumber : Int, f : Void->Void ) : Void;
	static function setInterfaceAlternateSetting( handle : ConnectionHandle, interfaceNumber : Int, alternateSetting : Int, f : Void->Void ) : Void;
	static function controlTransfer( handle : ConnectionHandle, transferInfo : TransferInfo, f : TransferResultInfo->Void ) : Void;
	static function bulkTransfer( handle : ConnectionHandle, transferInfo : TransferInfo, f : TransferResultInfo->Void ) : Void;
	static function isochronousTransfer( handle : ConnectionHandle, transferInfo : {transferInfo:GenericTransferInfo,packets:Int,packetLength:Int}, f : TransferResultInfo->Void ) : Void;
	static function resetDevice( handle : ConnectionHandle, f : Bool->Void ) : Void;
}
