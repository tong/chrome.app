package chrome;

import chrome.Events;

@:require(chrome_app)
@:native("chrome.mdns")
extern class Mdns {
    static var MAX_SERVICE_INSTANCES_PER_EVENT(default,never) : Int;
	static function forceDiscovery( callback : Void->Void ) : Void;
	static var onServiceList(default,never) : Event<Array<{
            serviceName : String,
            serviceHostPort : String,
            ipAddress : String,
            serviceData : Array<String>
        }>->Void>;
}
