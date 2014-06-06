package chrome.app;

import js.html.fs.FileEntry;

typedef LaunchItem = {
	var entry : FileEntry;
	var type : String;
}

typedef LaunchData = {
	@:optional var id : String;
	@:optional var items : Array<LaunchItem>;
	@:optional var url : String;
	@:optional var referrerUrl : String;
	@:optional var isKioskSession : Bool;
}

@:require(chrome_app)
@:native("chrome.app.runtime")
extern class Runtime {
	static var onLaunched(default,null) : Event<LaunchData>;
	static var onRestarted(default,null) : Event<Void->Void>;
}
