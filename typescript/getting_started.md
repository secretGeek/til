# Getting started with typescript


    npm install -g typescript

(Note you can install a specific version by running....    
    npm install typescript@2.0.0.
)

Output:

    C:\Users\Leon\AppData\Roaming\npm\tsserver -> C:\Users\Leon\AppData\Roaming\npm\node_modules\typescript\bin\tsserver
    C:\Users\Leon\AppData\Roaming\npm\tsc -> C:\Users\Leon\AppData\Roaming\npm\node_modules\typescript\bin\tsc
    C:\Users\Leon\AppData\Roaming\npm
    +-- typescript@2.0.10
    
See if `tsc` (the typescript compiler) was installed by running:

    tsc --help

Result will be something like this:

    Version 1.0.3.0
    Syntax:   tsc [options] [file ..]

    Examples: tsc hello.ts
              tsc --out foo.js foo.ts
              tsc @args.txt

    Options:
      --codepage NUMBER             Specify the codepage to use when opening source files.
      -d, --declaration             Generates corresponding .d.ts file.
      -h, --help                    Print this message.
      --mapRoot LOCATION            Specifies the location where debugger should locate map files instead of generated locations.
      -m KIND, --module KIND        Specify module code generation: 'commonjs' or 'amd'
      --noImplicitAny               Warn on expressions and declarations with an implied 'any' type.
      --out FILE                    Concatenate and emit output to single file.
      --outDir DIRECTORY            Redirect output structure to the directory.
      --removeComments              Do not emit comments to output.
      --sourcemap                   Generates corresponding .map file.
      --sourceRoot LOCATION         Specifies the location where debugger should locate TypeScript files instead of source locations.
      -t VERSION, --target VERSION  Specify ECMAScript target version: 'ES3' (default), or 'ES5'
      -v, --version                 Print the compiler's version: 1.0.3.0
      @<file>                       Insert command line options and files from a file.

Create a simple javascript file, with a .ts extension, e.g.

log.ts:

    console.log("hi");

then transpile it into a js file, by running `tsc log.ts` -- the result is a javascript file, `log.js` which in this case is identical.

Done that!? Woot! You're a typescript developser!

So i load it up in visual studio code, by running "code.exe" from the commandline.

Now, I don't use vs code too often.

It straight away had this warning: 

> Version mismatch! global tsc (1.0.3.0) != VS Code's language service (2.0.10). Inconsistent compile errors might occur


## Source

 * <http://blog.teamtreehouse.com/getting-started-typescript>