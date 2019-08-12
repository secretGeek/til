# How do I list all globally installed NPM Packages?



	npm list -g -depth 0

The above lists all the globally installed npm packages, and does not list their dependencies.

Omit the "depth 0" bit and you'll also see the full ugly rat's nest of dependencies they've wrought upon your hard ware.