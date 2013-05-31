package chrome;

import js.html.ArrayBuffer;

typedef FindDevicesOptions = {
	var vendorId : Int;
	var productId : Int;
}

typedef Device = {
	var vendorId : Int;
	var productId : Int;
	var handle : Int;
}

/*
@:fakeEnum(String) enum Recipient {
	device;
	interface;
	endpoint;
	other;
}
*/

typedef ControlTransferInfo = {
	index : Int,
	direction : Int, //Direction,
	requestType : String, //RequestType,
	recipient : String, //Recipient,
	request : Int,
	value : Int,
	?length : Int,
	?data : ArrayBuffer
}

typedef TransferResultInfo = {
	?resultCode : Int,
	?data : ArrayBuffer
}

typedef GenericTransferInfo = {
	direction : String,
	endpoint : Int,
	?data : ArrayBuffer,
	?length : Int
}

typedef IsochronousTransferInfo = {
	var packetLength : Int;
	var transferInfo : GenericTransferInfo;
	var packets : Int;
}

@:native("chrome.usb") extern class Usb {

	static function findDevices( options : FindDevicesOptions, cb : Array<Device>->Void ) : Void;
	static function closeDevice( device : Device, cb : Void->Void ) : Void;
	static function claimInterface( device : Device, interfaceNumber : Int, cb : Void->Void ) : Void;
	static function releaseInterface( device : Device, interfaceNumber : Int, cb : Void->Void ) : Void;
	static function setInterfaceAlternateSetting( device : Device, interfaceNumber : Int, alternateSetting : Int, cb : Void->Void ) : Void;
	static function controlTransfer( device : Device, transferInfo : ControlTransferInfo, cb : TransferResultInfo->Void ) : Void;
	static function bulkTransfer( device : Device, transferInfo : GenericTransferInfo, ?cb : TransferResultInfo->Void ) : Void;
	static function interruptTransfer( device : Device, transferInfo : GenericTransferInfo, ?cb : TransferResultInfo->Void ) : Void;
	static function isochronousTransfer( device : Device, transferInfo : IsochronousTransferInfo, ?cb : TransferResultInfo->Void ) : Void;
	
	//static var onEvent(default,null) : Event<UsbEvent->Void>;
}
