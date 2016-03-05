
import js.Browser.document;

class App {

    static function main() {
        var body = document.body;
        var github = new haxe.Http( 'https://api.github.com/repos/tong/chrome.app/commits' );
        github.onData = function(e) {
            var data : Array<Dynamic> = haxe.Json.parse(e);
            for( commit in data ) {
                var e = document.createAnchorElement();
                e.href = commit.url;
                e.target = '_blank';
                e.textContent = commit.url;
                body.appendChild(e);
            }
        }
        github.onError = function(e) trace(e);
        github.request();
    }
}
