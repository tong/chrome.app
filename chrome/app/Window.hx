package chrome.app;

typedef CreateWindowOptions = {
	?id : String,
	?minWidth : Int,
	?minHeight : Int,
	?maxWidth : Int,
	?maxHeight : Int,
	?frame : String,
	?bounds : Bounds,
	?transparentBackground : Bool,
	?hidden : String,
	?resizable : Bool,
	?singleton : Bool
}

typedef Bounds = {
	?top : Int,
	?left : Int,
	?width : Int,
	?height : Int,
}

typedef AppWindow = {
	var contentWindow : Dynamic;
	function restore() : Void;
	function moveTo() : Void;
	function hide() : Void;
	function clearAttention() : Void;
	function isMinimized() : Void;
	function minimize() : Void;
	function show() : Void;
	function setBounds() : Void;
	function focus() : Void;
	function resizeTo( width : Int, height : Int ) : Void;
	function maximize() : Void;
	function close() : Void;
	function isMaximized() : Void;
	function drawAttention() : Void;
}

@:native("chrome.app.window") extern class Window {
	static function current() : AppWindow;
	static function create( url : String, ?options : CreateWindowOptions, ?f : AppWindow->Void ) : Void;
	static var onBoundsChanged : Event<Void->Void>;
	static var onClosed : Event<Void->Void>;
	static var onFullscreened : Event<Void->Void>;
	static var onMaximized : Event<Void->Void>;
	static var onMinimized : Event<Void->Void>;
	static var onRestored : Event<Void->Void>;
}
