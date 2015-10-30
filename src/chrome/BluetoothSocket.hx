package chrome;

import js.html.ArrayBuffer;
import chrome.Events;

typedef BluetoothSocketProperties = {
	@:optional var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : Int;
}

typedef ListenOptions = {
	@:optional var channel : Int;
	@:optional var psm : Int;
	@:optional var backlog : Int;
}

typedef SocketInfo = {
	var socketId : Int;
	var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : Int;
	var paused : Bool;
	var connected : Bool;
	@:optional var address : String;
	@:optional var uuid : String;
}

@:enum abstract AcceptErrorType(String) from String to String {
	var system_error = "system_error";
	var not_listening = "not_listening";
}

@:enum abstract ReceiveErrorType(String) from String to String {
	var system_error = "system_error";
	var not_listening = "not_listening";
}

@:require(chrome_app)
@:native("chrome.bluetoothSocket")
extern class BluetoothSocket {
    static function create( ?properties : BluetoothSocketProperties, callback : {socketId:Int}->Void ) : Void;
    static function update( socketId : Int, properties : BluetoothSocketProperties, callback : Void->Void ) : Void;
    static function setPaused( socketId : Int, paused : Bool, ?callback : Void->Void ) : Void;
    static function listenUsingRfcomm( socketId : Int, uuid : String, ?options : ListenOptions, callback : Void->Void ) : Void;
    static function listenUsingL2cap( socketId : Int, uuid : String, ?options : ListenOptions, callback : Void->Void ) : Void;
    static function connect( socketId : Int, address : String, uuid : String, callback : Void->Void ) : Void;
    static function disconnect( socketId : Int, callback : Void->Void ) : Void;
    static function close( socketId : Int, ?callback : Void->Void ) : Void;
    static function send( socketId : Int, data : ArrayBuffer, ?callback : Int->Void ) : Void;
    static function getInfo( socketId : Int, callback : SocketInfo->Void ) : Void;
    static function getSockets( callback : Array<SocketInfo>->Void ) : Void;
	static var onAccept(default,never) : Event<{socketId:Int,clientSocketId:Int}->Void>;
	static var onAcceptError(default,never) : Event<{socketId:Int,errorMessage:String,error:AcceptErrorType}->Void>;
	static var onReceive(default,never) : Event<{socketId:Int,data:ArrayBuffer}->Void>;
	static var onReceiveError(default,never) : Event<{socketId:Int,errorMessage:String,error:ReceiveErrorType}->Void>;
}
