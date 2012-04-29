# Requires
assert = require('assert')
fs = require('fs')
CSON = require(__dirname+'/../lib/cson.coffee')
srcCsonPath = __dirname+'/src/currupt.cson'


# =====================================
# Tests

# Test sync
describe 'corrupt cson', ->
	it 'shall not corrupt the system', (done) ->
		# Read expectations

		# Parse CSON File
		obj = CSON.parseFileSync(srcCsonPath)
		assert.ok(obj instanceof Error)

		# Tests done
		done()