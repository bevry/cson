# Requires
assert = require 'assert'
CSON = require __dirname+'/../lib/cson.coffee'
fs = require 'fs'
srcFile = __dirname+'/src/src.cson'
outFile = __dirname+'/src/out.json'

# Tests
tests =

	parsing: (beforeExit) ->
		# Prepare
		nTests = 2
		nTestsCompleted = 0

		# Read in expectation
		fs.readFile outFile, (err,data) ->
			# Error
			if err then throw err

			# Parse & Store
			try
				objExpected = JSON.parse data.toString()
			catch err
				throw err

			# Store
			strExpected = JSON.stringify objExpected

			# Test parseFile
			CSON.parseFile srcFile, (err,obj) ->
				# No Error
				assert.equal(err||false,false, 'parsing: parseFile: no error')
				if err then return

				# Matches
				assert.deepEqual(obj,objExpected, 'parsing: parseFile: result matched expected')

				# Test Completed
				++nTestsCompleted
				
				# Stringify
				CSON.stringify obj, (err,str) ->
					# No Error
					assert.equal(err||false,false, 'parsing: stringify: no error')
					if err then return
					
					# Matches
					assert.equal(str,strExpected, 'parsing: stringify: result matched expected')

					# Test Completed
					++nTestsCompleted

		# Async
		beforeExit ->
			assert.equal(nTests, nTestsCompleted, 'parsing: all tests ran')

# Export
module.exports = tests