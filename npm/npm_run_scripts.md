# npm run scripts


> npm looks at a field called scripts in the package.json of a project in order to make things like npm test from the scripts.test field and npm start from the scripts.start field work.

    {
        "name": "my-silly-app",
        "version": "1.2.3",
        "private": true,
        "dependencies": {
            "browserify": "~2.35.2",
            "uglifyjs": "~2.3.6"
        },
        "devDependencies": {
            "watchify": "~0.1.0",
            "catw": "~0.0.1",
            "tap": "~0.4.4"
        },
        "scripts": {
            "build-js": "browserify browser/main.js | uglifyjs -mc > static/bundle.js",
            "build-css": "cat static/pages/*.css tabs/*/*.css",
            "build": "npm run build-js && npm run build-css",
            "watch-js": "watchify browser/main.js -o static/bundle.js -dv",
            "watch-css": "catw static/pages/*.css tabs/*/*.css -o static/bundle.css -v",
            "watch": "npm run watch-js & npm run watch-css",
            "start": "node server.js",
            "test": "tap test/*.js"
        }
    }


typing:


	npm build-js

...in that project would be the same as typing:


	npm run browserify browser/main.js | uglifyjs -mc > static/bundle.js

(because of the line under scripts that says: `"build-js": "browserify browser/main.js | uglifyjs -mc > static/bundle.js",`)




## Source

 * http://substack.net/task_automation_with_npm_run
 * https://medium.com/@maybekatz/kat-s-short-guide-to-js-devops-ecosystem-9ffef67fdb8e#.jd4ha6udn
 * http://nodeschool.io/