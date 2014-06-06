package chrome;

import js.html.fs.Entry;
import js.html.fs.FileEntry;

//typedef DOMFileSystem = Dynamic; //TODO?

@:enum abstract ServiceStatus(String) {
	var initializing = "initializing";
	var running = "running";
	var authentication_required = "authentication_required";
	var temporary_unavailable = "temporary_unavailable";
	var disabled = "disabled";
}

@:enum abstract FileStatus(String) {
	var synced = "synced";
	var pending = "pending";
	var conflicting = "conflicting";
}

@:enum abstract ConflictResolutionPolicy(String) {
	var last_write_win = "last_write_win";
	var manual = "manual";
}

@:enum abstract SyncAction(String) {
	var added = "added";
	var updated = "updated";
	var deleted = "deleted";
}

@:enum abstract SyncDirection(String) {
	var local_to_remote = "local_to_remote";
	var remote_to_local = "remote_to_local";
}

@:require(chrome_app)
@:native("chrome.syncFileSystem")
extern class SyncFileSystem {
	static function requestFileSystem( f : Dynamic->Void ) : Void;
	static function setConflictResolutionPolicy( policy : ConflictResolutionPolicy, ?f : Void->Void ) : Void;
	static function getConflictResolutionPolicy( f : ConflictResolutionPolicy->Void ) : Void;
	static function getUsageAndQuota( fileSystem : Dynamic, f : {usageBytes:Int,quotaBytes:Int}->Void ) : Void;
	static function getFileStatus( fileEntry : Entry, f : FileStatus->Void ) : Void;
	static function getFileStatuses( fileEntries : Array<Dynamic>, f : Array<{fileEntry:Entry,status:FileStatus,?error:String}>->Void ) : Void;
	static function getServiceStatus( f : ServiceStatus->Void ) : Void;
	static var onServiceStatusChanged(default,null) : Event<{state:ServiceStatus,description:String}->Void>;
	static var onFileStatusChanged(default,null) : Event<{fileEntry:FileEntry,status:FileStatus,?action:SyncAction,?direction:SyncDirection}->Void>;
}
