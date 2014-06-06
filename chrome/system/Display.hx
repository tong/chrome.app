package chrome.system;

typedef Bounds = {
	var left : Int;
	var top : Int;
	var width : Int;
	var height : Int;
}

typedef Insets = {
	var left : Int;
	var top : Int;
	var right : Int;
	var bottom : Int;
}

typedef DisplayInfo = {
	var id : String;
	var name : String;
	var mirroringSourceId : String;
	var isPrimary : Bool;
	var isInternal : Bool;
	var isEnabled : Bool;
	var dpiX : Float;
	var dpiY : Float;
	var rotation : Int;
	var bounds : Bounds;
	var overscan : Insets;
	var workArea : Bounds;
}

typedef DisplayPropertiesInfo = {
	@:optional var mirroringSourceId : Bool;
	@:optional var isPrimary : Bool;
	@:optional var overscan : Insets;
	@:optional var rotation : Int;
	@:optional var boundsOriginX : Int;
	@:optional var boundsOriginY : Int;
}

@:require(chrome_app)
@:native("chrome.system.display")
extern class Display {
	static function getInfo( f : Array<DisplayInfo>->Void ) : Void;
	static function setDisplayProperties( id : String, info : DisplayPropertiesInfo, ?f : Void->Void ) : Void;
	static var onDisplayChanged(default,null) : Event<Void->Void>;
}
