package chrome.experimental.systemInfo;

import chrome.Event;

typedef CpuInfo = {
	var archName : String;
	var modelName : String;
	var numOfProcessors : Int;
}

typedef CpuUpdateInfo = {
	var averageUsage : Float;
	var usagePerProcessor : Array<Float>;
}

@:native("chrome.experimental.systemInfo.cpu") extern class Cpu {
	static function get( cb : CpuInfo->Void ) : Void;
	static var onUpdated(default,null) : Event<CpuUpdateInfo->Void>;
}
