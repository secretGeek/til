# Getting started with gulp

Ensure you have [npm](../npm/install_npm.md) You need `npm` to install `gulp`.

If you've previously installed gulp... uninstall it now.

    npm rm --global gulp

Which seems like an odd thing to do, in an aside... Looking through the history of gulp's getting started it looks like things have changed a bit over the years.

Running the above command resulted in this output for me:


    - ansi-regex@2.1.1 node_modules\gulp\node_modules\ansi-regex
    - ansi-styles@2.2.1 node_modules\gulp\node_modules\ansi-styles
    - archy@1.0.0 node_modules\gulp\node_modules\archy
    - arr-flatten@1.0.1 node_modules\gulp\node_modules\arr-flatten
    - arr-diff@2.0.0 node_modules\gulp\node_modules\arr-diff
    - array-differ@1.0.0 node_modules\gulp\node_modules\array-differ
    - array-uniq@1.0.3 node_modules\gulp\node_modules\array-uniq
    - array-unique@0.2.1 node_modules\gulp\node_modules\array-unique
    - balanced-match@0.4.2 node_modules\gulp\node_modules\balanced-match
    - beeper@1.1.1 node_modules\gulp\node_modules\beeper
    - buffer-shims@1.0.0 node_modules\gulp\node_modules\buffer-shims
    - clone@1.0.2 node_modules\gulp\node_modules\clone
    - clone-stats@0.0.1 node_modules\gulp\node_modules\clone-stats
    - concat-map@0.0.1 node_modules\gulp\node_modules\concat-map
    - brace-expansion@1.1.6 node_modules\gulp\node_modules\brace-expansion
    - core-util-is@1.0.2 node_modules\gulp\node_modules\core-util-is
    - dateformat@2.0.0 node_modules\gulp\node_modules\dateformat
    - defaults@1.0.3 node_modules\gulp\node_modules\defaults
    - deprecated@0.0.1 node_modules\gulp\node_modules\deprecated
    - escape-string-regexp@1.0.5 node_modules\gulp\node_modules\escape-string-regexp
    - extend@3.0.0 node_modules\gulp\node_modules\extend
    - filename-regex@2.0.0 node_modules\gulp\node_modules\filename-regex
    - find-index@0.1.1 node_modules\gulp\node_modules\find-index
    - first-chunk-stream@1.0.0 node_modules\gulp\node_modules\first-chunk-stream
    - flagged-respawn@0.3.2 node_modules\gulp\node_modules\flagged-respawn
    - for-in@0.1.6 node_modules\gulp\node_modules\for-in
    - for-own@0.1.4 node_modules\gulp\node_modules\for-own
    - fs-exists-sync@0.1.0 node_modules\gulp\node_modules\fs-exists-sync
    - detect-file@0.1.0 node_modules\gulp\node_modules\detect-file
    - glob2base@0.0.12 node_modules\gulp\node_modules\glob2base
    - graceful-fs@1.2.3 node_modules\gulp\node_modules\globule\node_modules\graceful-fs
    - inherits@1.0.2 node_modules\gulp\node_modules\globule\node_modules\inherits
    - has-ansi@2.0.0 node_modules\gulp\node_modules\has-ansi
    - inherits@2.0.3 node_modules\gulp\node_modules\inherits
    - ini@1.3.4 node_modules\gulp\node_modules\ini
    - interpret@1.0.1 node_modules\gulp\node_modules\interpret
    - is-buffer@1.1.4 node_modules\gulp\node_modules\is-buffer
    - is-dotfile@1.0.2 node_modules\gulp\node_modules\is-dotfile
    - is-extendable@0.1.1 node_modules\gulp\node_modules\is-extendable
    - is-extglob@1.0.0 node_modules\gulp\node_modules\is-extglob
    - extglob@0.3.2 node_modules\gulp\node_modules\extglob
    - is-glob@2.0.1 node_modules\gulp\node_modules\is-glob
    - glob-parent@2.0.0 node_modules\gulp\node_modules\glob-parent
    - glob-base@0.3.0 node_modules\gulp\node_modules\glob-base
    - is-posix-bracket@0.1.1 node_modules\gulp\node_modules\is-posix-bracket
    - expand-brackets@0.1.5 node_modules\gulp\node_modules\expand-brackets
    - is-primitive@2.0.0 node_modules\gulp\node_modules\is-primitive
    - is-equal-shallow@0.1.3 node_modules\gulp\node_modules\is-equal-shallow
    - is-utf8@0.2.1 node_modules\gulp\node_modules\is-utf8
    - is-windows@0.2.0 node_modules\gulp\node_modules\is-windows
    - isarray@0.0.1 node_modules\gulp\node_modules\isarray
    - isexe@1.1.2 node_modules\gulp\node_modules\isexe
    - isarray@1.0.0 node_modules\gulp\node_modules\isobject\node_modules\isarray
    - isobject@2.1.0 node_modules\gulp\node_modules\isobject
    - kind-of@3.1.0 node_modules\gulp\node_modules\kind-of
    - is-number@2.1.0 node_modules\gulp\node_modules\is-number
    - lodash@1.0.2 node_modules\gulp\node_modules\lodash
    - lodash._basecopy@3.0.1 node_modules\gulp\node_modules\lodash._basecopy
    - lodash._basetostring@3.0.1 node_modules\gulp\node_modules\lodash._basetostring
    - lodash._basevalues@3.0.0 node_modules\gulp\node_modules\lodash._basevalues
    - lodash._getnative@3.9.1 node_modules\gulp\node_modules\lodash._getnative
    - lodash._isiterateecall@3.0.9 node_modules\gulp\node_modules\lodash._isiterateecall
    - lodash._reescape@3.0.0 node_modules\gulp\node_modules\lodash._reescape
    - lodash._reevaluate@3.0.0 node_modules\gulp\node_modules\lodash._reevaluate
    - lodash._reinterpolate@3.0.0 node_modules\gulp\node_modules\lodash._reinterpolate
    - lodash._root@3.0.1 node_modules\gulp\node_modules\lodash._root
    - lodash.assignwith@4.2.0 node_modules\gulp\node_modules\lodash.assignwith
    - lodash.escape@3.2.0 node_modules\gulp\node_modules\lodash.escape
    - lodash.isarguments@3.1.0 node_modules\gulp\node_modules\lodash.isarguments
    - lodash.isarray@3.0.4 node_modules\gulp\node_modules\lodash.isarray
    - lodash.isempty@4.4.0 node_modules\gulp\node_modules\lodash.isempty
    - lodash.isplainobject@4.0.6 node_modules\gulp\node_modules\lodash.isplainobject
    - lodash.isstring@4.0.1 node_modules\gulp\node_modules\lodash.isstring
    - lodash.keys@3.1.2 node_modules\gulp\node_modules\lodash.keys
    - lodash.mapvalues@4.6.0 node_modules\gulp\node_modules\lodash.mapvalues
    - lodash.pick@4.4.0 node_modules\gulp\node_modules\lodash.pick
    - lodash.restparam@3.6.1 node_modules\gulp\node_modules\lodash.restparam
    - lodash.templatesettings@3.1.1 node_modules\gulp\node_modules\lodash.templatesettings
    - lodash.template@3.6.2 node_modules\gulp\node_modules\lodash.template
    - lru-cache@2.7.3 node_modules\gulp\node_modules\lru-cache
    - map-cache@0.2.2 node_modules\gulp\node_modules\map-cache
    - minimatch@2.0.10 node_modules\gulp\node_modules\minimatch
    - minimist@1.2.0 node_modules\gulp\node_modules\minimist
    - minimist@0.0.8 node_modules\gulp\node_modules\mkdirp\node_modules\minimist
    - mkdirp@0.5.1 node_modules\gulp\node_modules\mkdirp
    - natives@1.1.0 node_modules\gulp\node_modules\natives
    - graceful-fs@3.0.11 node_modules\gulp\node_modules\graceful-fs
    - normalize-path@2.0.1 node_modules\gulp\node_modules\normalize-path
    - object-assign@3.0.0 node_modules\gulp\node_modules\object-assign
    - object.omit@2.0.1 node_modules\gulp\node_modules\object.omit
    - ordered-read-streams@0.1.0 node_modules\gulp\node_modules\ordered-read-streams
    - os-homedir@1.0.2 node_modules\gulp\node_modules\os-homedir
    - expand-tilde@1.2.2 node_modules\gulp\node_modules\expand-tilde
    - parse-glob@3.0.4 node_modules\gulp\node_modules\parse-glob
    - parse-passwd@1.0.0 node_modules\gulp\node_modules\parse-passwd
    - homedir-polyfill@1.0.1 node_modules\gulp\node_modules\homedir-polyfill
    - path-root-regex@0.1.2 node_modules\gulp\node_modules\path-root-regex
    - path-root@0.1.1 node_modules\gulp\node_modules\path-root
    - preserve@0.2.0 node_modules\gulp\node_modules\preserve
    - pretty-hrtime@1.0.3 node_modules\gulp\node_modules\pretty-hrtime
    - process-nextick-args@1.0.7 node_modules\gulp\node_modules\process-nextick-args
    - randomatic@1.1.6 node_modules\gulp\node_modules\randomatic
    - regex-cache@0.4.3 node_modules\gulp\node_modules\regex-cache
    - repeat-element@1.1.2 node_modules\gulp\node_modules\repeat-element
    - repeat-string@1.6.1 node_modules\gulp\node_modules\repeat-string
    - fill-range@2.2.3 node_modules\gulp\node_modules\fill-range
    - expand-range@1.8.2 node_modules\gulp\node_modules\expand-range
    - braces@1.8.5 node_modules\gulp\node_modules\braces
    - micromatch@2.3.11 node_modules\gulp\node_modules\micromatch
    - replace-ext@0.0.1 node_modules\gulp\node_modules\replace-ext
    - resolve@1.2.0 node_modules\gulp\node_modules\resolve
    - rechoir@0.6.2 node_modules\gulp\node_modules\rechoir
    - semver@4.3.6 node_modules\gulp\node_modules\semver
    - sequencify@0.0.7 node_modules\gulp\node_modules\sequencify
    - sigmund@1.0.1 node_modules\gulp\node_modules\sigmund
    - minimatch@0.2.14 node_modules\gulp\node_modules\globule\node_modules\minimatch
    - glob@3.1.21 node_modules\gulp\node_modules\globule\node_modules\glob
    - globule@0.1.0 node_modules\gulp\node_modules\globule
    - gaze@0.5.2 node_modules\gulp\node_modules\gaze
    - glob-watcher@0.0.6 node_modules\gulp\node_modules\glob-watcher
    - sparkles@1.0.0 node_modules\gulp\node_modules\sparkles
    - has-gulplog@0.1.0 node_modules\gulp\node_modules\has-gulplog
    - glogg@1.0.0 node_modules\gulp\node_modules\glogg
    - gulplog@1.0.0 node_modules\gulp\node_modules\gulplog
    - stream-consume@0.1.0 node_modules\gulp\node_modules\stream-consume
    - string_decoder@0.10.31 node_modules\gulp\node_modules\string_decoder
    - readable-stream@1.1.14 node_modules\gulp\node_modules\readable-stream
    - duplexer2@0.0.2 node_modules\gulp\node_modules\duplexer2
    - multipipe@0.1.2 node_modules\gulp\node_modules\multipipe
    - readable-stream@1.0.34 node_modules\gulp\node_modules\glob-stream\node_modules\readable-stream
    - strip-ansi@3.0.1 node_modules\gulp\node_modules\strip-ansi
    - strip-bom@1.0.0 node_modules\gulp\node_modules\strip-bom
    - supports-color@2.0.0 node_modules\gulp\node_modules\supports-color
    - chalk@1.1.3 node_modules\gulp\node_modules\chalk
    - isarray@1.0.0 node_modules\gulp\node_modules\through2\node_modules\isarray
    - tildify@1.2.0 node_modules\gulp\node_modules\tildify
    - time-stamp@1.0.1 node_modules\gulp\node_modules\time-stamp
    - fancy-log@1.3.0 node_modules\gulp\node_modules\fancy-log
    - unc-path-regex@0.1.2 node_modules\gulp\node_modules\unc-path-regex
    - is-unc-path@0.1.2 node_modules\gulp\node_modules\is-unc-path
    - is-relative@0.2.1 node_modules\gulp\node_modules\is-relative
    - is-absolute@0.2.6 node_modules\gulp\node_modules\is-absolute
    - parse-filepath@1.0.1 node_modules\gulp\node_modules\parse-filepath
    - fined@1.0.2 node_modules\gulp\node_modules\fined
    - unique-stream@1.0.0 node_modules\gulp\node_modules\unique-stream
    - user-home@1.1.1 node_modules\gulp\node_modules\user-home
    - util-deprecate@1.0.2 node_modules\gulp\node_modules\util-deprecate
    - readable-stream@2.2.2 node_modules\gulp\node_modules\through2\node_modules\readable-stream
    - v8flags@2.0.11 node_modules\gulp\node_modules\v8flags
    - vinyl@0.5.3 node_modules\gulp\node_modules\vinyl
    - clone@0.2.0 node_modules\gulp\node_modules\vinyl-fs\node_modules\clone
    - readable-stream@1.0.34 node_modules\gulp\node_modules\vinyl-fs\node_modules\readable-stream
    - vinyl@0.4.6 node_modules\gulp\node_modules\vinyl-fs\node_modules\vinyl
    - which@1.2.12 node_modules\gulp\node_modules\which
    - global-prefix@0.1.5 node_modules\gulp\node_modules\global-prefix
    - global-modules@0.2.3 node_modules\gulp\node_modules\global-modules
    - resolve-dir@0.1.1 node_modules\gulp\node_modules\resolve-dir
    - findup-sync@0.4.3 node_modules\gulp\node_modules\findup-sync
    - liftoff@2.3.0 node_modules\gulp\node_modules\liftoff
    - wrappy@1.0.2 node_modules\gulp\node_modules\wrappy
    - once@1.3.3 node_modules\gulp\node_modules\once
    - end-of-stream@0.1.5 node_modules\gulp\node_modules\end-of-stream
    - orchestrator@0.3.8 node_modules\gulp\node_modules\orchestrator
    - inflight@1.0.6 node_modules\gulp\node_modules\inflight
    - glob@4.5.3 node_modules\gulp\node_modules\glob
    - xtend@4.0.1 node_modules\gulp\node_modules\xtend
    - through2@0.6.5 node_modules\gulp\node_modules\vinyl-fs\node_modules\through2
    - through2@2.0.3 node_modules\gulp\node_modules\through2
    - gulp-util@3.0.8 node_modules\gulp\node_modules\gulp-util
    - through2@0.6.5 node_modules\gulp\node_modules\glob-stream\node_modules\through2
    - glob-stream@3.1.18 node_modules\gulp\node_modules\glob-stream
    - vinyl-fs@0.3.14 node_modules\gulp\node_modules\vinyl-fs
    - gulp@3.9.1 node_modules\gulp



Moving on...

Next... install gulp-cli.

    npm install --global gulp-cli


This is being installed globally, so it's available all the time, not just for this project.

This resulted in....


    +-- gulp-cli@1.2.2
      +-- archy@1.0.0
      +-- chalk@1.1.3
      ¦ +-- ansi-styles@2.2.1
      ¦ +-- escape-string-regexp@1.0.5
      ¦ +-- has-ansi@2.0.0
      ¦ ¦ +-- ansi-regex@2.1.1
      ¦ +-- strip-ansi@3.0.1
      ¦ +-- supports-color@2.0.0
      +-- fancy-log@1.3.0
      ¦ +-- time-stamp@1.0.1
      +-- gulplog@1.0.0
      ¦ +-- glogg@1.0.0
      ¦   +-- sparkles@1.0.0
      +-- interpret@1.0.1
      +-- liftoff@2.3.0
      ¦ +-- extend@3.0.0
      ¦ +-- findup-sync@0.4.3
      ¦ ¦ +-- detect-file@0.1.0
      ¦ ¦ ¦ +-- fs-exists-sync@0.1.0
      ¦ ¦ +-- is-glob@2.0.1
      ¦ ¦ +-- resolve-dir@0.1.1
      ¦ ¦   +-- global-modules@0.2.3
      ¦ ¦     +-- global-prefix@0.1.5
      ¦ ¦     ¦ +-- homedir-polyfill@1.0.1
      ¦ ¦     ¦ ¦ +-- parse-passwd@1.0.0
      ¦ ¦     ¦ +-- ini@1.3.4
      ¦ ¦     ¦ +-- which@1.2.12
      ¦ ¦     ¦   +-- isexe@1.1.2
      ¦ ¦     +-- is-windows@0.2.0
      ¦ +-- fined@1.0.2
      ¦ ¦ +-- expand-tilde@1.2.2
      ¦ ¦ +-- lodash.assignwith@4.2.0
      ¦ ¦ +-- lodash.isempty@4.4.0
      ¦ ¦ +-- lodash.pick@4.4.0
      ¦ ¦ +-- parse-filepath@1.0.1
      ¦ ¦   +-- is-absolute@0.2.6
      ¦ ¦   ¦ +-- is-relative@0.2.1
      ¦ ¦   ¦   +-- is-unc-path@0.1.2
      ¦ ¦   ¦     +-- unc-path-regex@0.1.2
      ¦ ¦   +-- map-cache@0.2.2
      ¦ ¦   +-- path-root@0.1.1
      ¦ ¦     +-- path-root-regex@0.1.2
      ¦ +-- flagged-respawn@0.3.2
      ¦ +-- lodash.mapvalues@4.6.0
      ¦ +-- rechoir@0.6.2
      ¦ +-- resolve@1.2.0
      +-- lodash.isfunction@3.0.8
      +-- lodash.isplainobject@4.0.6
      +-- lodash.isstring@4.0.1
      +-- lodash.sortby@4.7.0
      +-- matchdep@1.0.1
      ¦ +-- findup-sync@0.3.0
      ¦ ¦ +-- glob@5.0.15
      ¦ ¦   +-- inflight@1.0.6
      ¦ ¦   ¦ +-- wrappy@1.0.2
      ¦ ¦   +-- inherits@2.0.3
      ¦ ¦   +-- minimatch@3.0.3
      ¦ ¦   ¦ +-- brace-expansion@1.1.6
      ¦ ¦   ¦   +-- balanced-match@0.4.2
      ¦ ¦   ¦   +-- concat-map@0.0.1
      ¦ ¦   +-- once@1.4.0
      ¦ ¦   +-- path-is-absolute@1.0.1
      ¦ +-- micromatch@2.3.11
      ¦ ¦ +-- arr-diff@2.0.0
      ¦ ¦ ¦ +-- arr-flatten@1.0.1
      ¦ ¦ +-- array-unique@0.2.1
      ¦ ¦ +-- braces@1.8.5
      ¦ ¦ ¦ +-- expand-range@1.8.2
      ¦ ¦ ¦ ¦ +-- fill-range@2.2.3
      ¦ ¦ ¦ ¦   +-- is-number@2.1.0
      ¦ ¦ ¦ ¦   +-- isobject@2.1.0
      ¦ ¦ ¦ ¦   ¦ +-- isarray@1.0.0
      ¦ ¦ ¦ ¦   +-- randomatic@1.1.6
      ¦ ¦ ¦ ¦   +-- repeat-string@1.6.1
      ¦ ¦ ¦ +-- preserve@0.2.0
      ¦ ¦ ¦ +-- repeat-element@1.1.2
      ¦ ¦ +-- expand-brackets@0.1.5
      ¦ ¦ ¦ +-- is-posix-bracket@0.1.1
      ¦ ¦ +-- extglob@0.3.2
      ¦ ¦ +-- filename-regex@2.0.0
      ¦ ¦ +-- is-extglob@1.0.0
      ¦ ¦ +-- kind-of@3.1.0
      ¦ ¦ ¦ +-- is-buffer@1.1.4
      ¦ ¦ +-- normalize-path@2.0.1
      ¦ ¦ +-- object.omit@2.0.1
      ¦ ¦ ¦ +-- for-own@0.1.4
      ¦ ¦ ¦ ¦ +-- for-in@0.1.6
      ¦ ¦ ¦ +-- is-extendable@0.1.1
      ¦ ¦ +-- parse-glob@3.0.4
      ¦ ¦ ¦ +-- glob-base@0.3.0
      ¦ ¦ ¦ ¦ +-- glob-parent@2.0.0
      ¦ ¦ ¦ +-- is-dotfile@1.0.2
      ¦ ¦ +-- regex-cache@0.4.3
      ¦ ¦   +-- is-equal-shallow@0.1.3
      ¦ ¦   +-- is-primitive@2.0.0
      ¦ +-- resolve@1.1.7
      ¦ +-- stack-trace@0.0.9
      +-- mute-stdout@1.0.0
      +-- pretty-hrtime@1.0.3
      +-- semver-greatest-satisfied-range@1.0.0
      ¦ +-- semver@4.3.6
      ¦ +-- semver-regex@1.0.0
      +-- tildify@1.2.0
      ¦ +-- os-homedir@1.0.2
      +-- v8flags@2.0.11
      ¦ +-- user-home@1.1.1
      +-- wreck@6.3.0
      ¦ +-- boom@2.10.1
      ¦ +-- hoek@2.16.3
      +-- yargs@3.32.0
        +-- camelcase@2.1.1
        +-- cliui@3.2.0
        ¦ +-- wrap-ansi@2.1.0
        +-- decamelize@1.2.0
        +-- os-locale@1.4.0
        ¦ +-- lcid@1.0.0
        ¦   +-- invert-kv@1.0.0
        +-- string-width@1.0.2
        ¦ +-- code-point-at@1.1.0
        ¦ +-- is-fullwidth-code-point@1.0.0
        ¦   +-- number-is-nan@1.0.1
        +-- window-size@0.1.4
        +-- y18n@3.2.1

...luckily that all checks out. (wtflolbbq)


Moving on, inside your project you are expected to run this command....



    npm install --save-dev gulp


The `--save-dev` flag means gulp will be added to the dependencies of your `package.json` file (if you have one)

(Reminder: `package.json` is the file npm uses for describing a node package)

That gave me a *LOT* of output, which I'll break up and discuss in pieces...

Hmmm... gulp, the task runner, (transitively) depends on some very out of date things.

    npm WARN deprecated minimatch@2.0.10: Please update to minimatch 3.0.2 or higher to avoid a RegExp DoS issue
    npm WARN deprecated minimatch@0.2.14: Please update to minimatch 3.0.2 or higher to avoid a RegExp DoS issue
    npm WARN deprecated graceful-fs@1.2.3: graceful-fs v3.0.0 and before will fail on node releases >= v7.0. Please update to graceful-fs@^4.0.0 as soon as possible. Use 'npm ls graceful-fs' to find it in the tree.
    npm WARN deprecated lodash@1.0.2: lodash@<3.0.0 is no longer maintained. Upgrade to lodash@^4.0.0.

Then these warnings are typical `npm` noise if you aren't building a package and don't have a `package.json` file.

    npm WARN saveError ENOENT: no such file or directory, open 'C:\users\username\scratch\markdown-it-3\package.json'


And here's the tree of dependencies created...

    +-- gulp@3.9.1
      +-- archy@1.0.0
      +-- chalk@1.1.3
      ¦ +-- ansi-styles@2.2.1
      ¦ +-- escape-string-regexp@1.0.5
      ¦ +-- has-ansi@2.0.0
      ¦ ¦ +-- ansi-regex@2.1.1
      ¦ +-- strip-ansi@3.0.1
      ¦ +-- supports-color@2.0.0
      +-- deprecated@0.0.1
      +-- gulp-util@3.0.8
      ¦ +-- array-differ@1.0.0
      ¦ +-- array-uniq@1.0.3
      ¦ +-- beeper@1.1.1
      ¦ +-- dateformat@2.0.0
      ¦ +-- fancy-log@1.3.0
      ¦ ¦ +-- time-stamp@1.0.1
      ¦ +-- gulplog@1.0.0
      ¦ ¦ +-- glogg@1.0.0
      ¦ +-- has-gulplog@0.1.0
      ¦ ¦ +-- sparkles@1.0.0
      ¦ +-- lodash._reescape@3.0.0
      ¦ +-- lodash._reevaluate@3.0.0
      ¦ +-- lodash._reinterpolate@3.0.0
      ¦ +-- lodash.template@3.6.2
      ¦ ¦ +-- lodash._basecopy@3.0.1
      ¦ ¦ +-- lodash._basetostring@3.0.1
      ¦ ¦ +-- lodash._basevalues@3.0.0
      ¦ ¦ +-- lodash._isiterateecall@3.0.9
      ¦ ¦ +-- lodash.escape@3.2.0
      ¦ ¦ ¦ +-- lodash._root@3.0.1
      ¦ ¦ +-- lodash.keys@3.1.2
      ¦ ¦ ¦ +-- lodash._getnative@3.9.1
      ¦ ¦ ¦ +-- lodash.isarguments@3.1.0
      ¦ ¦ ¦ +-- lodash.isarray@3.0.4
      ¦ ¦ +-- lodash.restparam@3.6.1
      ¦ ¦ +-- lodash.templatesettings@3.1.1
      ¦ +-- multipipe@0.1.2
      ¦ ¦ +-- duplexer2@0.0.2
      ¦ ¦   +-- readable-stream@1.1.14
      ¦ +-- object-assign@3.0.0
      ¦ +-- replace-ext@0.0.1
      ¦ +-- through2@2.0.3
      ¦ ¦ +-- readable-stream@2.2.2
      ¦ ¦ ¦ +-- buffer-shims@1.0.0
      ¦ ¦ ¦ +-- core-util-is@1.0.2
      ¦ ¦ ¦ +-- inherits@2.0.3
      ¦ ¦ ¦ +-- isarray@1.0.0
      ¦ ¦ ¦ +-- process-nextick-args@1.0.7
      ¦ ¦ ¦ +-- string_decoder@0.10.31
      ¦ ¦ ¦ +-- util-deprecate@1.0.2
      ¦ ¦ +-- xtend@4.0.1
      ¦ +-- vinyl@0.5.3
      ¦   +-- clone@1.0.2
      ¦   +-- clone-stats@0.0.1
      +-- interpret@1.0.1
      +-- liftoff@2.3.0
      ¦ +-- extend@3.0.0
      ¦ +-- findup-sync@0.4.3
      ¦ ¦ +-- detect-file@0.1.0
      ¦ ¦ ¦ +-- fs-exists-sync@0.1.0
      ¦ ¦ +-- is-glob@2.0.1
      ¦ ¦ ¦ +-- is-extglob@1.0.0
      ¦ ¦ +-- micromatch@2.3.11
      ¦ ¦ ¦ +-- arr-diff@2.0.0
      ¦ ¦ ¦ ¦ +-- arr-flatten@1.0.1
      ¦ ¦ ¦ +-- array-unique@0.2.1
      ¦ ¦ ¦ +-- braces@1.8.5
      ¦ ¦ ¦ ¦ +-- expand-range@1.8.2
      ¦ ¦ ¦ ¦ ¦ +-- fill-range@2.2.3
      ¦ ¦ ¦ ¦ ¦   +-- is-number@2.1.0
      ¦ ¦ ¦ ¦ ¦   +-- isobject@2.1.0
      ¦ ¦ ¦ ¦ ¦   ¦ +-- isarray@1.0.0
      ¦ ¦ ¦ ¦ ¦   +-- randomatic@1.1.6
      ¦ ¦ ¦ ¦ ¦   +-- repeat-string@1.6.1
      ¦ ¦ ¦ ¦ +-- preserve@0.2.0
      ¦ ¦ ¦ ¦ +-- repeat-element@1.1.2
      ¦ ¦ ¦ +-- expand-brackets@0.1.5
      ¦ ¦ ¦ ¦ +-- is-posix-bracket@0.1.1
      ¦ ¦ ¦ +-- extglob@0.3.2
      ¦ ¦ ¦ +-- filename-regex@2.0.0
      ¦ ¦ ¦ +-- kind-of@3.1.0
      ¦ ¦ ¦ ¦ +-- is-buffer@1.1.4
      ¦ ¦ ¦ +-- normalize-path@2.0.1
      ¦ ¦ ¦ +-- object.omit@2.0.1
      ¦ ¦ ¦ ¦ +-- for-own@0.1.4
      ¦ ¦ ¦ ¦ ¦ +-- for-in@0.1.6
      ¦ ¦ ¦ ¦ +-- is-extendable@0.1.1
      ¦ ¦ ¦ +-- parse-glob@3.0.4
      ¦ ¦ ¦ ¦ +-- glob-base@0.3.0
      ¦ ¦ ¦ ¦ ¦ +-- glob-parent@2.0.0
      ¦ ¦ ¦ ¦ +-- is-dotfile@1.0.2
      ¦ ¦ ¦ +-- regex-cache@0.4.3
      ¦ ¦ ¦   +-- is-equal-shallow@0.1.3
      ¦ ¦ ¦   +-- is-primitive@2.0.0
      ¦ ¦ +-- resolve-dir@0.1.1
      ¦ ¦   +-- global-modules@0.2.3
      ¦ ¦     +-- global-prefix@0.1.5
      ¦ ¦     ¦ +-- homedir-polyfill@1.0.1
      ¦ ¦     ¦ ¦ +-- parse-passwd@1.0.0
      ¦ ¦     ¦ +-- ini@1.3.4
      ¦ ¦     ¦ +-- which@1.2.12
      ¦ ¦     ¦   +-- isexe@1.1.2
      ¦ ¦     +-- is-windows@0.2.0
      ¦ +-- fined@1.0.2
      ¦ ¦ +-- expand-tilde@1.2.2
      ¦ ¦ +-- lodash.assignwith@4.2.0
      ¦ ¦ +-- lodash.isempty@4.4.0
      ¦ ¦ +-- lodash.pick@4.4.0
      ¦ ¦ +-- parse-filepath@1.0.1
      ¦ ¦   +-- is-absolute@0.2.6
      ¦ ¦   ¦ +-- is-relative@0.2.1
      ¦ ¦   ¦   +-- is-unc-path@0.1.2
      ¦ ¦   ¦     +-- unc-path-regex@0.1.2
      ¦ ¦   +-- map-cache@0.2.2
      ¦ ¦   +-- path-root@0.1.1
      ¦ ¦     +-- path-root-regex@0.1.2
      ¦ +-- flagged-respawn@0.3.2
      ¦ +-- lodash.isplainobject@4.0.6
      ¦ +-- lodash.isstring@4.0.1
      ¦ +-- lodash.mapvalues@4.6.0
      ¦ +-- rechoir@0.6.2
      ¦ +-- resolve@1.2.0
      +-- minimist@1.2.0
      +-- orchestrator@0.3.8
      ¦ +-- end-of-stream@0.1.5
      ¦ ¦ +-- once@1.3.3
      ¦ ¦   +-- wrappy@1.0.2
      ¦ +-- sequencify@0.0.7
      ¦ +-- stream-consume@0.1.0
      +-- pretty-hrtime@1.0.3
      +-- semver@4.3.6
      +-- tildify@1.2.0
      ¦ +-- os-homedir@1.0.2
      +-- v8flags@2.0.11
      ¦ +-- user-home@1.1.1
      +-- vinyl-fs@0.3.14
        +-- defaults@1.0.3
        +-- glob-stream@3.1.18
        ¦ +-- glob@4.5.3
        ¦ ¦ +-- inflight@1.0.6
        ¦ +-- glob2base@0.0.12
        ¦ ¦ +-- find-index@0.1.1
        ¦ +-- minimatch@2.0.10
        ¦ ¦ +-- brace-expansion@1.1.6
        ¦ ¦   +-- balanced-match@0.4.2
        ¦ ¦   +-- concat-map@0.0.1
        ¦ +-- ordered-read-streams@0.1.0
        ¦ +-- through2@0.6.5
        ¦ ¦ +-- readable-stream@1.0.34
        ¦ +-- unique-stream@1.0.0
        +-- glob-watcher@0.0.6
        ¦ +-- gaze@0.5.2
        ¦   +-- globule@0.1.0
        ¦     +-- glob@3.1.21
        ¦     ¦ +-- graceful-fs@1.2.3
        ¦     ¦ +-- inherits@1.0.2
        ¦     +-- lodash@1.0.2
        ¦     +-- minimatch@0.2.14
        ¦       +-- lru-cache@2.7.3
        ¦       +-- sigmund@1.0.1
        +-- graceful-fs@3.0.11
        ¦ +-- natives@1.1.0
        +-- mkdirp@0.5.1
        ¦ +-- minimist@0.0.8
        +-- strip-bom@1.0.0
        ¦ +-- first-chunk-stream@1.0.0
        ¦ +-- is-utf8@0.2.1
        +-- through2@0.6.5
        ¦ +-- readable-stream@1.0.34
        ¦   +-- isarray@0.0.1
        +-- vinyl@0.4.6
          +-- clone@0.2.0


And finally more typical `npm` noise about things missing from the non-existent `package.json`

    npm WARN ENOENT ENOENT: no such file or directory, open 'C:\users\username\scratch\markdown-it-3\package.json'
    npm WARN EPACKAGEJSON markdown-it-3 No description
    npm WARN EPACKAGEJSON markdown-it-3 No repository field.
    npm WARN EPACKAGEJSON markdown-it-3 No README data
    npm WARN EPACKAGEJSON markdown-it-3 No license field.

Create a `gulpfile.js` in your project root with these contents:

    var gulp = require('gulp'); // this is node's "require" command.

    gulp.task('default', function() {
      // place code for your default task here
      console.log("gulp!");
    });

Now you can run `gulp` and see what happens...

    [22:27:42] Using gulpfile C:\users\username\scratch\markdown-it-3\gulpfile.js
    [22:27:42] Starting 'default'...
    gulp!
    [22:27:42] Finished 'default' after 283 µs

## Source

 * [gulpjs Getting started](https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md)
 
## See Also

 * [install npm](../npm/install_npm.md)
 * [NPM -- some notes for beginners.](getting_started.md)