package chrome;

@:fakeEnum(String)
enum GetMediaFileSystemsInteractivity {
	no;
	yes;
	if_needed;
}

typedef MediaFileSystemsDetails = {
	?interactive : GetMediaFileSystemsInteractivity
}

@:native("chrome.mediaGalleries") extern class MediaGalleries {
	static function getMediaFileSystems( ?details : MediaFileSystemsDetails, cb : Array<Dynamic> ) : Void; //TODO optional array of localfilesystem 
}
