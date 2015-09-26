package chrome;

import chrome.Events;

typedef OutputInfo = {
	var id : String;
	var name : String;
	var isActive : Bool;
	var isMuted : Bool;
	var volume : Float;
}

typedef InputInfo = {
	var id : String;
	var name : String;
	var isActive : Bool;
	var isMuted : Bool;
	var gain : Float;
}

@:require(chrome_app)
@:require(chrome_dev)
@:native("chrome.audio")
extern class Audio {
	static function getInfo( callback : Array<OutputInfo>->Array<InputInfo>->Void ) : Void;
	static function setActiveDevices( ids : Array<String>, callback : Void->Void ) : Void;
	static function setProperties( id : String, properties : {isMuted:Bool,?volume:Float,?gain:Float}, callback : Void->Void ) : Void;
	static var onDeviceChanged(default,null) : Event<Void->Void>;
	static var onLevelChanged(default,null) : Event<String->Int->Void>;
	static var onMuteChanged(default,null) : Event<Bool->Bool->Void>;
}
