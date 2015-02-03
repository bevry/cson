# Requires
joe = require('joe')
{expect} = require('chai')
fsUtil = require('fs')
CSON = require('../../')
srcDirectoryPath = __dirname+'/../../test/src'
outDirectoryPath = __dirname+'/../../test/out-expected'
compare = (actual,expected) ->
	if actual isnt expected
		console.log('\nactual:\n'+actual)
		console.log('\expected:\n'+expected)
	expect(actual).to.equal(expected)


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
				if format in ['javascript', 'coffeescript']
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
	testExtensions = ['cson','cson','cson','json','coffee','js','cson','cson']
	for testExtension,i in testExtensions
		createTest(testExtension,i)
