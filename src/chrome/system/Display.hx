package chrome.system;

import chrome.Events;

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

@:require(chrome_app)
@:native("chrome.system.display")
extern class Display {
	static function getInfo( callback : Array<{
			id : String,
			name : String,
			mirroringSourceId : String,
			isPrimary : Bool,
			isInternal : Bool,
			isEnabled : Bool,
			dpiX : Float,
			dpiY : Float,
			rotation : Int,
			bounds : Bounds,
			overscan : Insets,
			workArea : Bounds
		}>->Void ) : Void;
	static function setDisplayProperties( id : String, info : {
			?mirroringSourceId : String,
			?isPrimary : Bool,
			?overscan : Insets,
			?rotation : Int,
			?boundsOriginX : Int,
			?boundsOriginY : Int
		},
		?callback : Void->Void ) : Void;
	static var onDisplayChanged(default,null) : Event<Void->Void>;
}
