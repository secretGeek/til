# immediately-invoked function expression

> An immediately-invoked function expression (or IIFE, pronounced "iffy") is a JavaScript design pattern which produces a lexical scope using JavaScript's function scoping.

 
    (function(){
        // all your code here
        var foo = function() {};
        window.onload = foo;
        // ...
    })();
    // foo is unreachable here (it's undefined)

 
> This pattern is often used when trying to avoid polluting the global namespace, because all the variables used inside the IIFE (like in any other normal function) are not visible outside its scope.    

> In ES6, the above IIFE can be rewritten using the arrow function

    ((foo) => foo)('foo value')


## Source

 * https://en.wikipedia.org/wiki/Immediately-invoked_function_expression
 * http://benalman.com/news/2010/11/immediately-invoked-function-expression/
 * http://stackoverflow.com/questions/8228281/what-is-the-function-construct-in-javascript
 