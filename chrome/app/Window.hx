package chrome.app;

typedef CreateWindowOptions = {
	?singleton : Bool,
	?maxHeight : Int,
	?minHeight : Int,
	?maxWidth : Int,
	?minWidth : Int,
	?bounds : Int,
	//?defaultLeft : Int,
	//?defaultWidth : Int,
	//?defaultHeight : Int,
	//?top : Int,
	//?height : Int,
	//?width : Int,
	?id : String,
	?hidden : String,
	?frame : String,
}

typedef Bounds = {
	?top : Int,
	?left : Int
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

@:native("chrome.app.window")
extern class Window {
	static function current() : AppWindow;
	static function create( url : String, ?options : CreateWindowOptions, ?cb : AppWindow->Void ) : Void;
}
