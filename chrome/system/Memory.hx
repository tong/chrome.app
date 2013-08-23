package chrome.system;

typedef MemoryInfo = {
	var capacity : Float;
	var availableCapacity : Float;
}

@:native("chrome.system.memory") extern class Memory {
	static function getInfo( cb : MemoryInfo->Void ) : Void;
}
