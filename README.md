<!-- TITLE/ -->

<h1>CSON</h1>

<!-- /TITLE -->


<!-- BADGES/ -->

<span class="badge-githubworkflow"><a href="https://github.com/bevry/cson/actions?query=workflow%3Abevry" title="View the status of this project's GitHub Workflow: bevry"><img src="https://github.com/bevry/cson/workflows/bevry/badge.svg" alt="Status of the GitHub Workflow: bevry" /></a></span>
<span class="badge-npmversion"><a href="https://npmjs.org/package/cson" title="View this project on NPM"><img src="https://img.shields.io/npm/v/cson.svg" alt="NPM version" /></a></span>
<span class="badge-npmdownloads"><a href="https://npmjs.org/package/cson" title="View this project on NPM"><img src="https://img.shields.io/npm/dm/cson.svg" alt="NPM downloads" /></a></span>
<br class="badge-separator" />
<span class="badge-githubsponsors"><a href="https://github.com/sponsors/balupton" title="Donate to this project using GitHub Sponsors"><img src="https://img.shields.io/badge/github-donate-yellow.svg" alt="GitHub Sponsors donate button" /></a></span>
<span class="badge-thanksdev"><a href="https://thanks.dev/u/gh/bevry" title="Donate to this project using ThanksDev"><img src="https://img.shields.io/badge/thanksdev-donate-yellow.svg" alt="ThanksDev donate button" /></a></span>
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-liberapay"><a href="https://liberapay.com/bevry" title="Donate to this project using Liberapay"><img src="https://img.shields.io/badge/liberapay-donate-yellow.svg" alt="Liberapay donate button" /></a></span>
<span class="badge-buymeacoffee"><a href="https://buymeacoffee.com/balupton" title="Donate to this project using Buy Me A Coffee"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg" alt="Buy Me A Coffee donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-crypto"><a href="https://bevry.me/crypto" title="Donate to this project using Cryptocurrency"><img src="https://img.shields.io/badge/crypto-donate-yellow.svg" alt="crypto donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>

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

<h2>Install</h2>

<a href="https://npmjs.com" title="npm is a package manager for javascript"><h3>npm</h3></a>
<h4>Install Globally</h4>
<ul>
<li>Install: <code>npm install --global cson</code></li>
<li>Executables: <code>cson</code>, <code>cson2json</code>, <code>json2cson</code></li>
</ul>
<h4>Install Locally</h4>
<ul>
<li>Install: <code>npm install --save cson</code></li>
<li>Executables: <code>npx cson</code>, <code>npx cson2json</code>, <code>npx json2cson</code></li>
<li>Import: <code>import * as pkg from ('cson')</code></li>
<li>Require: <code>const pkg = require('cson')</code></li>
</ul>

<h3><a href="https://editions.bevry.me" title="Editions are the best way to produce and consume packages you care about.">Editions</a></h3>

<p>This package is published with the following editions:</p>

<ul><li><code>cson/source/index.coffee</code> is <a href="https://coffeescript.org" title="CoffeeScript is a little language that compiles into JavaScript">CoffeeScript</a> source code with <a href="https://nodejs.org/dist/latest-v5.x/docs/api/modules.html" title="Node/CJS Modules">Require</a> for modules</li>
<li><code>cson</code> aliases <code>cson/edition-esnext/index.js</code></li>
<li><code>cson/edition-esnext/index.js</code> is <a href="https://coffeescript.org" title="CoffeeScript is a little language that compiles into JavaScript">CoffeeScript</a> compiled for <a href="https://nodejs.org" title="Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine">Node.js</a> with <a href="https://nodejs.org/dist/latest-v5.x/docs/api/modules.html" title="Node/CJS Modules">Require</a> for modules</li></ul>

<!-- /INSTALL -->


<!-- HISTORY/ -->

<h2>History</h2>

<a href="https://github.com/bevry/cson/blob/master/HISTORY.md#files">Discover the release history by heading on over to the <code>HISTORY.md</code> file.</a>

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

<h2>Contribute</h2>

<a href="https://github.com/bevry/cson/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

<h2>Backers</h2>

<h3>Maintainers</h3>

These amazing people are maintaining this project:

<ul><li><a href="https://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/bevry/cson/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository bevry/cson">view contributions</a></li></ul>

<h3>Sponsors</h3>

No sponsors yet! Will you be the first?

<span class="badge-githubsponsors"><a href="https://github.com/sponsors/balupton" title="Donate to this project using GitHub Sponsors"><img src="https://img.shields.io/badge/github-donate-yellow.svg" alt="GitHub Sponsors donate button" /></a></span>
<span class="badge-thanksdev"><a href="https://thanks.dev/u/gh/bevry" title="Donate to this project using ThanksDev"><img src="https://img.shields.io/badge/thanksdev-donate-yellow.svg" alt="ThanksDev donate button" /></a></span>
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-liberapay"><a href="https://liberapay.com/bevry" title="Donate to this project using Liberapay"><img src="https://img.shields.io/badge/liberapay-donate-yellow.svg" alt="Liberapay donate button" /></a></span>
<span class="badge-buymeacoffee"><a href="https://buymeacoffee.com/balupton" title="Donate to this project using Buy Me A Coffee"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg" alt="Buy Me A Coffee donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-crypto"><a href="https://bevry.me/crypto" title="Donate to this project using Cryptocurrency"><img src="https://img.shields.io/badge/crypto-donate-yellow.svg" alt="crypto donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>

<h3>Contributors</h3>

These amazing people have contributed code to this project:

<ul><li><a href="https://github.com/attilaolah">Attila Oláh</a> — <a href="https://github.com/bevry/cson/commits?author=attilaolah" title="View the GitHub contributions of Attila Oláh on repository bevry/cson">view contributions</a></li>
<li><a href="http://attilaolah.eu/">Attila Oláh</a></li>
<li><a href="https://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/bevry/cson/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/clyfe">Claudius Nicolae</a> — <a href="https://github.com/bevry/cson/commits?author=clyfe" title="View the GitHub contributions of Claudius Nicolae on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/jasonkarns">Jason Karns</a> — <a href="https://github.com/bevry/cson/commits?author=jasonkarns" title="View the GitHub contributions of Jason Karns on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/jperras">Joël Perras</a> — <a href="https://github.com/bevry/cson/commits?author=jperras" title="View the GitHub contributions of Joël Perras on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/linus">Linus G Thiel</a> — <a href="https://github.com/bevry/cson/commits?author=linus" title="View the GitHub contributions of Linus G Thiel on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/RobLoach">Rob Loach</a> — <a href="https://github.com/bevry/cson/commits?author=RobLoach" title="View the GitHub contributions of Rob Loach on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/meltingice">Ryan LeFevre</a> — <a href="https://github.com/bevry/cson/commits?author=meltingice" title="View the GitHub contributions of Ryan LeFevre on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/nanuclickity">Tushar Kant</a> — <a href="https://github.com/bevry/cson/commits?author=nanuclickity" title="View the GitHub contributions of Tushar Kant on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/zhangcheng">ZHANG Cheng</a> — <a href="https://github.com/bevry/cson/commits?author=zhangcheng" title="View the GitHub contributions of ZHANG Cheng on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/Zearin">Zearin</a> — <a href="https://github.com/bevry/cson/commits?author=Zearin" title="View the GitHub contributions of Zearin on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/evinugur">evinugur</a> — <a href="https://github.com/bevry/cson/commits?author=evinugur" title="View the GitHub contributions of evinugur on repository bevry/cson">view contributions</a></li></ul>

<a href="https://github.com/bevry/cson/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /BACKERS -->


<!-- LICENSE/ -->

<h2>License</h2>

Unless stated otherwise all works are:

<ul><li>Copyright &copy; 2012+ <a href="http://bevry.me">Bevry Pty Ltd</a></li>
<li>Copyright &copy; <a href="https://balupton.com">Benjamin Lupton</a></li></ul>

and licensed under:

<ul><li><a href="http://spdx.org/licenses/Artistic-2.0.html">Artistic License 2.0</a></li></ul>

<!-- /LICENSE -->
