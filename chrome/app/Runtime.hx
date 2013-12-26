package chrome.app;

typedef Intent = Dynamic; //TODO

typedef LaunchItem = Dynamic; //TODO

typedef LaunchData = {
	@:optional var items : Array<LaunchItem>;
	@:optional var id : String;
}

typedef IntentResponse = {
	var intentId : Int;
	var data : Dynamic;
	var success : Bool;
}

@:require(chrome_app)
@:native("chrome.app.runtime")
extern class Runtime {
	static var onLaunched(default,null) : chrome.Event<LaunchData>;
	static var onRestarted(default,null) : chrome.Event<Void>;
}
