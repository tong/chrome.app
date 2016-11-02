package chrome;

import chrome.Events;

@:require(chrome_app)
@:require(chrome_dev)
@:native("chrome.clipboard")
extern class Clipboard {
	static var onClipboardDataChanged(default,never) : Event<Void->Void>;
}
