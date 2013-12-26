package chrome;

@:fakeEnum(String) enum GetMediaFileSystemsInteractivity {
	no;
	yes;
	if_needed;
}

typedef MediaFileSystemsDetails = {
	@:optional var interactive : GetMediaFileSystemsInteractivity;
}

@:require(chrome_app)
@:native("chrome.mediaGalleries")
extern class MediaGalleries {
	static function getMediaFileSystems( ?details : MediaFileSystemsDetails, cb : Array<Dynamic> ) : Void; //TODO optional array of localfilesystem 
}
