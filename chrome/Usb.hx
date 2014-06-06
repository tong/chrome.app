package chrome;

import js.html.ArrayBuffer;

@:enum abstract Direction(String) {
	var in_ = "in";
	var out = "out";
}

typedef UsbDevice = {
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
	var direction : Direction;
	var endpoint : Int;
	@:optional var length : Int;
	@:optional var data : ArrayBuffer;
}

typedef TransferResultInfo = {
	@:optional var resultCode : Int;
	@:optional var data : ArrayBuffer;
}

@:enum abstract Synchronization(String) {
	var asynchronous = "asynchronous";
	var adaptive = "adaptive";
	var synchronous = "synchronous";
}

@:enum abstract Usage(String) {
	var data = "data";
	var feedback = "feedback";
	var explicitFeedback = "explicitFeedback";
}

@:enum abstract EndpointType(String) {
	var control = "control";
	var interrupt = "interrupt";
	var isochronous = "isochronous";
	var bulk = "bulk";
}

typedef Descriptor = {
	var interfaceNumber : Int;
	var alternateSetting : Int;
	var interfaceClass : Int;
	var interfaceSubclass : Int;
	var interfaceProtocol : Int;
	@:optional var description : String;
	var endpoints : Array<{address:Int,type:EndpointType,direction:Direction,maximumPacketSize:Int,?synchronization:Synchronization,?usage:Usage,?pollingInterval:Int}>;
}

@:enum abstract Recipient(String) {
	var device = "device";
	var interface_ = "interface";
	var endpoint = "endpoint";
	var other = "other";
}

@:enum abstract RequestType(String) {
	var standard = "standard";
	var class_ = "class";
	var vendor = "vendor";
	var reserved = "reserved";
}

typedef TransferInfo = {
	var direction : Direction;
	var recipient : Recipient;
	var requestType : RequestType;
	var request : Int;
	var value : Int;
	var index : Int;
	@:optional var length : Int;
	@:optional var data : ArrayBuffer;
}

@:require("chrome_app")
@:native("chrome.usb")
extern class Usb {
	static function getDevices( options : {vendorId:Int,productId:Int}, f : Array<UsbDevice>->Void ) : Void;
	static function requestAccess( device : UsbDevice, interfaceId : Int, f : Bool->Void ) : Void;
	static function openDevice( device : UsbDevice, f : ConnectionHandle->Void ) : Void;
	static function findDevices( options : {vendorId:Int,productId:Int,?interfaceId:Int}, f : Array<ConnectionHandle>->Void ) : Void;
	static function closeDevice( handle : ConnectionHandle, ?f : Void->Void ) : Void;
	static function listInterfaces( handle : ConnectionHandle, f : Array<Descriptor>->Void ) : Void;
	static function claimInterface( handle : ConnectionHandle, interfaceNumber : Int, f : Void->Void ) : Void;
	static function releaseInterface( handle : ConnectionHandle, interfaceNumber : Int, f : Void->Void ) : Void;
	static function setInterfaceAlternateSetting( handle : ConnectionHandle, interfaceNumber : Int, alternateSetting : Int, f : Void->Void ) : Void;
	static function controlTransfer( handle : ConnectionHandle, transferInfo : TransferInfo, f : TransferResultInfo->Void ) : Void;
	static function bulkTransfer( handle : ConnectionHandle, transferInfo : TransferInfo, f : TransferResultInfo->Void ) : Void;
	static function interruptTransfer( handle : ConnectionHandle, transferInfo : TransferInfo, f : TransferResultInfo->Void ) : Void;
	static function isochronousTransfer( handle : ConnectionHandle, transferInfo : {transferInfo:GenericTransferInfo,packets:Int,packetLength:Int}, f : TransferResultInfo->Void ) : Void;
	static function resetDevice( handle : ConnectionHandle, f : Bool->Void ) : Void;
}
