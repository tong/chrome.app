package chrome;

@:require(chrome_app)
@:native("chrome.browser")
extern class Browser {
	static function openTab( options : {url:String}, ?cb : Void->Void ) : Void;
}
