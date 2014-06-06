package chrome;

@:enum abstract Layout(String) {
	var STRETCH = "STRETCH";
	var CENTER = "CENTER";
	var CENTER_CROPPED = "CENTER_CROPPED";
}

@:require(chrome_app)
@:require(chrome_dev)
@:native("chrome.wallpaper")
extern class Wallpaper {
	static function setWallpaper( details : {?wallpaperData:Dynamic,?url:String,layout:Layout,name:String,?thumbnail:Bool}, f : Dynamic->Void ) : Void;
}
