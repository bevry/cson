# Requires
assert = require('assert')
fs = require('fs')
CSON = require(__dirname+'/../lib/cson.coffee')
srcCsonPath = __dirname+'/src/src.cson'
expectedJsonPath = __dirname+'/src/expected.json'
expectedCsonPath = __dirname+'/src/expected.cson'


# =====================================
# Tests

# Test sync
describe 'sync', ->
	it 'works as expected', (done) ->
		# Read expectations
		expectedJsonStr = fs.readFileSync(expectedJsonPath).toString()
		expectedCsonStr = fs.readFileSync(expectedCsonPath).toString()

		# Parse CSON File
		obj = CSON.parseFileSync(srcCsonPath)

		# CSON -> JSON matches 
		actualJsonStr = JSON.stringify(obj)
		assert.deepEqual(actualJsonStr,expectedJsonStr)

		# Stringify CSON
		actualCsonStr = CSON.stringifySync(obj)
		assert.equal(actualCsonStr, expectedCsonStr)

		# Tests done
		done()