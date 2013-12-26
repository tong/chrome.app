package chrome;

@:require(chrome_app)
@:native("chrome.idle")
extern class Idle {
	static var onStateChanged : Event<String->Void>;
	static function queryState( thresholdSeconds : Int, cb : String->Void ) : Void;
	static function setDetectionInterval( intervalInSeconds : Int ) : Void;
}
