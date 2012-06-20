# Requires
fs = require('fs')
path = require('path')
CSON = require(path.join __dirname, '..', 'lib', 'cson')
argv = process.argv

# Check arguments
unless argv.length is 3
	console.log('usage: json2cson filePath')
	process.exit(1)

# Extract
filePath = argv[2]

# Convert
result = CSON.stringifySync CSON.parseFileSync(filePath)
console.log(result)

# Done