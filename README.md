<!-- TITLE/ -->

# CSON

<!-- /TITLE -->


<!-- BADGES/ -->

[![Build Status](http://img.shields.io/travis-ci/bevry/cson.png?branch=master)](http://travis-ci.org/bevry/cson "Check this project's build status on TravisCI")
[![NPM version](http://badge.fury.io/js/cson.png)](https://npmjs.org/package/cson "View this project on NPM")
[![Gittip donate button](http://img.shields.io/gittip/bevry.png)](https://www.gittip.com/bevry/ "Donate weekly to this project using Gittip")
[![Flattr donate button](http://img.shields.io/flattr/donate.png?color=yellow)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](http://img.shields.io/paypal/donate.png?color=yellow)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")

<!-- /BADGES -->


CoffeeScript-Object-Notation Parser. Same as JSON but for CoffeeScript objects.

[Projects using CSON.](https://www.npmjs.org/browse/depended/cson)


<!-- INSTALL/ -->

## Install

### [Node](http://nodejs.org/), [Browserify](http://browserify.org/)
- Use: `require('cson')`
- Install: `npm install --save cson`

### [Ender](http://ender.jit.su/)
- Use: `require('cson')`
- Install: `ender add cson`

<!-- /INSTALL -->


## What is CSON?

Everyone knows JSON, it's the thing that looks like this:

``` javascript
{
	"abc": [
		"a",
		"b",
		"c"
	],
	"a": {
		"b": "c"
	}
}
```

But with the invention of CoffeeScript you can also write the same thing in CSON which looks like this:

``` coffeescript
{
	# an array
	abc: [
		'a'
		'b'
		'c'
	]

	# an object
	a:
		b: 'c'
}
```

Which is far more lenient than JSON, way nicer to write and read, no need to quote everything, has comments and readable multi-line strings, and won't fail if you forget a comma.



## Using CSON


- With Node.js in JavaScript

	``` javascript
	// Include CSON
	CSON = require('cson');

	// Parse a file path
	CSON.parseFile('data.cson', function(err,obj){});  // async
	result = CSON.parseFileSync('data.cson');  // sync

	// Parse a String
	CSON.parse(src, function(err,obj){});  // async
	result = CSON.parseSync(src);  // sync

	// Stringify an object to CSON
	CSON.stringify(obj, function(err,str){});  // async
	result = CSON.stringifySync(obj);  // sync
	```


- With Node.js in CoffeeScript

	``` coffeescript
	# Include CSON
	CSON = require('cson')

	# Parse a file path
	CSON.parseFile 'data.cson', (err,obj) ->  # async
	result = CSON.parseFileSync('data.cson')  # sync

	# Parse a string
	CSON.parse src, (err,obj) ->  # async
	result = CSON.parseSync(src)  # sync

	# Stringify an object to CSON
	CSON.stringify data, (err,str) ->  # async
	result = CSON.stringifySync(obj)  # sync


- Via the command line (requires a global installation of CSON via `npm install -g cson`)

	``` bash
	# JSON file to CSON String
	json2cson filePath > out.cson

	# CSON file to JSON String
	cson2json filePath > out.json
	```


## Use Case

CSON is fantastic for developers writing their own configuration to be executed on their own machines, but bad for configuration you can't trust. This is because parsing CSON will execute the CSON input as CoffeeScript code (making it unsafe, so `while true` would work) but it does so inside a [node virtual machine](http://nodejs.org/api/vm.html) for isolation (making it secure, so `require('fs')` won't work) resulting in the evaluated JavaScript object. This is a non-issue for the only use case which CSON actually makes sense for (developers writing their own configuration to be executed on their own machines). [Issue #32 has more information.](https://github.com/bevry/cson/issues/32)



<!-- HISTORY/ -->

## History
[Discover the change history by heading on over to the `History.md` file.](https://github.com/bevry/cson/blob/master/History.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `Contributing.md` file.](https://github.com/bevry/cson/blob/master/CONTRIBUTING.md#contribute)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- Benjamin Lupton <b@lupton.cc> (https://github.com/balupton)

### Sponsors

No sponsors yet! Will you be the first?

[![Gittip donate button](http://img.shields.io/gittip/bevry.png)](https://www.gittip.com/bevry/ "Donate weekly to this project using Gittip")
[![Flattr donate button](http://img.shields.io/flattr/donate.png?color=yellow)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](http://img.shields.io/paypal/donate.png?color=yellow)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")

### Contributors

These amazing people have contributed code to this project:

- Benjamin Lupton <b@lupton.cc> (https://github.com/balupton) - [view contributions](https://github.com/bevry/cson/commits?author=balupton)
- Joel Perras <joel.perras@gmail.com> (https://github.com/jperras) - [view contributions](https://github.com/bevry/cson/commits?author=jperras)
- Linus G Thiel <linus@hanssonlarsson.se> (https://github.com/linus) - [view contributions](https://github.com/bevry/cson/commits?author=linus)
- Nicolae Claudius <claudius.nicolae@gmail.com> (https://github.com/clyfe) - [view contributions](https://github.com/bevry/cson/commits?author=clyfe)
- Ryan LeFevre <meltingice8917@gmail.com> (https://github.com/meltingice) - [view contributions](https://github.com/bevry/cson/commits?author=meltingice)
- Zhang Cheng <czhang.oss@gmail.com> (https://github.com/zhangcheng) - [view contributions](https://github.com/bevry/cson/commits?author=zhangcheng)

[Become a contributor!](https://github.com/bevry/cson/blob/master/Contributing.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

Copyright &copy; 2012+ Bevry Pty Ltd <us@bevry.me> (http://bevry.me)
<br/>Copyright &copy; 2011 Benjamin Lupton <b@lupton.cc> (http://balupton.com)

<!-- /LICENSE -->


