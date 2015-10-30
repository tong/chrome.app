package chrome.sockets;

import chrome.Events;

typedef TcpSocketProperties = {
	@:optional var persistent : Bool;
	@:optional var name : String;
}

typedef TcpSocketInfo = {
	var socketId : Int;
	var persistent : Bool;
	@:optional var name : String;
	var paused : Bool;
	@:optional var localAddress : String;
	@:optional var localPort : Int;
}

@:require(chrome_app)
@:native("chrome.sockets.tcpServer")
extern class TcpServer {
	static function create( ?properties : TcpSocketProperties, callback : {socketId:Int}->Void ) : Void;
	static function update( socketId : Int, properties : TcpSocketProperties, ?callback : Void->Void ) : Void;
	static function setPaused( socketId : Int, paused : Bool, ?callback : Void->Void ) : Void;
	static function listen( socketId : Int, address : String, port : Int, ?backlog : Int, ?callback : Int->Void ) : Void;
	static function disconnect( socketId : Int, callback : Void->Void ) : Void;
	static function close( socketId : Int, ?callback : Void->Void ) : Void;
	static function getInfo( socketId : Int, callback : TcpSocketInfo->Void ) : Void;
	static function getSockets( callback : Array<TcpSocketInfo>->Void ) : Void;
	static var onAccept(default,never) : Event<{socketId:Int,clientSocketId:Int}->Void>;
	static var onAcceptError(default,never) : Event<{socketId:Int,resultCode:Int}->Void>;
}
