package chrome.app;

import js.html.DOMWindow;

typedef CreateWindowOptions = {
	@:optional var id : String;
	@:optional var defaultWidth : Int;
	@:optional var defaultHeight : Int;
	@:optional var defaultLeft : Int;
	@:optional var defaultTop : Int;
	@:optional var width : Int;
	@:optional var height : Int;
	@:optional var left : Int;
	@:optional var top : Int;
	@:optional var minWidth : Int;
	@:optional var minHeight : Int;
	@:optional var maxWidth : Int;
	@:optional var maxHeight : Int;
	@:optional var frame : String;
	@:optional var bounds : Bounds;
	@:optional var transparentBackground : Bool;
	@:optional var state : CreateWindowOptionsState;
	@:optional var hidden : Bool;
	@:optional var resizable : Bool;
	@:optional var singleton : Bool;
	@:optional var alwaysOnTop : Bool;
	@:optional var focused : Bool;
}

typedef Bounds = {
	@:optional var top : Int;
	@:optional var left : Int;
	@:optional var width : Int;
	@:optional var height : Int;
}

typedef AppWindow = {
	function focus() : Void;
	function fullscreen() : Void;
	function isFullscreen() : Bool;
	function minimize() : Void;
	function isMinimized() : Bool;
	function maximize() : Void;
	function isMaximized() : Bool;
	function restore() : Void;
	function moveTo( left : Int, top : Int ) : Void;
	function resizeTo( width : Int, height : Int ) : Void;
	function drawAttention() : Void;
	function clearAttention() : Void;
	function show( ?focus : Bool ) : Void;
	function hide() : Void;
	function getBounds() : Bounds;
	function setBounds( bounds : Bounds ) : Void;
	function getMinWidth() : Int;
	function getMinHeight() : Int;
	function getMaxWidth() : Int;
	function getMaxHeight() : Int;
	function setMinWidth( ?minWidth : Int ) : Void;
	function setMinHeight( ?minHeight : Int ) : Void;
	function setMaxWidth( ?maxWidth : Int ) : Void;
	function setMaxHeight( ?maxHeight : Int ) : Void;
	function isAlwaysOnTop() : Bool;
	function setAlwaysOnTop( alwaysOnTop : Bool ) : Void;
	var contentWindow : DOMWindow;
	var id : Int;
}

@:require(chrome_app)
@:native("chrome.app.window")
extern class Window {
	static function create( url : String, ?options : CreateWindowOptions, ?f : AppWindow->Void ) : Void;
	static function current() : AppWindow;
	static function current() : AppWindow;
	static var onBoundsChanged : Event<Void->Void>;
	static var onClosed : Event<Void->Void>;
	static var onFullscreened : Event<Void->Void>;
	static var onMaximized : Event<Void->Void>;
	static var onMinimized : Event<Void->Void>;
	static var onRestored : Event<Void->Void>;
}
