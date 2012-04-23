# Requires
assert = require('assert')
fs = require('fs')
CSON = require(__dirname+'/../lib/cson.coffee')
srcCsonPath = __dirname+'/src/src.cson'
expectedJsonPath = __dirname+'/src/expected.json'
expectedCsonPath = __dirname+'/src/expected.cson'


# =====================================
# Tests

# Test async
describe 'async', ->
	it 'works as expected', (done) ->
		# Read expectations
		expectedJsonStr = fs.readFileSync(expectedJsonPath).toString()
		expectedCsonStr = fs.readFileSync(expectedCsonPath).toString()

		# Parse CSON File
		CSON.parseFile srcCsonPath, (err,obj) ->
			# No Error
			throw err  if err

			# CSON -> JSON matches 
			actualJsonStr = JSON.stringify(obj)
			assert.deepEqual(actualJsonStr,expectedJsonStr)

			# Stringify CSON
			CSON.stringify obj, (err,actualCsonStr) ->
				# No Error
				throw err  if err
				
				# Matches
				assert.equal(actualCsonStr, expectedCsonStr)
				
				# Tests are done
				done()

