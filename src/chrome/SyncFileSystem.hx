package chrome;

import chrome.Events;

private typedef DOMFileSystem = Dynamic; //TODO?
private typedef Entry = Dynamic; //TODO?
private typedef FileEntry = Dynamic; //TODO?

@:enum abstract ServiceStatus(String) from String to String {
	var initializing = "initializing";
	var running = "running";
	var authentication_required = "authentication_required";
	var temporary_unavailable = "temporary_unavailable";
	var disabled = "disabled";
}

@:enum abstract FileStatus(String) from String to String {
	var synced = "synced";
	var pending = "pending";
	var conflicting = "conflicting";
}

@:enum abstract ConflictResolutionPolicy(String) from String to String {
	var last_write_win = "last_write_win";
	var manual = "manual";
}

@:enum abstract SyncAction(String) from String to String {
	var added = "added";
	var updated = "updated";
	var deleted = "deleted";
}

@:enum abstract SyncDirection(String) from String to String {
	var local_to_remote = "local_to_remote";
	var remote_to_local = "remote_to_local";
}

@:require(chrome_app)
@:native("chrome.syncFileSystem")
extern class SyncFileSystem {
	static function requestFileSystem( callback : DOMFileSystem->Void ) : Void;
	static function setConflictResolutionPolicy( policy : ConflictResolutionPolicy, ?callback : Void->Void ) : Void;
	static function getConflictResolutionPolicy( callback : ConflictResolutionPolicy->Void ) : Void;
	static function getUsageAndQuota( fileSystem : DOMFileSystem, callback : {usageBytes:Int,quotaBytes:Int}->Void ) : Void;
	static function getFileStatus( fileEntry : Entry, callback : FileStatus->Void ) : Void;
	static function getFileStatuses( fileEntries : Array<Dynamic>, callback : Array<{fileEntry:Entry,status:FileStatus,?error:String}>->Void ) : Void;
	static function getServiceStatus( callback : ServiceStatus->Void ) : Void;
	static var onServiceStatusChanged(default,null) : Event<{state:ServiceStatus,description:String}->Void>;
	static var onFileStatusChanged(default,null) : Event<{fileEntry:FileEntry,status:FileStatus,?action:SyncAction,?direction:SyncDirection}->Void>;
}
