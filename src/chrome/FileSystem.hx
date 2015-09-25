package chrome;

import chrome.Events;

typedef Entry = Dynamic; // TODO
typedef FileEntry = Dynamic; // TODO

@:enum abstract ChildChangeType(String) from String to String {
	var created = "created";
	var removed = "removed";
	var changed = "changed";
}

typedef Volume = {
	var volumeId : String;
	var writable : Bool;
}

@:enum abstract ChooseEntryOptionsType(String) from String to String {
	var openFile = "openFile";
	var openWritableFile = "openWritableFile";
	var saveFile = "saveFile";
	var openDirectory = "openDirectory";
}

@:require(chrome_app)
@:native("chrome.fileSystem")
extern class FileSystem {
	static function getDisplayPath( entry : Entry, callback : String->Void ) : Void;
	static function getWritableEntry( entry : Entry, callback : Entry->Void ) : Void;
	static function isWritableEntry( entry : Entry, callback : Bool->Void ) : Void;
	static function chooseEntry( options : {?type:ChooseEntryOptionsType,?suggestedName:String,?accepts:Array<{?description:String,?mimeTypes:Array<String>,?extensions:Array<String>}>}, ?acceptsAllTypes : Bool, ?acceptsMultiple : Bool, callback : ?Entry->?Array<FileEntry>->Void ) : Void;
	static function restoreEntry( id : String, callback : Entry->Void ) : Void;
	static function isRestorable( id : String, callback : Bool->Void ) : Void;
	static function retainEntry( entry : Entry ) : String;
	static function requestFileSystem( options : {volumeId:String,?writable:Bool}, callback : ?FileSystem->Void ) : String;
	static function getVolumeList( callback : Array<Volume>->Void ) : String;
	static var onVolumeListChanged(default,null) : Event<Array<Volume>->Void>;
}
