# Requires
assert = require('assert')
fs = require('fs')
balUtil = require('bal-util')
CSON = require(__dirname+'/../lib/cson')
srcPath = __dirname+'/src'
outPath = __dirname+'/out'


# =====================================
# Tests

# Test async
describe 'async', ->
	it 'works as expected', (done) ->
		# Group
		tasks = new balUtil.Group (err) ->
			throw err  if err
			done()

		# Create Tests
		for i in [1...3]
			tasks.push (complete) ->
				# Prepare
				srcCsonPath = srcPath+'/'+i+'.cson'
				expectedJsonPath = outPath+'/'+i+'.json'
				expectedCsonPath = outPath+'/'+i+'.cson'

				# Parse source CSON file
				CSON.parseFile srcCsonPath, (err,obj) ->
					throw err  if err

					# Grab conversations
					actualJsonStr = JSON.stringify(obj)
					CSON.stringify obj, (err,actualCsonStr) ->
						throw err  if err

						# Read expectations
						expectedJsonStr = fs.readFileSync(expectedJsonPath).toString()
						expectedCsonStr = fs.readFileSync(expectedCsonPath).toString()

						# Perform Comparisons
						assert.deepEqual(actualJsonStr,expectedJsonStr)
						assert.equal(actualCsonStr, expectedCsonStr)

						# Test compelte
						complete()

		# Run Tests
		tasks.sync()
