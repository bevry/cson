<!-- TITLE/ -->

# CSON

<!-- /TITLE -->


<!-- BADGES/ -->

[![Build Status](https://img.shields.io/travis/bevry/cson/master.svg)](http://travis-ci.org/bevry/cson "Check this project's build status on TravisCI")
[![NPM version](https://img.shields.io/npm/v/cson.svg)](https://npmjs.org/package/cson "View this project on NPM")
[![NPM downloads](https://img.shields.io/npm/dm/cson.svg)](https://npmjs.org/package/cson "View this project on NPM")
[![Dependency Status](https://img.shields.io/david/bevry/cson.svg)](https://david-dm.org/bevry/cson)
[![Dev Dependency Status](https://img.shields.io/david/dev/bevry/cson.svg)](https://david-dm.org/bevry/cson#info=devDependencies)<br/>
[![Gratipay donate button](https://img.shields.io/gratipay/bevry.svg)](https://www.gratipay.com/bevry/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

<!-- /BADGES -->


CoffeeScript-Object-Notation Parser. Same as JSON but for CoffeeScript objects.

[Projects using CSON.](https://www.npmjs.org/browse/depended/cson)


<!-- INSTALL/ -->

## Install

### [NPM](http://npmjs.org/)
- Use: `require('cson')`
- Install: `npm install --save cson`

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
[Discover the change history by heading on over to the `HISTORY.md` file.](https://github.com/bevry/cson/blob/master/HISTORY.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/bevry/cson/blob/master/CONTRIBUTING.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- Benjamin Lupton <b@lupton.cc> (https://github.com/balupton)

### Sponsors

No sponsors yet! Will you be the first?

[![Gratipay donate button](https://img.shields.io/gratipay/bevry.svg)](https://www.gratipay.com/bevry/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

### Contributors

These amazing people have contributed code to this project:

- [attilaolah](https://github.com/attilaolah) — [view contributions](https://github.com/bevry/cson/commits?author=attilaolah)
- [Benjamin Lupton](https://github.com/balupton) <b@lupton.cc> — [view contributions](https://github.com/bevry/cson/commits?author=balupton)
- [evinugur](https://github.com/evinugur) — [view contributions](https://github.com/bevry/cson/commits?author=evinugur)
- [jasonkarns](https://github.com/jasonkarns) — [view contributions](https://github.com/bevry/cson/commits?author=jasonkarns)
- [Joel Perras](https://github.com/jperras) <joel.perras@gmail.com> — [view contributions](https://github.com/bevry/cson/commits?author=jperras)
- [Linus G Thiel](https://github.com/linus) <linus@hanssonlarsson.se> — [view contributions](https://github.com/bevry/cson/commits?author=linus)
- [Nicolae Claudius](https://github.com/clyfe) <claudius.nicolae@gmail.com> — [view contributions](https://github.com/bevry/cson/commits?author=clyfe)
- [RobLoach](https://github.com/RobLoach) — [view contributions](https://github.com/bevry/cson/commits?author=RobLoach)
- [Ryan LeFevre](https://github.com/meltingice) <meltingice8917@gmail.com> — [view contributions](https://github.com/bevry/cson/commits?author=meltingice)
- [Zearin](https://github.com/Zearin) — [view contributions](https://github.com/bevry/cson/commits?author=Zearin)
- [Zhang Cheng](https://github.com/zhangcheng) <czhang.oss@gmail.com> — [view contributions](https://github.com/bevry/cson/commits?author=zhangcheng)

[Become a contributor!](https://github.com/bevry/cson/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

Copyright &copy; 2012+ Bevry Pty Ltd <us@bevry.me> (http://bevry.me)
<br/>Copyright &copy; 2011 Benjamin Lupton <b@lupton.cc> (http://balupton.com)

<!-- /LICENSE -->


