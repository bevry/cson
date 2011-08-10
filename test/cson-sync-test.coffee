# Requires
assert = require 'assert'
CSON = require __dirname+'/../lib/cson.coffee'
fs = require 'fs'
srcFile = __dirname+'/src/src.cson'
outFile = __dirname+'/src/out.json'

# Tests
tests =

	parsing: ->

		# Read expectations
		objExpected = JSON.parse fs.readFileSync(outFile).toString()
		strExpected = JSON.stringify objExpected

		# Test parseFileSync
		obj = CSON.parseFileSync srcFile
		assert.deepEqual(obj, objExpected, 'parsing: parseFile: result matched expected')

		# Test Stringify
		str = CSON.stringifySync obj
		assert.equal(str, strExpected, 'parsing: stringify: result matched expected')


module.exports = tests