package chrome;

@:fakeEnum(String) enum Layout {
	STRETCH;
	CENTER;
	CENTER_CROPPED;
}

@:require(chrome_app)
@:native("chrome.wallpaper")
extern class Wallpaper {
	static function setWallpaper( details : {?wallpaperData:Dynamic,?url:String,layout:Layout,name:String,?thumbnailBool}, f : Dynamic->Void ) : Void;
}
