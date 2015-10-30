package chrome;

import js.html.ArrayBuffer;
import chrome.Events;

typedef Service = {
	var uuid : String;
	var isPrimary : Bool;
	@:optional var instanceId : String;
	@:optional var deviceAddress : String;
}

@:enum abstract Properties(String) from String to String {
	var broadcast = "broadcast";
	var read = "read";
	var writeWithoutResponse = "writeWithoutResponse";
	var write = "write";
	var notify = "notify";
	var indicate = "indicate";
	var authenticatedSignedWrites = "authenticatedSignedWrites";
	var extendedProperties = "extendedProperties";
	var reliableWrite = "reliableWrite";
	var writableAuxiliaries = "writableAuxiliaries";
}

typedef Characteristic = {
	var uuid : String;
	var service : Service;
	var properties : Properties;
	@:optional var instanceId : String;
	@:optional var value : ArrayBuffer;
}

typedef Descriptor = {
    var uuid : String;
    var characteristic : Characteristic;
    @:optional var instanceId : String;
	@:optional var value : ArrayBuffer;
}

@:require(chrome_app)
@:native("chrome.bluetoothLowEnergy")
extern class BluetoothLowEnergy {
	static function connect( deviceAddress : String, ?properties : {persistend:Bool}, callback : Void->Void ) : Void;
	static function disconnect( deviceAddress : String, ?callback : Void->Void ) : Void;
	static function getService( serviceId : String, callback : Service->Void ) : Void;
	static function getServices( deviceAddress : String, callback : Array<Service>->Void ) : Void;
	static function getCharacteristic( characteristicId : String, callback : Characteristic->Void ) : Void;
	static function getCharacteristics( serviceId : String, callback : Array<Characteristic>->Void ) : Void;
	static function getIncludedServices( serviceId : String, callback : Array<Service>->Void ) : Void;
	static function getDescriptor( descriptorId : String, callback : Descriptor->Void ) : Void;
	static function getDescriptors( characteristicId : String, callback : Array<Descriptor>->Void ) : Void;
	static function readCharacteristicValue( characteristicId : String, callback : Characteristic->Void ) : Void;
	static function writeCharacteristicValue( characteristicId : String, value : ArrayBuffer, callback : Void->Void ) : Void;
	static function startCharacteristicNotifications( characteristicId : String, ?properties : {persistent:Bool}, callback : Void->Void ) : Void;
	static function stopCharacteristicNotifications( characteristicId : String, ?callback : Void->Void ) : Void;
	static function readDescriptorValue( descriptorId : String, callback : Descriptor->Void ) : Void;
	static function writeDescriptorValue( descriptorId : String, value : ArrayBuffer, callback : Void->Void ) : Void;
	static var onServiceAdded(default,never) : Event<Service->Void>;
	static var onServiceChanged(default,never) : Event<Service->Void>;
	static var onServiceRemoved(default,never) : Event<Service->Void>;
	static var onCharacteristicValueChanged(default,never) : Event<Characteristic->Void>;
	static var onDescriptorValueChanged(default,never) : Event<Descriptor->Void>;
}
