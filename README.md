<!-- TITLE/ -->

<h1>CSON</h1>

<!-- /TITLE -->


<!-- BADGES/ -->

<span class="badge-travisci"><a href="http://travis-ci.org/bevry/cson" title="Check this project's build status on TravisCI"><img src="https://img.shields.io/travis/bevry/cson/master.svg" alt="Travis CI Build Status" /></a></span>
<span class="badge-npmversion"><a href="https://npmjs.org/package/cson" title="View this project on NPM"><img src="https://img.shields.io/npm/v/cson.svg" alt="NPM version" /></a></span>
<span class="badge-npmdownloads"><a href="https://npmjs.org/package/cson" title="View this project on NPM"><img src="https://img.shields.io/npm/dm/cson.svg" alt="NPM downloads" /></a></span>
<span class="badge-daviddm"><a href="https://david-dm.org/bevry/cson" title="View the status of this project's dependencies on DavidDM"><img src="https://img.shields.io/david/bevry/cson.svg" alt="Dependency Status" /></a></span>
<span class="badge-daviddmdev"><a href="https://david-dm.org/bevry/cson#info=devDependencies" title="View the status of this project's development dependencies on DavidDM"><img src="https://img.shields.io/david/dev/bevry/cson.svg" alt="Dev Dependency Status" /></a></span>
<br class="badge-separator" />
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-gratipay"><a href="https://www.gratipay.com/bevry" title="Donate weekly to this project using Gratipay"><img src="https://img.shields.io/badge/gratipay-donate-yellow.svg" alt="Gratipay donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-bitcoin"><a href="https://bevry.me/bitcoin" title="Donate once-off to this project using Bitcoin"><img src="https://img.shields.io/badge/bitcoin-donate-yellow.svg" alt="Bitcoin donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>
<br class="badge-separator" />
<span class="badge-slackin"><a href="https://slack.bevry.me" title="Join this project's slack community"><img src="https://slack.bevry.me/badge.svg" alt="Slack community badge" /></a></span>

<!-- /BADGES -->


CoffeeScript-Object-Notation. Same as JSON but for CoffeeScript objects.

[Projects using CSON.](https://www.npmjs.org/browse/depended/cson)

[Projects using CSON Parser directly.](https://www.npmjs.org/browse/depended/cson-parser)

Since v2, this CSON package is a higher-level wrapper around the lower-level [CSON Parser](https://www.npmjs.com/package/cson-parser).


<!-- INSTALL/ -->

<h2>Install</h2>

<a href="https://npmjs.com" title="npm is a package manager for javascript"><h3>NPM</h3></a><ul>
<li>Install: <code>npm install --save cson</code></li>
<li>Executables: <code>cson2json</code>, <code>json2cson</code></li>
<li>Module: <code>require('cson')</code></li></ul>

<h3><a href="https://github.com/bevry/editions" title="Editions are the best way to produce and consume packages you care about.">Editions</a></h3>

<p>This package is published with the following editions:</p>

<ul><li><code>cson/source/index.js</code> is Source + CoffeeScript + <a href="https://nodejs.org/dist/latest-v5.x/docs/api/modules.html" title="Node/CJS Modules">Require</a></li>
<li><code>cson</code> aliases <code>cson/es5/index.js</code></li>
<li><code>cson/es5/index.js</code> is CoffeeScript Compiled + ES5 + <a href="https://nodejs.org/dist/latest-v5.x/docs/api/modules.html" title="Node/CJS Modules">Require</a></li></ul>

<!-- /INSTALL -->


## What is CSON?

Everyone knows JSON, it's the thing that looks like this:

``` javascript
{
  "cities": [
    "novosibirsk",
    "chelyabinsk",
    "tomsk"
  ],
  "historyExcerpts": {
    "novosibirsk": "Novosibirsk, founded in 1893, first received the name Novonikolayevsk.\n\nDuring Stalin's industrialization, Novosibirsk secured its place as one of the largest industrial centers of Siberia.\n\nRapid growth and industrialization were the reasons behind Novosibirsk's nickname: the \"Chicago of Siberia\".\n\nSource: https://en.wikipedia.org/wiki/Novosibirsk",
    "chelyabinsk": "In 1896 the city was linked to Ekaterinburg. Chelyabinsk became the hub for relocation to Siberia.\nFor fifteen years more than fifteen million people passed through.\n\nDuring World War II, it produced 18,000 tanks, as well as over 17 million units of ammunition.\n\nIn the press of the time, Chelyabinsk was informally called \"Tankograd\" or \"Tank City\".\n\nSource: https://en.wikipedia.org/wiki/Chelyabinsk",
    "tomsk": "Like many Siberian cities, Tomsk became the new home for many factories relocated out of the war.\nThe resulting growth of the city led the Soviet government to establish the new Tomsk Oblast.\n\nDuring the Cold War Tomsk became one of many designated closed cities, which outsiders could not visit.\nMatters went a stage further with the establishment of a secret city, known as \"Tomsk-7\" 15 kilometres north-west of Tomsk.\nThe new settlement became the home of the Tomsk Nuclear Plant.\n\nSource: https://en.wikipedia.org/wiki/Tomsk"
  }
}
```

Now let's write the same thing in CSON:

``` coffeescript
# Comments!!!

# An Array with no commas!
cities: [
	'novosibirsk'
	'chelyabinsk'
	'tomsk'
]

# An Object without braces!
historyExcerpts:
	# Multi-Line Strings! Without Quote Escaping!
	novosibirsk: '''
		Novosibirsk, founded in 1893, first received the name Novonikolayevsk.

    During Stalin's industrialization, Novosibirsk secured its place as one of the largest industrial centers of Siberia.

    Rapid growth and industrialization were the reasons behind Novosibirsk's nickname: the "Chicago of Siberia".

    Source: https://en.wikipedia.org/wiki/Novosibirsk
		'''

	chelyabinsk: '''
		In 1896 the city was linked to Ekaterinburg. Chelyabinsk became the hub for relocation to Siberia.
    For fifteen years more than fifteen million people passed through.

    During World War II, it produced 18,000 tanks, as well as over 17 million units of ammunition.

    In the press of the time, Chelyabinsk was informally called "Tankograd" or "Tank City".

    Source: https://en.wikipedia.org/wiki/Chelyabinsk
		'''

	tomsk: '''
		Like many Siberian cities, Tomsk became the new home for many factories relocated out of the war.
    The resulting growth of the city led the Soviet government to establish the new Tomsk Oblast.

    During the Cold War Tomsk became one of many designated closed cities, which outsiders could not visit.
    Matters went a stage further with the establishment of a secret city, known as "Tomsk-7" 15 kilometres north-west of Tomsk.
    The new settlement became the home of the Tomsk Nuclear Plant.

    Source: https://en.wikipedia.org/wiki/Tomsk
		'''
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

<ul><li><a href="http://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/bevry/cson/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository bevry/cson">view contributions</a></li></ul>

<h3>Sponsors</h3>

No sponsors yet! Will you be the first?

<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-gratipay"><a href="https://www.gratipay.com/bevry" title="Donate weekly to this project using Gratipay"><img src="https://img.shields.io/badge/gratipay-donate-yellow.svg" alt="Gratipay donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-bitcoin"><a href="https://bevry.me/bitcoin" title="Donate once-off to this project using Bitcoin"><img src="https://img.shields.io/badge/bitcoin-donate-yellow.svg" alt="Bitcoin donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>

<h3>Contributors</h3>

These amazing people have contributed code to this project:

<ul><li><a href="http://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/bevry/cson/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository bevry/cson">view contributions</a></li>
<li><a href="http://attilaolah.eu/">Attila Oláh</a> — <a href="https://github.com/bevry/cson/commits?author=attilaolah" title="View the GitHub contributions of Attila Oláh on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/evinugur">evinugur</a> — <a href="https://github.com/bevry/cson/commits?author=evinugur" title="View the GitHub contributions of evinugur on repository bevry/cson">view contributions</a></li>
<li><a href="http://jasonkarns.com">Jason Karns</a> — <a href="https://github.com/bevry/cson/commits?author=jasonkarns" title="View the GitHub contributions of Jason Karns on repository bevry/cson">view contributions</a></li>
<li><a href="http://nerderati.com">Joël Perras</a> — <a href="https://github.com/bevry/cson/commits?author=jperras" title="View the GitHub contributions of Joël Perras on repository bevry/cson">view contributions</a></li>
<li><a href="http://yesbabyyes.se/">Linus Gustav Larsson Thiel</a> — <a href="https://github.com/bevry/cson/commits?author=linus" title="View the GitHub contributions of Linus Gustav Larsson Thiel on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/nanuclickity">Tushar Kant</a> — <a href="https://github.com/bevry/cson/commits?author=nanuclickity" title="View the GitHub contributions of Tushar Kant on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/clyfe">Claudius Nicolae</a> — <a href="https://github.com/bevry/cson/commits?author=clyfe" title="View the GitHub contributions of Claudius Nicolae on repository bevry/cson">view contributions</a></li>
<li><a href="http://robloach.net">Rob Loach</a> — <a href="https://github.com/bevry/cson/commits?author=RobLoach" title="View the GitHub contributions of Rob Loach on repository bevry/cson">view contributions</a></li>
<li><a href="http://meltingice.net">Ryan LeFevre</a> — <a href="https://github.com/bevry/cson/commits?author=meltingice" title="View the GitHub contributions of Ryan LeFevre on repository bevry/cson">view contributions</a></li>
<li><a href="https://github.com/Zearin">Zearin</a> — <a href="https://github.com/bevry/cson/commits?author=Zearin" title="View the GitHub contributions of Zearin on repository bevry/cson">view contributions</a></li>
<li><a href="http://about.me/zhangcheng77">ZHANG Cheng</a> — <a href="https://github.com/bevry/cson/commits?author=zhangcheng" title="View the GitHub contributions of ZHANG Cheng on repository bevry/cson">view contributions</a></li></ul>

<a href="https://github.com/bevry/cson/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /BACKERS -->


<!-- LICENSE/ -->

<h2>License</h2>

Unless stated otherwise all works are:

<ul><li>Copyright &copy; 2012+ <a href="http://bevry.me">Bevry Pty Ltd</a></li>
<li>Copyright &copy; <a href="http://balupton.com">Benjamin Lupton</a></li></ul>

and licensed under:

<ul><li><a href="http://spdx.org/licenses/MIT.html">MIT License</a></li></ul>

<!-- /LICENSE -->
