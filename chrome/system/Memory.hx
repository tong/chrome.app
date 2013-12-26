package chrome.system;

typedef MemoryInfo = {
	var capacity : Float;
	var availableCapacity : Float;
}

@:require(chrome_app)
@:native("chrome.system.memory")
extern class Memory {
	static function getInfo( cb : MemoryInfo->Void ) : Void;
}
