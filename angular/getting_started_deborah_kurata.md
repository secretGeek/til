# Getting Started with Angular (Deborah Kurata)


These are my study notes for the coure [Angular: Getting Started](https://app.pluralsight.com/library/courses/angular-2-getting-started-update/table-of-contents) from Deborah Kurata, on pluralsight.

The course duration is 5h43m.

Get source code from here:

* <https://github.com/DeborahK/Angular-GettingStarted>

A blog post from Deborah to support the course is here:

* <https://blogs.msmvps.com/deborahk/angular-2-getting-started-problem-solver/>



	git clone https://github.com/DeborahK/Angular-GettingStarted.git
	cd .\Angular-GettingStarted\

The main demo app is "APM" which stands for "Acme Product Management"

Under the APM-Start folder, here's the initial structure

  ├───e2e
  │   └───src
  └───src
      ├───api
      │   └───products
      ├───app
      │   ├───home
      │   └───shared
      ├───assets
      │   └───images
      └───environments

Can download the exercise files from:

https://app.pluralsight.com/library/courses/angular-2-getting-started-update/exercise-files

(I've put them in my `~learning/angular/` folder)


## Lessons


### Introduction

- Angular is a javascript framework for building client side applications.
- Composed of "Components". Components are put together into modules. 
- There is always at least 1 module, the Root Angular Module.
- A component has: a class (with properties and methods), some metadata, a template.
- Code is generally written in typescript, in es2015, and transpiled down to es5 (hint: use vs code)
- Create "services" for getting data in/out. Probably for other things too.

## First things first

- Some javascript background. Javascript is "ecmascript" in the standards. All browsers support at least es5. es2015 is nicer, has arrow functions etc (and was formerly known as es6). May need to transpile it back down to es5. 
- typescript definition files -- those are the ones that end with *.d.ts



- setup environment:
- need npm
- use npm to get angular
- get npm from https://nodejs.org/en/download

Already have it? check you have version at least `6.9.0` (from 2019)

    npm --version
    6.14.1

Fiiiine.



## See also

* [Discussion group for the course here](https://app.pluralsight.com/library/courses/angular-2-getting-started-update/discussion) with 6404 comments