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


CoffeeScript-Object-Notation. Same as JSON but for CoffeeScript objects.

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
  "greatDocumentaries": [
    "earthlings.com",
    "forksoverknives.com",
    "cowspiracy.com"
  ],
  "importantFacts": {
    "emissions": "Livestock and their byproducts account for at least 32,000 million tons of carbon dioxide (CO2) per year, or 51% of all worldwide greenhouse gas emissions.\nGoodland, R Anhang, J. “Livestock and Climate Change: What if the key actors in climate change were pigs, chickens and cows?”\nWorldWatch, November/December 2009. Worldwatch Institute, Washington, DC, USA. Pp. 10–19.\nhttp://www.worldwatch.org/node/6294",
    "landuse": "Livestock covers 45% of the earth’s total land.\nThornton, Phillip, Mario Herrero, and Polly Ericksen. “Livestock and Climate Change.” Livestock Exchange, no. 3 (2011).\nhttps://cgspace.cgiar.org/bitstream/handle/10568/10601/IssueBrief3.pdf",
    "burger": "One hamburger requires 660 gallons of water to produce – the equivalent of 2 months’ worth of showers.\nCatanese, Christina. “Virtual Water, Real Impacts.” Greenversations: Official Blog of the U.S. EPA. 2012.\nhttp://blog.epa.gov/healthywaters/2012/03/virtual-water-real-impacts-world-water-day-2012/\n“50 Ways to Save Your River.” Friends of the River.\nhttp://www.friendsoftheriver.org/site/PageServer?pagename=50ways",
    "milk": "1,000 gallons of water are required to produce 1 gallon of milk.\n“Water trivia facts.” United States Environmental Protection Agency.\nhttp://water.epa.gov/learn/kids/drinkingwater/water_trivia_facts.cfm#_edn11",
    "more": "http://cowspiracy.com/facts"
  }
}
```

Now let's write the same thing in CSON:

``` coffeescript
# Look Ma! Comments!!!

# Look Ma! An Array with no commas!
greatDocumentaries: [
	'earthlings.com'
	'forksoverknives.com'
	'cowspiracy.com'
]

# Look Ma! An Object without braces!
importantFacts:
	# Look Ma! Multi-Line Strings! Without Quote Escaping!
	emissions: '''
		Livestock and their byproducts account for at least 32,000 million tons of carbon dioxide (CO2) per year, or 51% of all worldwide greenhouse gas emissions.
		Goodland, R Anhang, J. “Livestock and Climate Change: What if the key actors in climate change were pigs, chickens and cows?”
		WorldWatch, November/December 2009. Worldwatch Institute, Washington, DC, USA. Pp. 10–19.
		http://www.worldwatch.org/node/6294
		'''

	landuse: '''
		Livestock covers 45% of the earth’s total land.
		Thornton, Phillip, Mario Herrero, and Polly Ericksen. “Livestock and Climate Change.” Livestock Exchange, no. 3 (2011).
		https://cgspace.cgiar.org/bitstream/handle/10568/10601/IssueBrief3.pdf
		'''

	burger: '''
		One hamburger requires 660 gallons of water to produce – the equivalent of 2 months’ worth of showers.
		Catanese, Christina. “Virtual Water, Real Impacts.” Greenversations: Official Blog of the U.S. EPA. 2012.
		http://blog.epa.gov/healthywaters/2012/03/virtual-water-real-impacts-world-water-day-2012/
		“50 Ways to Save Your River.” Friends of the River.
		http://www.friendsoftheriver.org/site/PageServer?pagename=50ways
		'''

	milk: '''
		1,000 gallons of water are required to produce 1 gallon of milk.
		“Water trivia facts.” United States Environmental Protection Agency.
		http://water.epa.gov/learn/kids/drinkingwater/water_trivia_facts.cfm#_edn11
		'''

	more: 'http://cowspiracy.com/facts'
```

That's far more lenient that JSON, way nicer to write and read, no need to quote and escape everything, has comments and readable multi-line strings, and won't fail if you forget a comma.



## Using CSON


- With Node.js (JavaScript Example)

	``` javascript
	// Include CSON
	var CSON = require('cson')
	var result = null
	var file = 'data.cson'
	var source = '{a:b:1}'
	var opts = {}


	// -----------------------------------
	// Parsing a CSON or JSON file to an Object

	// Asynchronously
	CSON.parseFile(file, opts, function(err,result){
		if ( err ) {
			console.log(err.stack)
		} else {
			console.log(result)
		}
	})

	// Synchronously
	result = CSON.parseFileSync(file, opts)
	if ( result instanceof Error ) {
		console.log(result.stack)
	} else {
		console.log(result)
	}


	// -----------------------------------
	// Parsing CSON or JSON to an Object

	// Asynchronously
	CSON.parseFile(source, opts, function(err,result){
		if ( err ) {
			console.log(err.stack)
		} else {
			console.log(result)
		}
	})

	// Synchronously
	result = CSON.parseFileSync(source, opts)
	if ( result instanceof Error ) {
		console.log(result.stack)
	} else {
		console.log(result)
	}


	// -----------------------------------
	// Stringify an Object to a CSON string

	// Asynchronously
	CSON.stringify(source, opts, function(err,result){
		if ( err ) {
			console.log(err.stack)
		} else {
			console.log(result)
		}
	})

	// Synchronously
	result = CSON.stringifySync(source, opts)
	if ( result instanceof Error ) {
		console.log(result.stack)
	} else {
		console.log(result)
	}
	```


- Via the command line (requires a global installation of CSON via `npm install -g cson`)

	``` bash
	# JSON file to CSON String
	json2cson filePath > out.cson

	# CSON file to JSON String
	cson2json filePath > out.json
	```


## API

### Parsing Files

- `CSON.parseFile(filepath, opts?, next)`
	- `filepath` is a `cson` or `json` file that you would like to parse, if the `safe` option is `false`, then it will also parse `coffee` and `js` files
	- `opts` is an optional object that is also sent to the parser if needed
	- `next` the completion callback, accepts the arguments `(err, resultObject)`

- `var resultObject = CSON.parseFile(filepath, opts?)`, same as above but synchronous


### Parsing Source Code

- `CSON.parse(source, opts?, next)`
	- `source` is a JSON or CSON string that you would like to parse
	- `opts` is an optional object that is also sent to the parser if needed
	- `next` the completion callback, accepts the arguments `(err, resultObject)`

- `var resultObjectOrError = CSON.parse(filepath, opts?)`, same as above but synchronous


### Stringifying an Object

- `CSON.stringify(object, opts?, next)`
	- `object` is an object that you would like to convert to a CSON string
	- `opts` is an optional object that is also sent to the parser if needed
	- `next` the completion callback, accepts the arguments `(err, resultString)`

- `var resultStringOrError = CSON.stringify(filepath, opts?)`, same as above but synchronous



## Safe Mode VS Unsafe Mode

By default CSON v2 and above operate in safe mode.

There is a `safe` option that is `true` by default, that you can set to `false` to run in Unsafe Mode if desired.

In the default Safe Mode, CSON parses CSON and JSON content securely and safely without execution. To do this, CSON loads the [cson-safe package](https://www.npmjs.com/package/cson-safe).

In Unsafe Mode, CSON parses CSON, CoffeeScript, and JS content securely but unsafely. Unsafe as in things like `while true` would work, secure as in things like `require('fs')` would not work. To do the parsing, CSON loads the [coffee-script package](https://www.npmjs.com/package/coffee-script)'s eval function to parse, with the sandbox mode option enabled to that the parsing/execution occurs within a [node virtual machine](http://nodejs.org/api/vm.html) for isolation. To do the stringifying CSON loads the [js2coffee](https://www.npmjs.com/package/js2coffee) package to do a safe and secure conversion of an object to a unsafe CSON string (unsafe CSON string, as the result CSON string is able to contain functions).

For nearly all use cases the default safe mode is sufficient. However, if you are writing applications for developers where the CSON configuration writer is also the application developer and you would like the ability to have functions inside your configuration (such as specifying event handlers), then unsafe mode is an option. For instance, [DocPad](http://docpad.org/) the largest static site generator for Node.js uses CSON in unsafe mode for it's [configuration](https://docpad.org/docs/config) to allow its users (fellow web developers) to specify


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
- [nanuclickity](https://github.com/nanuclickity) — [view contributions](https://github.com/bevry/cson/commits?author=nanuclickity)
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


