package chrome;

import js.html.ArrayBuffer;

@:fakeEnum(String)
private enum Direction {
	//TODO
	@:native("_in") _in;
	out;
}

private typedef Device = {
	var device : Int;
	var vendorId : Int;
	var productId : Int;
}

private typedef ConnectionHandle = {
	var handle : Int;
	var vendorId : Int;
	var productId : Int;
}

private typedef GenericTransferInfo = {
	var direction : Int;
	var endpoint : Int;
	@:optional var length : Int;
	@:optional var data : ArrayBuffer;
}

private typedef TransferResultInfo = {
	@:optional var resultCode : Int;
	@:optional var data : ArrayBuffer;
}

@:fakeEnum(String)
private enum Recipient {
	device;
//TODO	interface;
	endpoint;
	other;
}

@:fakeEnum(String)
private enum RequestType {
	standard;
	@:native("class") _class;
	vendor;
	reserved;
}

@:require("chrome_app")
@:native("chrome.usb")
extern class Usb {
	static function getDevices( options : {vendorId:Int,productId:Int}, f : Array<Device>->Void ) : Void;
	static function requestAccess( device : Device, interfaceId : Int, f : Bool->Void ) : Void;
	static function openDevice( device : Device, f : ConnectionHandle->Void ) : Void;
	static function findDevices( options : {vendorId:Int,productId:Int,?interfaceId:Int}, f : Array<ConnectionHandle>->Void ) : Void;
	static function closeDevice( handle : ConnectionHandle, ?f : Void->Void ) : Void;
	static function listInterfaces( handle : ConnectionHandle, f : Array<Dynamic>->Void ) : Void; //TODO
	static function claimInterface( handle : ConnectionHandle, interfaceNumber : Int, f : Void->Void ) : Void;
	static function releaseInterface( handle : ConnectionHandle, interfaceNumber : Int, f : Void->Void ) : Void;
	static function setInterfaceAlternateSetting( handle : ConnectionHandle, interfaceNumber : Int, alternateSetting : Int, f : Void->Void ) : Void;
	static function controlTransfer(
		handle : ConnectionHandle,
		transferInfo : {
			direction : Direction,
			recipient : Recipient,
			requestType : RequestType,
			request : Int,
			value : Int,
			index : Int,
			?length : Int,
			?data : ArrayBuffer
		},
		f : TransferResultInfo->Void
	) : Void;



}

/*
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
* /

typedef ControlTransferInfo = {
	var index : Int;
	var direction : Int; //Direction,
	var requestType : String; //RequestType,
	var recipient : String; //Recipient,
	var request : Int;
	var value : Int;
	@:optional var length : Int;
	@:optional var data : ArrayBuffer;
}

typedef TransferResultInfo = {
	@:optional var resultCode : Int;
	@:optional var data : ArrayBuffer;
}

typedef GenericTransferInfo = {
	var direction : String;
	var endpoint : Int;
	@:optional var data : ArrayBuffer;
	@:optional var length : Int;
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
*/

