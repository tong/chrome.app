package chrome;

import js.html.fs.FileEntry;

@:fakeEnum(String) enum AcceptOptionExtension {
	jpg;
	gif;
	crx;
}

typedef AcceptOption = {
	@:optional var description : String;
	@:optional var mimeTypes : Array<String>;
	@:optional var extensions : Array<AcceptOptionExtension>;
}

@:fakeEnum(String) enum ChooseEntryOptionsType {
	openFile;
	openWritableFile;
	saveFile;
}

typedef ChooseEntryOptions = {
	@:optional var type : ChooseEntryOptionsType;
	@:optional var suggestedName : String;
	@:optional var accepts : Array<AcceptOption>;
	@:optional var acceptsAllTypes : Bool;
	@:optional var acceptsMultiple : Bool;
}

@:native("chrome.fileSystem")
extern class FileSystem {
	static function getDisplayPath( fileEntry : FileEntry, cb : String->Void ) : Void;
	static function getWritableEntry( fileEntry : FileEntry, cb : FileEntry->Void ) : Void;
	static function isWritableEntry( fileEntry : FileEntry, cb : Bool->Void ) : Void;
	@:overload(function(options:ChooseEntryOptions,cb:Array<FileEntry>->Void):Void{})
	static function chooseEntry( options : ChooseEntryOptions, cb : FileEntry->Void ) : Void;
	static function restoreEntry( id : String, cb : FileEntry->Void ) : Void;
	static function isRestorable( cb : Bool->Void ) : Void;
	static function retainEntry( fileEntry : FileEntry ) : Void;
}
