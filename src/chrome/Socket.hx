package chrome;

import js.html.ArrayBuffer;

@:enum abstract SocketType(String) from String to String {
	var tcp = "tcp";
	var udp = "udp";
}

typedef WriteInfo = {
    var bytesWritten : Int;
}

@:require(chrome_app)
@:native("chrome.socket")
extern class Socket {
    static function create( type : SocketType, ?options : Dynamic, callback : {socketId:Int}->Void ) : Void;
    static function destroy( socketId : Int ) : Void;
    static function connect( socketId : Int, hostname : String, port : Int, callback : Int->Void ) : Void;
    static function bind( socketId : Int, address : String, port : Int, callback : Int->Void ) : Void;
    static function disconnect( socketId : Int ) : Void;
    static function read( socketId : Int, ?bufferSize : Int, callback : {resultCode:Int,data:ArrayBuffer}->Void ) : Void;
    static function write( socketId : Int, data : ArrayBuffer, callback : WriteInfo->Void ) : Void;
    static function recvFrom( socketId : Int, ?bufferSize : Int, callback : {resultCode:Int,data:ArrayBuffer,address:String,port:Int}->Void ) : Void;
    static function sendTo( socketId : Int, data : ArrayBuffer, address : String, port : Int, callback : WriteInfo->Void ) : Void;
    static function listen( socketId : Int, address : String, port : Int, ?backlog : Int, callback : Int->Void ) : Void;
    static function accept( socketId : Int, callback : {resultCode:Int,?socketId:Int}->Void ) : Void;
    static function setKeepAlive( socketId : Int, enable : Bool, ?delay : Int, callback : Bool->Void ) : Void;
    static function setNoDelay( socketId : Int, noDelay : Bool, callback : Bool->Void ) : Void;
    static function getInfo( socketId : Int, callback : {
            socketType : SocketType,
            connected : Bool,
            ?peerAddress : String,
            ?peerPort : Int,
            ?localAddress : String,
            ?localPort : Int
        }->Void ) : Void;
    static function getNetworkList( callback : Array<{name:String,address:String,prefixLength:Int}>->Void ) : Void;
    static function joinGroup( socketId : Int, address : String, callback : Int->Void ) : Void;
    static function leaveGroup( socketId : Int, address : String, callback : Int->Void ) : Void;
    static function setMulticastTimeToLive( socketId : Int, ttl : Int, callback : Int->Void ) : Void;
    static function setMulticastLoopbackMode( socketId : Int, enabled : Bool, callback : Int->Void ) : Void;
    static function getJoinedGroups( socketId : Int, callback : Array<String>->Void ) : Void;
    static function secure( socketId : Int, ?options : { ?tlsVersion:{?min:String,?max:String} }, callback : Int->Void ) : Void;
}
