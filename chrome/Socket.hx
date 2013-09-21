package chrome;

import js.html.ArrayBuffer;

/* 
@:fakeEnum(String)
enum SocketType {
	tcp;
	udp;
}
*/

typedef CreateOptions = Dynamic; // TODO

typedef CreateInfo = {
	var socketId : Int;
}

typedef AcceptInfo = {
	var resultCode : Int;
	@:optional var socketId : Int;
}

typedef ReadInfo = {
	resultCode : Int,
	data : ArrayBuffer
}

typedef WriteInfo = {
	var bytesWritten : Int;
}

typedef RecvFromInfo = {
	resultCode : Int,
	data : ArrayBuffer,
	port : Int,
	address : String
}

typedef SocketInfo = {
	var socketType : String; //SocketType,
	@:optional var localPort : Int;
	@:optional var peerAddress : String;
	@:optional var peerPort : Int;
	@:optional var localAddress : String;
	var connected : Bool;
}

typedef NetworkInterface = {
	var name : String;
	var address : String;
}

@:native("chrome.socket")
extern class Socket {
	static function create( type : String, ?options : CreateOptions, cb : CreateInfo->Void ) : Void;
	static function destroy( socketId : Int ) : Void;
	static function connect( socketId : Int, address : String, port : Int, cb : Int->Void ) : Void;
	static function bind( socketId : Int, address : String, port : Int, cb : Int->Void ) : Void;
	static function disconnect( socketId : Int ) : Void;
	static function read( socketId : Int, ?bufferSize : Int, cb : ReadInfo->Void ) : Void;
	static function write( socketId : Int, data : ArrayBuffer, cb : WriteInfo->Void ) : Void;
	static function recvFrom( socketId : Int, ?bufferSize : Int, cb : RecvFromInfo->Void ) : Void;
	static function sendTo( socketId : Int, data : ArrayBuffer, address : String, port : Int, cb : WriteInfo->Void ) : Void;
	static function listen( socketId : Int, address : String, port : Int, ?backlog : Int, cb : Int->Void ) : Void;
	static function accept( socketId : Int, cb : AcceptInfo->Void ) : Void;
	static function setKeepAlive( socketId : Int, enable : Bool, ?delay : Int, cb : Bool->Void ) : Void;
	static function setNoDelay( socketId : Int, noDelay : Bool, cb : Bool->Void ) : Void;
	static function getInfo( socketId : Int, cb : SocketInfo->Void ) : Void;
	static function getNetworkList( cb : Array<NetworkInterface>->Void ) : Void;
}
