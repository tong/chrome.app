package chrome;

import js.html.fs.Entry;
import js.html.fs.FileEntry;

@:enum abstract AcceptOptionExtension(String) {
	var jpg = "jpg";
	var gif = "gif";
	var crx = "crx";
}

typedef AcceptOption = {
	@:optional var description : String;
	@:optional var mimeTypes : Array<String>;
	@:optional var extensions : Array<AcceptOptionExtension>;
}

@:enum abstract ChooseEntryOptionsType(String) {
	var openFile = "openFile";
	var openWritableFile = "openWritableFile";
	var saveFile = "saveFile";
	var openDirectory = "openDirectory";
}

typedef ChooseEntryOptions = {
	@:optional var type : ChooseEntryOptionsType;
	@:optional var suggestedName : String;
	@:optional var accepts : Array<AcceptOption>;
	@:optional var acceptsAllTypes : Bool;
	@:optional var acceptsMultiple : Bool;
}

@:require(chrome_app)
@:native("chrome.fileSystem")
extern class FileSystem {
	static function getDisplayPath( fileEntry : FileEntry, f : String->Void ) : Void;
	static function getWritableEntry( fileEntry : FileEntry, f : FileEntry->Void ) : Void;
	static function isWritableEntry( fileEntry : FileEntry, f : Bool->Void ) : Void;
	@:overload(function(options:ChooseEntryOptions,f:Array<FileEntry>->Void):Void{})
	static function chooseEntry( ?options : ChooseEntryOptions, ?suggestedName : String, ?accepts : Array<{?description:String,?mimeTypes:Array<String>,?extensions:Array<String>}>, ?acceptsAllTypes : Bool, ?acceptsMultiple : Bool, f : FileEntry->Void ) : Void;
	static function restoreEntry( id : String, f : FileEntry->Void ) : Void;
	static function isRestorable( id : String, f : Bool->Void ) : Void;
	static function retainEntry( entry : Entry ) : Void;
}
