package chrome;

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

@:native("chrome.audio")
extern class Audio {
	static function getInfo( cb : Array<OutputInfo>->Array<InputInfo>->Void ) : Void;
	static function setActiveDevices( ids : Array<String>, cb : Void->Void ) : Void;
	static function setProperties( id : String, properties : {isMuted:Bool,?volume:Float,?gain:Float}, cb : Void->Void ) : Void;
	static var onDeviceChanged : Event<Void->Void>;
}
