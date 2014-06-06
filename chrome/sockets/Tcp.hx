package chrome.sockets;

import js.html.ArrayBuffer;

typedef SocketProperties = {
	@:optional var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : int;
}

typedef SocketInfo = {
	var socketId : Int;
	var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : int;
	var paused : Bool;
	var connected : Bool;
	@:optional var localAddress : String;
	@:optional var localPort : Int;
	@:optional var peerAddress : String;
	@:optional var peerPort : Int;
}

typedef SendInfo = {
	var resultCode : Int;
	@:optional var bytesSent : Int;
}

@:require(chrome_app)
@:native("chrome.sockets.tcp")
extern class Tcp {
	static function create( properties : SocketProperties, f : {socketId:Int}->Void ) : Void;
	static function update( socketId : Int, properties : SocketProperties, ?f : Void->Void ) : Void;
	static function setPaused( socketId : Int, paused : Bool, ?f : Void->Void ) : Void;
	static function setKeepAlive( socketId : Int, enable : Bool, ?delay : Int, f : Int->Void ) : Void;
	static function setNoDelay( socketId : Int, noDelay : Bool, f : Void->Void ) : Void;
	static function connect( socketId : Int, peerAddress : String, peerPort : Int, f : Int->Void ) : Void;
	static function disconnect( socketId : Int, f : Void->Void ) : Void;
	static function send( socketId : Int, data : ArrayBuffer, f : SendInfo->Void ) : Void;
	static function close( socketId : Int, f : Void->Void ) : Void;
	static function getInfo( socketId : Int, f : SocketInfo->Void ) : Void;
	static function getSockets( f : Array<SocketInfo>->Void ) : Void;
	static var onReceive(default,null) : Event<{socketId:Int,data:ArrayBuffer}->Void>;
	static var onReceiveError(default,null) : Event<{socketId:Int,resultCode:Int}->Void>;
}
