package chrome;

import js.html.fs.FileEntry;

@:fakeEnum(String) enum AcceptOptionExtension {
	jpg;
	gif;
	crx:
}

typedef AcceptOption = {
	?description : String
	?mimeTypes : Array<String>,
	?extensions : Array<AcceptOptionExtension>,
}

@:fakeEnum(String) enum ChooseEntryOptionsType {
	openFile;
	openWritableFile;
	saveFile:
}

typedef ChooseEntryOptions = {
	?type : ChooseEntryOptionsType,
	?suggestedName : String,
	?accepts : Array<AcceptOption>,
	?acceptsAllTypes : Bool,
	?acceptsMultiple : Bool,
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
