# CSON

CoffeeScript-Object-Notation Parser. Same as JSON but for CoffeeScript objects.


## Installing


1. [Install Node.js](https://github.com/balupton/node/wiki/Installing-Node.js)

2. Install CSON

		npm install cson


## Using

- With Node.js in JavaScript

	``` javascript
	// Include CSON
	require('coffee-script');
	CSON = require('cson');

	// Parse a file
	CSON.parseFile('data.cson', function(err,obj){});

	// Parse a string
	CSON.parse(dataStr, function(err,obj){});

	// Stringify an object
	CSON.stringify(data, function(err,str){});
	```

- With Node.js in CoffeeScript
	
	``` coffeescript
	# Include CSON
	CSON = require 'cson'

	# Parse a file
	CSON.parseFile 'data.cson', (err,obj) ->

	# Parse a string
	CSON.parse dataStr, (err,obj) ->

	# Stringify an object
	CSON.stringify data, (err,str) ->


## Learning

[To learn more about CSON visit its wiki here](https://github.com/balupton/cson.npm/wiki)


## History

- v0.1 June 2, 2011
	- Initial commit


## License

Licensed under the [MIT License](http://creativecommons.org/licenses/MIT/)
Copyright 2011 [Benjamin Arthur Lupton](http://balupton.com)
