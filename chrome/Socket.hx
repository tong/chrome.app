package chrome;

import js.html.ArrayBuffer;

@:enum abstract SocketType(String) {
	var tcp = 'tcp';
	var udp = 'udp';
}

typedef WriteInfo = {
	var bytesWritten : Int;
}

typedef ReadInfo = {
	var resultCode : Int;
	var data : ArrayBuffer;
}

typedef RecvFromInfo = {
	var resultCode : Int;
	var data : ArrayBuffer;
	var address : String;
	var port : Int;
}

typedef AcceptInfo = {
	var resultCode : Int;
	@:optional var socketId : Int;
}

typedef SocketInfo = {
	var socketType : SocketType;
	var connected : Bool;
	@:optional var peerAddress : String;
	@:optional var peerPort : Int;
	@:optional var localAddress : String;
	@:optional var localPort : Int;
}

typedef NetworkInterface = {
	var name : String;
	var address : String;
	var prefixLength : Int;
}

@:require(chrome_app)
@:native("chrome.socket")
extern class Socket {
	static function create( type : SocketType, ?options : Dynamic, f : {socketId:Int}->Void ) : Void;
	static function destroy( socketId : Int ) : Void;
	static function connect( socketId : Int, hostname : String, port : Int, f : Int->Void ) : Void;
	static function bind( socketId : Int, address : String, port : Int, f : Int->Void ) : Void;
	static function disconnect( socketId : Int ) : Void;
	static function read( socketId : Int, ?bufferSize : Int, f : ReadInfo->Void ) : Void;
	static function write( socketId : Int, data : ArrayBuffer, f : WriteInfo->Void ) : Void;
	static function recvFrom( socketId : Int, ?bufferSize : Int, f : RecvFromInfo->Void ) : Void;
	static function sendTo( socketId : Int, data : ArrayBuffer, address : String, port : Int, f : WriteInfo->Void ) : Void;
	static function listen( socketId : Int, address : String, port : Int, ?backlog : Int, f : Int->Void ) : Void;
	static function accept( socketId : Int, f : AcceptInfo->Void ) : Void;
	static function setKeepAlive( socketId : Int, enable : Bool, ?delay : Int, f : Bool->Void ) : Void;
	static function setNoDelay( socketId : Int, noDelay : Bool, f : Bool->Void ) : Void;
	static function getInfo( socketId : Int, f : SocketInfo->Void ) : Void;
	static function getNetworkList( f : Array<NetworkInterface>->Void ) : Void;
	static function joinGroup( socketId : Int, address : String, f : Int->Void ) : Void;
	static function leaveGroup( socketId : Int, address : String, f : Int->Void ) : Void;
	static function setMulticastTimeToLive( socketId : Int, ttl : Int, f : Int->Void ) : Void;
	static function setMulticastLoopbackMode( socketId : Int, enabled : Bool, f : Int->Void ) : Void;
	static function getJoinedGroups( socketId : Int, f : Array<String>->Void ) : Void;
}
