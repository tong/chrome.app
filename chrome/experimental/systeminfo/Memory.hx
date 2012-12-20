package chrome.experimental.systemInfo;

typedef MemoryInfo = {
	var capacity : Float;
	var availableCapacity : Float;
}

@:native("chrome.experimental.systemInfo.memory") extern class Memory {
	static function get( cb : MemoryInfo->Void ) : Void;
}
