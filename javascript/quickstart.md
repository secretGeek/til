# Quick start javascript snippet...

When I want to test something in vanilla js quickly, i use the `js` snippet I keep in [kv](http://www.secretgeek.net/kv)

In other words, I type `kv js` and then a suitable starting script is on my clipboard, I put that into a new file, and I'm away.

(Similarly I could do `kv js > test.html` and put it directly into a file)

Here's how to add such a script to your own `kv`. (it should be in your [utils repo](../tools/utils_repo.md), and in your [path](../powershell/PATH.md), right?)

    $value = @"
    <!DOCTYPE html>
    <html>
    <style>
    html,body, textarea{ width:100%; height: 100%}
    </style>
    <script type='text/javascript'>

    function go() {
      var v = `$('#x')[0].value;
      `$('#x')[0].value = 'ABC';
      alert(v);
    }

    function `$(selectors) {
      return document.querySelectorAll(selectors)
    }

    function jalert(o) {
      // never do this ;)
      alert(JSON.stringify(o, null, '\t'));
    }
    </script>
    <body>
    <input type='button' value=GO onclick='go();' />
    <textarea id='x'>
    abc
    </textarea>
    </body>
    </html>
    "@

    kv js $value

## See also

 * [kv](http://www.secretgeek.net/kv)
 * [here-strings](../powershell/here-strings)
 * [tools](../tools/list_of_tools.md)
