package chrome.sockets;

private typedef SocketProperties = {
	@:optional var persistent : Bool;
	@:optional var name : String;
}

private typedef SocketInfo = {
	var socketId : Int;
	var persistent : Bool;
	@:optional var name : String;
	var paused : Bool;
	@:optional var localAddress : String;
	@:optional var localPort : Int;
}

private typedef AcceptEventDetails = {
	var socketId : Int;
	var clientSocketId : Int;
}

private typedef AcceptErrorEventDetails = {
	var socketId : Int;
	var resultCode : Int;
}

@:require(chrome_app)
@:native("chrome.sockets.tcpServer")
extern class TcpServer {
	static function create( ?properties : SocketProperties, f : {socketId:Int}->Void ) : Void;
	static function update( socketId : Int, properties : SocketProperties, ?f : Void->Void ) : Void;
	static function setPaused( socketId : Int, paused : Bool, ?f : Void->Void ) : Void;
	static function listen( socketId : Int, address : String, port : Int, ?backlog : Int, ?f : Int->Void ) : Void;
	static function disconnect( socketId : Int, f : Void->Void ) : Void;
	static function close( socketId : Int, f : Void->Void ) : Void;
	static function getInfo( socketId : Int, f : SocketInfo->Void ) : Void;
	static function getSockets( f : Array<SocketInfo>->Void ) : Void;
	static var onAccept(default,null) : Event<AcceptEventDetails->Void>;
	static var onAcceptError(default,null) : Event<AcceptErrorEventDetails->Void>;
}
