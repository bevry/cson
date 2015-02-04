# Requires
joe = require('joe')
{expect} = require('chai')
fsUtil = require('fs')
CSON = require('../../')

# Configuraiton
srcDirectoryPath = __dirname+'/../../test/src'
outDirectoryPath = __dirname+'/../../test/out-expected'
testExtensions = [
	# 1
	# Test simple example
	# to make sure the output is readable
	'cson'

	# 2
	# Test multiline string
	# to make sure the output is readable
	'cson'

	# 3
	# Test standard array
	# to make sure the output is readable
	'cson'

	# 4
	# Test JSON
	# to make sure our JSON parsing works correctly
	'json'

	# 5
	# Test CoffeeScript
	# to make sure requiring a coffeescript file includes the correct globals
	# and renders correctly
	'coffee'

	# 6
	# Test JavaScript
	# same reasoning as test 5
	'js'

	# 7
	# Test CoffeeScript
	# to make sure that sandboxing is working correctly
	'coffee'

	# 8
	# Test CSON
	# to make sure that an empty object is actually outputted
	'cson'
]

# Helpers
compare = (received,expected) ->
	received = received.replace(/\n\t\n/g, '\n\n')
	if received isnt expected
		console.log('\nreceived:\n'+received)
		console.log('\nexpected:\n'+expected)
		console.log('\n', {received, expected})
	expect(received).to.equal(expected)


# =====================================
# Tests

joe.describe 'sync', (describe,it) ->
	# Prepare
	createTest = (testExtension,i) ->
		# Prepare
		index = i+1
		srcFilename = index+'.'+testExtension
		srcPath = srcDirectoryPath+'/'+srcFilename
		expectedJsonPath = outDirectoryPath+'/'+index+'.json'
		expectedCsonPath = outDirectoryPath+'/'+index+'.cson'
		obj = null
		requiredObj = null
		actualJsonStr = null
		actualCsonStr = null
		expectedJsonStr = null
		expectedCsonStr = null

		# Test
		describe srcFilename, (describe,it) ->
			it "parse source file", (done) ->
				format = CSON.getFormat(srcPath)

				if index is 7
					obj = CSON.parseCSFile(srcPath)

				else if format in ['javascript', 'coffeescript']
					obj = CSON.requireFile(srcPath)
					expect(obj.message).to.contain('disabled')
					obj = CSON.requireFile(srcPath, {javascript:true, coffeescript:true})
				else
					obj = CSON.requireFile(srcPath)

				if obj instanceof Error
					return done(obj)
				else
					return done()

			it "grab conversions", (done) ->
				actualJsonStr = JSON.stringify(obj, null, '  ')
				actualCsonStr = CSON.stringify(obj, null, '\t')

				if actualCsonStr instanceof Error
					return done(actualCsonStr)
				else
					return done()

			it "read expectations", ->
				expectedJsonStr = fsUtil.readFileSync(expectedJsonPath).toString()
				expectedCsonStr = fsUtil.readFileSync(expectedCsonPath).toString()

			it "compare json", ->
				compare(actualJsonStr, expectedJsonStr)
			it "compare cson", ->
				compare(actualCsonStr, expectedCsonStr)

	# Create Tests
	for testExtension,i in testExtensions
		createTest(testExtension,i)
