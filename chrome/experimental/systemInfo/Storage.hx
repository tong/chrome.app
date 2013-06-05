package chrome.experimental.systemInfo;

/*
//@:fakeEnum(String)
enum StorageUnitType {
	unknown;
	harddisk;
	removable;
}
*/

typedef StorageUnitInfo = {
	var availableCapacity : Float;
	var capacity : Float;
	var id : String;
	var type : String; //StorageUnitType;
}

typedef StorageChangeInfo = {
	var availableCapacity : Float;
	var id : String;
}

@:native('chrome.experimental.systemInfo.storage') extern class Storage {
	//static function get( cb : StorageUnitInfo->Void ) : Void;
	//static function get( cb : Dynamic->Void ) : Void;
	static var onAvailableCapacityChanged(default,null) : Event<StorageChangeInfo->Void>;
	static var onAttached(default,null) : Event<StorageUnitInfo->Void>;
	static var onDetached(default,null) : Event<String->Void>;
}
