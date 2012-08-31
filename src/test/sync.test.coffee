# Requires
joe = require('joe')
assert = require('assert')
fsUtil = require('fs')
CSON = require(__dirname+'/../lib/cson')
srcPath = __dirname+'/../../test/src'
outPath = __dirname+'/../../test/out-expected'


# =====================================
# Tests

joe.describe 'sync', (describe,it) ->
	# Prepare
	createTest = (testExtension,i) ->
		# Prepare
		index = i+1
		srcFilename = index+'.'+testExtension
		srcCsonPath = srcPath+'/'+srcFilename
		expectedJsonPath = outPath+'/'+index+'.json'
		expectedCsonPath = outPath+'/'+index+'.cson'
		obj = null
		requiredObj = null
		actualJsonStr = null
		actualCsonStr = null
		expectedJsonStr = null
		expectedCsonStr = null

		# Test
		describe srcFilename, (describe,it) ->
			it "parse source file", (done) ->
				obj = CSON.parseFileSync(srcCsonPath)
				return done(obj)  if obj instanceof Error
				done()

			it "require source file", (done) ->
				requiredObj = require(srcCsonPath)
				return done(requiredObj)  if requiredObj instanceof Error
				done()

			it "compare parse and require", ->
				assert.deepEqual(obj,requiredObj)

			it "grab conversions", (done) ->
				actualJsonStr = JSON.stringify(obj)
				actualCsonStr = CSON.stringifySync(obj)
				return done(actualCsonStr)  if actualCsonStr instanceof Error
				done()

			it "read expectations", ->
				expectedJsonStr = fsUtil.readFileSync(expectedJsonPath).toString()
				expectedCsonStr = fsUtil.readFileSync(expectedCsonPath).toString()

			it "compare json", ->
				assert.deepEqual(actualJsonStr,expectedJsonStr)
			it "compare cson", ->
				assert.equal(actualCsonStr, expectedCsonStr)

	# Create Tests
	testExtensions = ['cson','cson','cson','json','coffee','js','cson']
	for testExtension,i in testExtensions
		createTest(testExtension,i)
