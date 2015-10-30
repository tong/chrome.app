package chrome.app;

import chrome.Events;

private typedef FileEntry = Dynamic; //TODO

@:enum abstract Source(String) from String to String {
	var app_launcher = "app_launcher";
	var new_tab_page = "new_tab_page";
	var reload = "reload";
	var restart = "restart";
	var load_and_launch = "load_and_launch";
	var command_line = "command_line";
	var file_handler = "file_handler";
	var url_handler = "url_handler";
	var system_tray = "system_tray";
	var about_page = "about_page";
	var keyboard = "keyboard";
	var extensions_page = "extensions_page";
	var management_api = "management_api";
	var ephemeral_app = "ephemeral_app";
	var background = "background";
	var kiosk = "kiosk";
	var chrome_internal = "chrome_internal";
	var test = "test";
}

@:require(chrome_app)
@:native("chrome.app.runtime")
extern class Runtime {
	@:require(chrome_dev)
	static var onEmbedRequested(default,never) : Event<{
			?data : Dynamic,
			allow : String->Void,
			deny : Void->Void
		}->Void>;
	static var onLaunched(default,never) : Event<?{
			?id : String,
			?items : Array<{entry:FileEntry,type:String}>,
			?url : String,
			?referrerUrl : String,
			?isKioskSession : Bool,
			?source : Source
		}->Void>;
	static var onRestarted(default,never) : Event<Void->Void>;
}
