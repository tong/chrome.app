package chrome;

import chrome.Events;

@:enum private abstract StreamType(String) from String to String {
	var INPUT = "INPUT";
	var OUTPUT = "OUTPUT";
}

@:enum private abstract DeviceType(String) from String to String {
	var	HEADPHONE = "HEADPHONE";
	var MIC = "MIC";
	var USB = "USB";
	var BLUETOOTH = "BLUETOOTH";
	var HDMI = "HDMI";
	var INTERNAL_SPEAKER = "INTERNAL_SPEAKER";
	var INTERNAL_MIC = "INTERNAL_MIC";
	var FRONT_MIC = "FRONT_MIC";
	var REAR_MIC = "REAR_MIC";
	var KEYBOARD_MIC = "KEYBOARD_MIC";
	var HOTWORD = "HOTWORD";
	var LINEOUT = "LINEOUT";
	var POST_MIX_LOOPBACK = "POST_MIX_LOOPBACK";
	var POST_DSP_LOOPBACK = "POST_DSP_LOOPBACK";
	var OTHER = "OTHER";
}

typedef AudioDeviceInfo = {
	var id : String;
	var streamType : StreamType;
	var deviceType : DeviceType;
	var displayName : String;
	var deviceName : String;
	var isActive : Bool;
	var level : Int;
	@:optional var stableDeviceId : String;
}

typedef DeviceIdLists = {
	@:optional var input : Array<String>;
	@:optional var output : Array<String>;
}

@:require(chrome_app)
@:require(chrome_os)
@:native("chrome.audio")
extern class Audio {
	static function getDevices( filter : Dynamic, callback : Array<AudioDeviceInfo>->Void ) : Void;
	@:overload(function(ids : Array<String>, callback : Void->Void):Void{})
	static function setActiveDevices( ids : DeviceIdLists, callback : Void->Void ) : Void;
	static function setProperties( id : String, properties : { ?level:Int }, callback : Void->Void ) : Void;
	static function getMute( streamType : StreamType, callback : Bool->Void ) : Void;
	static function setMute( streamType : StreamType, isMuted : Bool, ?callback : Void->Void ) : Void;
	static var onLevelChanged(default,never) : Event<{deviceId:String,level:Int}->Void>;
	static var onMuteChanged(default,never) : Event<{streamType:StreamType,isMuted:Bool}->Void>;
	static var onDeviceListChanged(default,never) : Event<Array<AudioDeviceInfo>->Void>;
}
