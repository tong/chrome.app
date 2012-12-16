package chrome.app;

typedef Intent = Dynamic; //TODO

typedef LaunchItem = Dynamic; //TODO

typedef LaunchData = {
	?items : Array<LaunchItem>,
	?id : String
}

typedef IntentResponse = {
	var intentId : Int;
	var data : Dynamic;
	var success : Bool;
}

@:native("chrome.app.runtime")
extern class Runtime {
	static var onLaunched(default,null) : chrome.Event<LaunchData>;
	static var onRestarted(default,null) : chrome.Event<Void>;
}
