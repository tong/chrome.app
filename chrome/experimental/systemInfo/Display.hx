package chrome.experimental.systemInfo;

typedef DisplayUnitInfo = {
	var index : Int;
	var dpiX : Int;
	var pixelDepth : Int;
	var availWidth : Int;
	var dpiY : Int;
	var availLeft : Int;
	var height : Int;
	var width : Int;
	var availTop : Int;
	var absoluteLeftOffset : Int;
	var availHeight : Int;
	var colorDepth : Int;
	var isPrimary : Bool;
	var absoluteTopOffset : Int;
	var id : String;
}

@:native("chrome.experimental.systemInfo.display") extern class Display {
	static function get( cb : DisplayUnitInfo->Void ) : Void;
}
