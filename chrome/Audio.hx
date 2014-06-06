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

@:require(chrome_app)
@:require(chrome_dev)
@:native("chrome.audio")
extern class Audio {
	static function getInfo( f : Array<OutputInfo>->Array<InputInfo>->Void ) : Void;
	static function setActiveDevices( ids : Array<String>, f : Void->Void ) : Void;
	static function setProperties( id : String, properties : {isMuted:Bool,?volume:Float,?gain:Float}, f : Void->Void ) : Void;
	static var onDeviceChanged : Event<Void->Void>;
}
