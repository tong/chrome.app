package chrome.system;

@:require(chrome_app)
@:native("chrome.system.network")
extern class Network {
    static function getNetworkInterfaces( callback : Array<{name:String,address:String,prefixLength:Int}>->Void ) : Void;
}
