package chrome;

//TODO full types

typedef FileEntry = Dynamic;

@:fakeEnum(String)
enum FileStatus {
	synced;
	pending;
	conflicting;
}

@:fakeEnum(String)
enum ConflictResolutionPolicy {
	last_write_win;
	manual;
}

@:fakeEnum(String)
enum ServiceStatus {
	initializing;
	running;
	authentication_required;
	temporary_unavailable;
	disabled;
}

@:fakeEnum(String)
enum SyncAction {
	added;
	updated;
	deleted;
}

@:fakeEnum(String)
enum SyncDirection {
	local_to_remote;
	remote_to_local;
}

@:native("chrome.syncFileSystem")
extern class SyncFileSystem {
	
	static function requestFileSystem( f : Dynamic->Void ) : Void;
	static function setConflictResolutionPolicy( policy : ConflictResolutionPolicy, ?cb : Void->Void ) : Void;
	static function getConflictResolutionPolicy( cb : ConflictResolutionPolicy->Void ) : Void;
	static function getUsageAndQuota( fileSystem : Dynamic, f : Dynamic->Void ) : Void;
	static function getFileStatus( fileEntry : FileEntry, f : FileStatus->Void ) : Void;
	static function getFileStatuses( fileEntry : FileEntry, f : FileStatus->Void ) : Void;

	static var onServiceStatusChanged : Event<{
			state : ServiceStatus,
			description : String
		}->Void>;

	static var onFileStatusChanged : Event<{
			fileEntry : FileEntry,
			status : FileStatus,
			?action : SyncAction,
			?direction : SyncDirection
		}->Void>;
}
