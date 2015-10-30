package chrome.sockets;

import js.html.ArrayBuffer;
import chrome.Events;

typedef UdpSocketProperties = {
	@:optional var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : Int;
}

typedef UdpSocketInfo = {
	var socketId : Int;
	var persistent : Bool;
	@:optional var name : String;
	@:optional var bufferSize : Int;
	var paused : Bool;
	@:optional var localAddress : String;
	@:optional var localPort : Int;
}

@:require(chrome_app)
@:native("chrome.sockets.udp")
extern class Udp {
	static function create( ?properties : UdpSocketProperties, callback : {socketId:Int}->Void ) : Void;
	static function update( socketId : Int, properties : UdpSocketProperties, callback : Void->Void ) : Void;
	static function setPaused( socketId : Int, paused : Bool, ?callback : Void->Void ) : Void;
	static function bind( socketId : Int, address : String, port : Int, paused : Bool, callback : Int->Void ) : Void;
	static function send( socketId : Int, data : ArrayBuffer, address : String, port : Int, callback : {resultCode:Int,?bytesSent:Int}->Void ) : Void;
	static function close( socketId : Int, ?callback : Void->Void ) : Void;
	static function getInfo( socketId : Int, callback : UdpSocketInfo->Void ) : Void;
	static function getSockets( callback : Array<UdpSocketInfo>->Void ) : Void;
	static function joinGroup( socketId : Int, address : String, callback : Int->Void ) : Void;
	static function leaveGroup( socketId : Int, address : String, callback : Int->Void ) : Void;
	static function setMulticastTimeToLive( socketId : Int, ttl : Int, callback : Int->Void ) : Void;
	static function setMulticastLoopbackMode( socketId : Int, enabled : Bool, callback : Int->Void ) : Void;
	static function getJoinedGroups( socketId : Int, callback : Array<String>->Void ) : Void;
	static function setBroadcast( socketId : Int, enabled : Bool, callback : Int->Void ) : Void;
	static var onReceive(default,never) : Event<{socketId:Int,data:ArrayBuffer,remoteAddress:String,remotePort:Int}->Void>;
	static var onReceiveError(default,never) : Event<{socketId:Int,resultCode:Int}->Void>;
}
