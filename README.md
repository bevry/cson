<!-- TITLE/ -->

# CSON

<!-- /TITLE -->

<!-- BADGES/ -->

<span class="badge-githubworkflow"><a href="https://github.com/bevry/cson/actions?query=workflow%3Abevry" title="View the status of this project's GitHub Workflow: bevry"><img src="https://github.com/bevry/cson/workflows/bevry/badge.svg" alt="Status of the GitHub Workflow: bevry" /></a></span>
<span class="badge-npmversion"><a href="https://npmjs.org/package/cson" title="View this project on NPM"><img src="https://img.shields.io/npm/v/cson.svg" alt="NPM version" /></a></span>
<span class="badge-npmdownloads"><a href="https://npmjs.org/package/cson" title="View this project on NPM"><img src="https://img.shields.io/npm/dm/cson.svg" alt="NPM downloads" /></a></span>
<br class="badge-separator" />
<span class="badge-githubsponsors"><a href="https://github.com/sponsors/balupton" title="Donate to this project using GitHub Sponsors"><img src="https://img.shields.io/badge/github-donate-yellow.svg" alt="GitHub Sponsors donate button" /></a></span>
<span class="badge-thanksdev"><a href="https://thanks.dev/u/gh/bevry" title="Donate to this project using ThanksDev"><img src="https://img.shields.io/badge/thanksdev-donate-yellow.svg" alt="ThanksDev donate button" /></a></span>
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-liberapay"><a href="https://liberapay.com/bevry" title="Donate to this project using Liberapay"><img src="https://img.shields.io/badge/liberapay-donate-yellow.svg" alt="Liberapay donate button" /></a></span>
<span class="badge-buymeacoffee"><a href="https://buymeacoffee.com/balupton" title="Donate to this project using Buy Me A Coffee"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg" alt="Buy Me A Coffee donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-crypto"><a href="https://bevry.me/crypto" title="Donate to this project using Cryptocurrency"><img src="https://img.shields.io/badge/crypto-donate-yellow.svg" alt="crypto donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<br class="badge-separator" />
<span class="badge-discord"><a href="https://discord.gg/nQuXddV7VP" title="Join this project's community on Discord"><img src="https://img.shields.io/discord/1147436445783560193?logo=discord&amp;label=discord" alt="Discord server badge" /></a></span>
<span class="badge-twitch"><a href="https://www.twitch.tv/balupton" title="Join this project's community on Twitch"><img src="https://img.shields.io/twitch/status/balupton?logo=twitch" alt="Twitch community badge" /></a></span>

<!-- /BADGES -->


CoffeeScript-Object-Notation. Same as JSON but for CoffeeScript objects.

[Projects using CSON.](https://www.npmjs.org/browse/depended/cson)

[Projects using CSON Parser directly.](https://www.npmjs.org/browse/depended/cson-parser)

Since v2, this CSON package is a higher-level wrapper around the lower-level [CSON Parser](https://www.npmjs.com/package/cson-parser).





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

Which is far more lenient than JSON, way nicer to write and read, no need to quote and escape everything, has comments and readable multi-line strings, and won't fail if you forget a comma.



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

Include CSON:

``` javascript
var CSON = require('cson')
```

Each method can be executed without a callback like so:

``` javascript
var result = CSON.createCSONString({a:{b:'c'}}, {/* optional options argument */})
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

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#stringify-instance'>String <strong>CSON.stringify</strong>(data, replacer?, indent?)</a> <br/> Converts an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> into a CSON <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#createCSONString-instance'>String <strong>CSON.createCSONString</strong>(data, opts?, next?)</a> <br/> Converts an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> into a CSON <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#createJSONString-instance'>String <strong>CSON.createJSONString</strong>(data, opts?, next?)</a> <br/> Converts an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> into a JSON <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#createString-instance'>String <strong>CSON.createString</strong>(data, opts?, next?)</a> <br/> Converts an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> into a <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> of the desired format If the format option is not specified, we default to CSON


### Parse Strings

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#parse-instance'>Object <strong>CSON.parse</strong>(data, opts?, next?)</a> <br/> Parses a CSON <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#parseCSONString-instance'>Object <strong>CSON.parseCSONString</strong>(data, opts?, next?)</a> <br/> Parses a CSON <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#parseJSONString-instance'>Object <strong>CSON.parseJSONString</strong>(data, opts?, next?)</a> <br/> Parses a JSON <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#parseCSString-instance'>Object <strong>CSON.parseCSString</strong>(data, opts?, next?)</a> <br/> Parses a CoffeeScript <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#parseJSString-instance'>Object <strong>CSON.parseJSString</strong>(data, opts?, next?)</a> <br/> Parses a JavaScript <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#parseString-instance'>Object <strong>CSON.parseString</strong>(data, opts?, next?)</a> <br/> Converts a <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String'>String</a> of the desired format into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> If the format option is not specified, we default to CSON


#### Parse Files

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#load-instance'>Object <strong>CSON.load</strong>(filePath, opts?, next?)</a> <br/> Parses a CSON file into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#parseCSONFile-instance'>Object <strong>CSON.parseCSONFile</strong>(filePath, opts?, next?)</a> <br/> Parses a CSON file into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#parseJSONFile-instance'>Object <strong>CSON.parseJSONFile</strong>(filePath, opts?, next?)</a> <br/> Parses a JSON file into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#parseCSFile-instance'>Object <strong>CSON.parseCSFile</strong>(filePath, opts?, next?)</a> <br/> Parses a CoffeeScript file into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#parseJSFile-instance'>Object <strong>CSON.parseJSFile</strong>(filePath, opts?, next?)</a> <br/> Parses a JavaScript file into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#parseFile-instance'>Object <strong>CSON.parseFile</strong>(filePath, opts?, next?)</a> <br/> Parses a file path of the desired format into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> If the format option is not specified, we use the filename to detect what it should be, otherwise we default to CSON


### Require Files

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#requireCSFile-instance'>Object <strong>CSON.requireCSFile</strong>(filePath, opts?, next?)</a> <br/> Requires a CoffeeScript file and returns the result <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#requireJSFile-instance'>Object <strong>CSON.requireJSFile</strong>(filePath, opts?, next?)</a> <br/> Requires a JavaScript file and returns the result <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a>

- <a href='http://master.cson.bevry.surge.sh/docs/classes/CSON.html#requireFile-instance'>Object <strong>CSON.requireFile</strong>(filePath, opts?, next?)</a> <br/> Requires or parses a file path of the desired format into an <a href='https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object'>Object</a> If the format option is not specified, we use the filename to detect what it should be, otherwise we default to parsing CSON














































































































<!-- INSTALL/ -->

## Install

### [npm](https://npmjs.com "npm is a package manager for javascript")

#### Install Globally

-   Install: `npm install --global cson`
-   Executables: `cson`, `cson2json`, `json2cson`

#### Install Locally

-   Install: `npm install --save cson`
-   Executables: `npx cson`, `npx cson2json`, `npx json2cson`
-   Import: `import * as pkg from ('cson')`
-   Require: `const pkg = require('cson')`

### [Editions](https://editions.bevry.me "Editions are the best way to produce and consume packages you care about.")

This package is published with the following editions:
-   `cson/source/index.coffee` is [CoffeeScript](https://coffeescript.org "CoffeeScript is a little language that compiles into JavaScript") source code with [Require](https://nodejs.org/dist/latest-v5.x/docs/api/modules.html "Node/CJS Modules") for modules
-   `cson` aliases `cson/edition-esnext/index.js`
-   `cson/edition-esnext/index.js` is [CoffeeScript](https://coffeescript.org "CoffeeScript is a little language that compiles into JavaScript") compiled for [Node.js](https://nodejs.org "Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine") 6 || 8 || 10 || 12 || 14 || 16 || 18 || 20 || 21 with [Require](https://nodejs.org/dist/latest-v5.x/docs/api/modules.html "Node/CJS Modules") for modules

<!-- /INSTALL -->

<!-- HISTORY/ -->

## History

[Discover the release history by heading on over to the `HISTORY.md` file.](https://github.com/bevry/cson/blob/HEAD/HISTORY.md#files)

<!-- /HISTORY -->

<!-- BACKERS/ -->

## Backers

### Code

[Discover how to contribute via the `CONTRIBUTING.md` file.](https://github.com/bevry/cson/blob/HEAD/CONTRIBUTING.md#files)

#### Authors

-   [Benjamin Lupton](https://balupton.com) — Accelerating collaborative wisdom.

#### Maintainers

-   [Benjamin Lupton](https://balupton.com) — Accelerating collaborative wisdom.

#### Contributors

-   [Attila Oláh](https://github.com/attilaolah) — [view contributions](https://github.com/bevry/cson/commits?author=attilaolah "View the GitHub contributions of Attila Oláh on repository bevry/cson")
-   [Attila Oláh](https://attilaolah.eu)
-   [Benjamin Lupton](https://github.com/balupton) — [view contributions](https://github.com/bevry/cson/commits?author=balupton "View the GitHub contributions of Benjamin Lupton on repository bevry/cson")
-   [Claudius Nicolae](https://github.com/clyfe) — [view contributions](https://github.com/bevry/cson/commits?author=clyfe "View the GitHub contributions of Claudius Nicolae on repository bevry/cson")
-   [evinugur](https://github.com/evinugur) — [view contributions](https://github.com/bevry/cson/commits?author=evinugur "View the GitHub contributions of evinugur on repository bevry/cson")
-   [Jason Karns](https://github.com/jasonkarns) — [view contributions](https://github.com/bevry/cson/commits?author=jasonkarns "View the GitHub contributions of Jason Karns on repository bevry/cson")
-   [Joël Perras](https://github.com/jperras) — [view contributions](https://github.com/bevry/cson/commits?author=jperras "View the GitHub contributions of Joël Perras on repository bevry/cson")
-   [Linus G Thiel](https://github.com/linus) — [view contributions](https://github.com/bevry/cson/commits?author=linus "View the GitHub contributions of Linus G Thiel on repository bevry/cson")
-   [Rob Loach](https://github.com/RobLoach) — [view contributions](https://github.com/bevry/cson/commits?author=RobLoach "View the GitHub contributions of Rob Loach on repository bevry/cson")
-   [Ryan LeFevre](https://github.com/meltingice) — [view contributions](https://github.com/bevry/cson/commits?author=meltingice "View the GitHub contributions of Ryan LeFevre on repository bevry/cson")
-   [Tushar Kant](https://github.com/nanuclickity) — [view contributions](https://github.com/bevry/cson/commits?author=nanuclickity "View the GitHub contributions of Tushar Kant on repository bevry/cson")
-   [Zearin](https://github.com/Zearin) — [view contributions](https://github.com/bevry/cson/commits?author=Zearin "View the GitHub contributions of Zearin on repository bevry/cson")
-   [ZHANG Cheng](https://github.com/zhangcheng) — [view contributions](https://github.com/bevry/cson/commits?author=zhangcheng "View the GitHub contributions of ZHANG Cheng on repository bevry/cson")

### Finances

<span class="badge-githubsponsors"><a href="https://github.com/sponsors/balupton" title="Donate to this project using GitHub Sponsors"><img src="https://img.shields.io/badge/github-donate-yellow.svg" alt="GitHub Sponsors donate button" /></a></span>
<span class="badge-thanksdev"><a href="https://thanks.dev/u/gh/bevry" title="Donate to this project using ThanksDev"><img src="https://img.shields.io/badge/thanksdev-donate-yellow.svg" alt="ThanksDev donate button" /></a></span>
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-liberapay"><a href="https://liberapay.com/bevry" title="Donate to this project using Liberapay"><img src="https://img.shields.io/badge/liberapay-donate-yellow.svg" alt="Liberapay donate button" /></a></span>
<span class="badge-buymeacoffee"><a href="https://buymeacoffee.com/balupton" title="Donate to this project using Buy Me A Coffee"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg" alt="Buy Me A Coffee donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-crypto"><a href="https://bevry.me/crypto" title="Donate to this project using Cryptocurrency"><img src="https://img.shields.io/badge/crypto-donate-yellow.svg" alt="crypto donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>

#### Sponsors

-   [Andrew Nesbitt](https://nesbitt.io) — Software engineer and researcher
-   [Balsa](https://balsa.com) — We're Balsa, and we're building tools for builders.
-   [Codecov](https://codecov.io) — Empower developers with tools to improve code quality and testing.
-   [Poonacha Medappa](https://poonachamedappa.com)
-   [Rob Morris](https://github.com/Rob-Morris)
-   [Sentry](https://sentry.io) — Real-time crash reporting for your web apps, mobile apps, and games.
-   [Syntax](https://syntax.fm) — Syntax Podcast

#### Donors

-   [Andrew Nesbitt](https://nesbitt.io)
-   [Armen Mkrtchian](https://mogoni.dev)
-   [Balsa](https://balsa.com)
-   [Chad](https://opencollective.com/chad8)
-   [Codecov](https://codecov.io)
-   [dr.dimitru](https://veliovgroup.com)
-   [Elliott Ditman](https://elliottditman.com)
-   [entroniq](https://gitlab.com/entroniq)
-   [GitHub](https://github.com/about)
-   [Hunter Beast](https://cryptoquick.com)
-   [Jean-Luc Geering](https://github.com/jlgeering)
-   [Michael Duane Mooring](https://mdm.cc)
-   [Michael Harry Scepaniak](https://michaelscepaniak.com)
-   [Mohammed Shah](https://github.com/smashah)
-   [Mr. Henry](https://mrhenry.be)
-   [Nermal](https://arjunaditya.vercel.app)
-   [Pleo](https://pleo.io)
-   [Poonacha Medappa](https://poonachamedappa.com)
-   [Rob Morris](https://github.com/Rob-Morris)
-   [Robert de Forest](https://github.com/rdeforest)
-   [Sentry](https://sentry.io)
-   [ServieJS](https://github.com/serviejs)
-   [Skunk Team](https://skunk.team)
-   [Syntax](https://syntax.fm)
-   [WriterJohnBuck](https://github.com/WriterJohnBuck)

<!-- /BACKERS -->

<!-- LICENSE/ -->

## License

Unless stated otherwise all works are:

-   Copyright &copy; [Benjamin Lupton](https://balupton.com)

and licensed under:

-   [Artistic License 2.0](http://spdx.org/licenses/Artistic-2.0.html)

<!-- /LICENSE -->
