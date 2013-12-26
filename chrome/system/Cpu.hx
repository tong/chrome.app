package chrome.system;

import chrome.Event;

typedef CpuInfo = {
	var numOfProcessors : Int;
	var archName : String;
	var modelName : String;
}

typedef CpuUpdateInfo = {
	var averageUsage : Float;
	var usagePerProcessor : Array<Float>;
}

@:require(chrome_app)
@:native("chrome.system.cpu")
extern class Cpu {
	static function getInfo( cb : CpuInfo->Void ) : Void;
}
