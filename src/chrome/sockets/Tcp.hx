package chrome.sockets;

import js.html.ArrayBuffer;
import chrome.Events;

typedef SocketProperties = {
	@:optional var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : Int;
}

typedef SocketInfo = {
	var socketId : Int;
	var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : Int;
	var paused : Bool;
	var connected : Bool;
	@:optional var localAddress : String;
	@:optional var localPort : Int;
	@:optional var peerAddress : String;
	@:optional var peerPort : Int;
}

@:require(chrome_app)
@:native("chrome.sockets.tcp")
extern class Tcp {
	static function create( properties : SocketProperties, callback : {socketId:Int}->Void ) : Void;
	static function update( socketId : Int, properties : SocketProperties, ?callback : Void->Void ) : Void;
	static function setPaused( socketId : Int, paused : Bool, ?callback : Void->Void ) : Void;
	static function setKeepAlive( socketId : Int, enable : Bool, ?delay : Int, callback : Int->Void ) : Void;
	static function setNoDelay( socketId : Int, noDelay : Bool, callback : Int->Void ) : Void;
	static function connect( socketId : Int, peerAddress : String, peerPort : Int, callback : Int->Void ) : Void;
	static function disconnect( socketId : Int, callback : Void->Void ) : Void;
	static function secure( socketId : Int, ?options : { tlsVersion:{?min:String,?max:String} }, callback : Int->Void ) : Void;
	static function send( socketId : Int, data : ArrayBuffer, callback : {resultCode:Int,?bytesSent:Int}->Void ) : Void;
	static function close( socketId : Int, callback : Void->Void ) : Void;
	static function getInfo( socketId : Int, callback : SocketInfo->Void ) : Void;
	static function getSockets( callback : Array<SocketInfo>->Void ) : Void;
	static var onReceive(default,never) : Event<{socketId:Int,data:ArrayBuffer}->Void>;
	static var onReceiveError(default,never) : Event<{socketId:Int,resultCode:Int}->Void>;
}
