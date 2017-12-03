
# Haxe Chrome App [![Build Status](https://travis-ci.org/tong/chrome.app.svg?branch=master)](https://travis-ci.org/tong/chrome.app) [![Haxelib Version](https://img.shields.io/github/tag/tong/chrome.app.svg?style=flat&label=haxelib)](https://lib.haxe.org/p/chrome-app)

Haxe/Javascript type definitions for [google chrome-apps](https://developer.chrome.com/apps/api_index).

API version: 62

---

> __Important__: Chrome will be removing support for Chrome Apps on Windows, Mac, and Linux. Chrome OS will continue to support Chrome Apps. Additionally, Chrome and the Web Store will continue to support extensions on all platforms. Read the [announcement](http://blog.chromium.org/2016/08/from-chrome-apps-to-web.html) and learn more about [migrating](https://developers.chrome.com/apps/migration) your app.

---

### Install
```sh
$ haxelib install chrome-app
```

For chrome-extension types see: https://github.com/tong/chrome.extension


### Usage
```sh
-lib chrome_app
```


#### Haxe Defines

* `-D chrome`  Required (added automatically when using haxelib)
* `-D chrome_app`  Required (added automatically when using haxelib)
* `-D chrome_os`  To access apis available on chrome-os only.
* `-D chrome_dev`  To access apis available on the dev channel only.
* `-D chrome_experimental`  To access experimental apis.
