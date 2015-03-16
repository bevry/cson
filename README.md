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

[Projects using CSON Parser directly.](https://www.npmjs.org/browse/depended/cson-parser)


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
# Comments!!!

# An Array with no commas!
greatDocumentaries: [
	'earthlings.com'
	'forksoverknives.com'
	'cowspiracy.com'
]

# An Object without braces!
importantFacts:
	# Multi-Line Strings! Without Quote Escaping!
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

Which is far more lenient that JSON, way nicer to write and read, no need to quote and escape everything, has comments and readable multi-line strings, and won't fail if you forget a comma.



## Using CSON

### Via the Command Line

Use CSON with the command line with:

``` bash
# Convert a JSON file into a CSON file
json2cson in.json > out.cson
# Same thing via piping
cat in.json | json2cson > out.cson

# Convert a CSON file into a JSON file
cson2json in.cson > out.json
# Same thing via piping
cat in.cson | cson2json > out.json
```

Requires a global CSON install: `npm install -g cson`


### Via the API

Each method can be executed without a callback like so:

``` javascript
result = require('CSON').createCSONString({a:{b:'c'}}, {/* optional options argument */})
if ( result instanceof Error ) {
	console.log(result.stack)
} else {
	console.log(result)
}
```

Or via a callback like so:

``` javascript
CSON.createCSONString({a:{b:'c'}}, {/* optional options argument */}, function(err,result){
	console.log(err, result)
})
```

Executing the method with a callback still executes the method synchronously.

Click the below function names to open more detailed documentation.


#### Create Strings

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#stringify-instance'>
String <strong>CSON.stringify</strong>(data, replacer?, indent?)
</a> <br/> Converts an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> into a <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> of the desired format If the format option is not specified, we default to CSON

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#createString-instance'>
String <strong>CSON.createString</strong>(data, opts?, next?)
</a> <br/> Converts an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> into a <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> of the desired format If the format option is not specified, we default to CSON

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#createCSONString-instance'>
String <strong>CSON.createCSONString</strong>(data, opts?, next?)
</a> <br/> Converts an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> into a CSON <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a>

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#createJSONString-instance'>
String <strong>CSON.createJSONString</strong>(data, opts?, next?)
</a> <br/> Converts an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> into a JSON <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a>


### Parse Strings

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#parse-instance'>
Object <strong>CSON.parse</strong>(data, opts?, next?)
</a> <br/> Converts a <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> of the desired format into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> If the format option is not specified, we default to CSON

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#parseString-instance'>
Object <strong>CSON.parseString</strong>(data, opts?, next?)
</a> <br/> Converts a <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> of the desired format into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> If the format option is not specified, we default to CSON

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#parseCSONString-instance'>
Object <strong>CSON.parseCSONString</strong>(data, opts?, next?)
</a> <br/> Parses a CSON <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#parseJSONString-instance'>
Object <strong>CSON.parseJSONString</strong>(data, opts?, next?)
</a> <br/> Parses a JSON <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#parseCSString-instance'>
Object <strong>CSON.parseCSString</strong>(data, opts?, next?)
</a> <br/> Parses a CoffeeScript <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#parseJSString-instance'>
Object <strong>CSON.parseJSString</strong>(data, opts?, next?)
</a> <br/> Parses a JavaScript <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

#### Parse Files

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#load-instance'>
Object <strong>CSON.load</strong>(filePath, opts?, next?)
</a> <br/> Parses a file path of the desired format into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> If the format option is not specified, we use the filename to detect what it should be, otherwise we default to CSON

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#parseFile-instance'>
Object <strong>CSON.parseFile</strong>(filePath, opts?, next?)
</a> <br/> Parses a file path of the desired format into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> If the format option is not specified, we use the filename to detect what it should be, otherwise we default to CSON

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#parseCSONFile-instance'>
Object <strong>CSON.parseCSONFile</strong>(filePath, opts?, next?)
</a> <br/> Parses a CSON file into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#parseJSONFile-instance'>
Object <strong>CSON.parseJSONFile</strong>(filePath, opts?, next?)
</a> <br/> Parses a JSON file into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#parseCSFile-instance'>
Object <strong>CSON.parseCSFile</strong>(filePath, opts?, next?)
</a> <br/> Parses a CoffeeScript file into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#parseJSFile-instance'>
Object <strong>CSON.parseJSFile</strong>(filePath, opts?, next?)
</a> <br/> Parses a JavaScript file into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

### Require Files

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#requireFile-instance'>
Object <strong>CSON.requireFile</strong>(filePath, opts?, next?)
</a> <br/> Requires or parses a file path of the desired format into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> If the format option is not specified, we use the filename to detect what it should be, otherwise we default to CSON

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#requireCSFile-instance'>
Object <strong>CSON.requireCSFile</strong>(filePath, opts?, next?)
</a> <br/> Requires a CoffeeScript file and returns the result <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://rawgit.com/bevry/cson/master/docs/classes/CSON.html#requireJSFile-instance'>
Object <strong>CSON.requireJSFile</strong>(filePath, opts?, next?)
</a> <br/> Requires a JavaScript file and returns the result <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>


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

Unless stated otherwise all works are:

- Copyright &copy; 2012+ Bevry Pty Ltd <us@bevry.me> (http://bevry.me)
- Copyright &copy; 2011 Benjamin Lupton <b@lupton.cc> (http://balupton.com)

and licensed under:

- The incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://opensource.org/licenses/mit-license.php)

<!-- /LICENSE -->


