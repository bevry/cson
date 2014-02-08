
<!-- TITLE/ -->

# CSON

<!-- /TITLE -->


<!-- BADGES/ -->

[![Build Status](http://img.shields.io/travis-ci/bevry/cson.png?branch=master)](http://travis-ci.org/bevry/cson "Check this project's build status on TravisCI")
[![NPM version](http://badge.fury.io/js/cson.png)](https://npmjs.org/package/cson "View this project on NPM")
[![Dependency Status](https://david-dm.org/bevry/cson.png?theme=shields.io)](https://david-dm.org/bevry/cson)
[![Development Dependency Status](https://david-dm.org/bevry/cson/dev-status.png?theme=shields.io)](https://david-dm.org/bevry/cson#info=devDependencies)<br/>
[![Gittip donate button](http://img.shields.io/gittip/bevry.png)](https://www.gittip.com/bevry/ "Donate weekly to this project using Gittip")
[![Flattr donate button](http://img.shields.io/flattr/donate.png?color=yellow)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](http://img.shields.io/paypal/donate.png?color=yellow)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](http://img.shields.io/bitcoin/donate.png?color=yellow)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](http://img.shields.io/wishlist/browse.png?color=yellow)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

<!-- /BADGES -->


<!-- DESCRIPTION/ -->

CoffeeScript-Object-Notation Parser. Same as JSON but for CoffeeScript objects

<!-- /DESCRIPTION -->


<!-- INSTALL/ -->

## Install

### [Node](http://nodejs.org/)
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

Which is far more lenient than JSON, nicer to write and read, you don't have to quote everything, you have comments, and won't fail if you forget a comma.



## Installing


1. [Install Node.js](http://bevry.me/node/install)

2. Install CSON

	``` bash
	npm install --save cson
	```


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

[![Gittip donate button](http://img.shields.io/gittip/bevry.png)](https://www.gittip.com/bevry/ "Donate weekly to this project using Gittip")
[![Flattr donate button](http://img.shields.io/flattr/donate.png?color=yellow)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](http://img.shields.io/paypal/donate.png?color=yellow)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](http://img.shields.io/bitcoin/donate.png?color=yellow)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](http://img.shields.io/wishlist/browse.png?color=yellow)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

### Contributors

These amazing people have contributed code to this project:

- [Benjamin Lupton](https://github.com/balupton) <b@lupton.cc> — [view contributions](https://github.com/bevry/cson/commits?author=balupton)
- [jasonkarns](https://github.com/jasonkarns) — [view contributions](https://github.com/bevry/cson/commits?author=jasonkarns)
- [Joel Perras](https://github.com/jperras) <joel.perras@gmail.com> — [view contributions](https://github.com/bevry/cson/commits?author=jperras)
- [Linus G Thiel](https://github.com/linus) <linus@hanssonlarsson.se> — [view contributions](https://github.com/bevry/cson/commits?author=linus)
- [Nicolae Claudius](https://github.com/clyfe) <claudius.nicolae@gmail.com> — [view contributions](https://github.com/bevry/cson/commits?author=clyfe)
- [Ryan LeFevre](https://github.com/meltingice) <meltingice8917@gmail.com> — [view contributions](https://github.com/bevry/cson/commits?author=meltingice)
- [Zhang Cheng](https://github.com/zhangcheng) <czhang.oss@gmail.com> — [view contributions](https://github.com/bevry/cson/commits?author=zhangcheng)

[Become a contributor!](https://github.com/bevry/cson/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

Copyright &copy; 2012+ Bevry Pty Ltd <us@bevry.me> (http://bevry.me)
<br/>Copyright &copy; 2011 Benjamin Lupton <b@lupton.cc> (http://balupton.com)

<!-- /LICENSE -->


