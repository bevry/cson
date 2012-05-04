# Requires
assert = require('assert')
fs = require('fs')
balUtil = require('bal-util')
CSON = require(__dirname+'/../lib/cson')
srcPath = __dirname+'/src'
outPath = __dirname+'/out'


# =====================================
# Tests

# Test sync
describe 'sync', ->
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
				obj = CSON.parseFileSync(srcCsonPath)
				throw obj  if obj instanceof Error

				# Grab conversations
				actualJsonStr = JSON.stringify(obj)
				actualCsonStr = CSON.stringifySync(obj)
				throw actualCsonStr  if actualCsonStr instanceof Error

				# Read expectations
				expectedJsonStr = fs.readFileSync(expectedJsonPath).toString()
				expectedCsonStr = fs.readFileSync(expectedCsonPath).toString()

				# Perform Comparisons
				assert.deepEqual(actualJsonStr,expectedJsonStr)
				assert.equal(actualCsonStr, expectedCsonStr)

				# Test complete
				complete()

		# Run Tests
		tasks.sync()