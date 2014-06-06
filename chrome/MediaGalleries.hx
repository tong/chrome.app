package chrome;

import js.html.Blob;

typedef DOMFileSystem = Dynamic; //TODO?

@:enum abstract GetMediaFileSystemsInteractivity(String) {
	var no = "no";
	var yes = "yes";
	var if_needed = "if_needed";
}

typedef MediaFileSystemsDetails = {
	@:optional var interactive : GetMediaFileSystemsInteractivity;
}


@:enum abstract MetadataOptions(String) {
	var all = "all";
	var mimeTypeAndTags = "mimeTypeAndTags";
	var mimeTypeOnly = "mimeTypeOnly";
}

typedef Metadata = {
	var mimeType : String;
	@:optional var height : Int;
	@:optional var width : Int;
	@:optional var xResolution : Float;
	@:optional var yResolution : Float;
	@:optional var duration : Float;
	@:optional var rotation : Int;
	@:optional var cameraMake : String;
	@:optional var cameraModel : String;
	@:optional var exposureTimeSeconds : Float;
	@:optional var flashFired : Bool;
	@:optional var fNumber : Float;
	@:optional var focalLengthMm : Float;
	@:optional var isoEquivalent : Float;
	@:optional var album : String;
	@:optional var artist : String;
	@:optional var comment : String;
	@:optional var copyright : String;
	@:optional var disc : Int;
	@:optional var genre : String;
	@:optional var language : String;
	@:optional var title : String;
	@:optional var track : Int;
	var rawTags : Array<{type:String,tags:Dynamic}>;
	var attachedImages : Array<Dynamic>;
}

@:enum abstract ScanProgressType(String) {
	var start = "start";
	var cancel = "cancel";
	var finish = "finish";
	var error = "error";
}

typedef OnScanProgressEventDetails = {
	var type : ScanProgressType;
	@:optional var galleryCount : Int;
	@:optional var audioCount : Int;
	@:optional var imageCount : Int;
	@:optional var videoCount : Int;
}

@:require(chrome_app)
@:native("chrome.mediaGalleries")
extern class MediaGalleries {
	static function getMediaFileSystems( ?details : MediaFileSystemsDetails, f : Array<DOMFileSystem>->Void ) : Void;
	static function addUserSelectedFolder( f : Array<DOMFileSystem>->String->Void ) : Void;
	static function dropPermissionForMediaFileSystem( galleryId : String, ?f : Void->Void ) : Void;
	static function startMediaScan() : Void;
	static function cancelMediaScan() : Void;
	static function addScanResults( f : Array<DOMFileSystem>->Void ) : Void;
	static function getMediaFileSystemMetadata( mediaFileSystem : DOMFileSystem ) : {name:String,galleryId:String,?deviceId:String,isRemoveable:Bool,isMediaDevice:Bool,isAvailable:Bool};
	static function getAllMediaFileSystemMetadata( f : Array<{name:String,galleryId:String,?deviceId:String,isRemovable:Bool,isMediaDevice:Bool,isAvailable:Bool}>->Void ) : {name:String,galleryId:String,?deviceId:String,isRemoveable:Bool,isMediaDevice:Bool,isAvailable:Bool};
	static function getMetadata( mediaFile : Blob, ?options : MetadataOptions, f : Metadata->Void ) : Void;
	static var onScanProgress(default,null) : Event<OnScanProgressEventDetails->Void>;
}
