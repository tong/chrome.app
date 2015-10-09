package chrome.app;

import chrome.Events;
import haxe.extern.EitherType;

typedef ContentBounds = {
	@:optional var top : Int;
	@:optional var left : Int;
	@:optional var width : Int;
	@:optional var height : Int;
}

typedef BoundsSpecification = {
	@:optional var left : Int;
	@:optional var top : Int;
	@:optional var width : Int;
	@:optional var height : Int;
	@:optional var minWidth : Int;
	@:optional var minHeight : Int;
	@:optional var maxWidth : Int;
	@:optional var maxHeight : Int;
}

typedef Bounds = {
	var left : Int;
	var top : Int;
	var width : Int;
	var height : Int;
	@:optional var minWidth : Int;
	@:optional var minHeight : Int;
	@:optional var maxWidth : Int;
	@:optional var maxHeight : Int;
	function setPosition(left:Int,top:Int) : Void;
	function setSize(width:Int,height:Int) : Void;
	function setMinimumSize(minWidth:Int,minHeight:Int) : Void;
	function setMaximumSize(maxWidth:Int,maxHeight:Int) : Void;
}

typedef FrameOptions = {
	@:optional var type : String;
	@:optional var color : String;
	@:optional var activeColor : String;
	@:optional var inactiveColor : String;
}

@:enum abstract WindowState(String) from String to String {
	var normal = "normal";
	var fullscreen = "fullscreen";
	var maximized = "maximized";
	var minimized = "minimized";
}

@:enum abstract FrameType(String) from String to String {
	var none = "none";
	var chrome = "chrome";
}

typedef CreateWindowOptions = {
	@:optional var id : String;
	@:optional var innerBounds : BoundsSpecification;
	@:optional var outerBounds : BoundsSpecification;
	@:optional var minWidth : Int;
	@:optional var minHeight : Int;
	@:optional var maxWidth : Int;
	@:optional var maxHeight : Int;
	@:optional var frame : EitherType<FrameType,FrameOptions>;
	@:optional var bounds : ContentBounds;
	@:optional var transparentBackground : Bool;
	@:optional var state : WindowState;
	@:optional var hidden : Bool;
	@:optional var resizable : Bool;
	@:optional var singleton : Bool;
	@:optional var alwaysOnTop : Bool;
	@:optional var focused : Bool;
	@:optional var visibleOnAllWorkspaces : Bool;
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
	function drawAttention() : Void;
	function clearAttention() : Void;
	function close() : Void;
	function show( ?focused : Bool ) : Void;
	function hide() : Void;
	function isAlwaysOnTop() : Bool;
	function setAlwaysOnTop( alwaysOnTop : Bool ) : Void;
	function setVisibleOnAllWorkspaces( alwaysVisible : Bool ) : Void;
	@:require(chrome_dev)
	function setInterceptAllKeys( wantAllKeys : Bool ) : Void;
	var contentWindow : js.html.Window;
	var id : Int;
	var innerBounds : Bounds;
	var outerBounds : Bounds;
}

@:require(chrome_app)
@:native("chrome.app.window")
extern class Window {
	static function create( url : String, ?options : CreateWindowOptions, ?f : AppWindow->Void ) : Void;
	static function current() : AppWindow;
	static function getAll() : Array<AppWindow>;
	static function get() : AppWindow;
	static var onBoundsChanged(default,null) : Event<Void->Void>;
	static var onClosed(default,null) : Event<Void->Void>;
	static var onFullscreened(default,null) : Event<Void->Void>;
	static var onMaximized(default,null) : Event<Void->Void>;
	static var onMinimized(default,null) : Event<Void->Void>;
	static var onRestored(default,null) : Event<Void->Void>;
}
