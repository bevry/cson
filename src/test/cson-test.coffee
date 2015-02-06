# Requires
joe = require('joe')
{expect} = require('chai')
fsUtil = require('fs')
pathUtil = require('path')
safeps = require('safeps')
rootPath = pathUtil.resolve(__dirname+'/../..')
CSON = require(rootPath)

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

joe.describe 'cson', (describe,it) ->
	describe 'api', (describe, it) ->
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

	describe 'cli', (describe, it) ->
		cliTests = [
				name: 'json2cson'
				bin: rootPath+'/bin/json2cson'
				source: rootPath+'/test/out-expected/1.json'
				expected: fsUtil.readFileSync(rootPath+'/test/out-expected/1.cson', 'utf8')
			,
				name: 'cson2json'
				bin: rootPath+'/bin/cson2json'
				source: rootPath+'/test/out-expected/1.cson'
				expected: fsUtil.readFileSync(rootPath+'/test/out-expected/1.json', 'utf8')
		]

		cliTests.forEach (cliTest) ->

			describe cliTest.name, (describe, it) ->
				it 'args', (done) ->
					safeps.spawn ['node', cliTest.bin, cliTest.source], (err,stdout,stderr,code) ->
						expect(err).to.equal(null)
						expect(stdout).to.equal(cliTest.expected)
						expect(stderr).to.be.empty
						expect(code).to.equal(0)
						done()

				it 'stdin', (done) ->
					safeps.exec ["cat #{cliTest.source} | #{cliTest.bin}"], (err,stdout,stderr) ->
						expect(err).to.equal(null)
						expect(stdout).to.equal(cliTest.expected)
						expect(stderr).to.be.empty
						done()

		describe 'json2cson options', (describe,it) ->
			cliTest = cliTests[0]
			sourceData = JSON.parse fsUtil.readFileSync(cliTests[0].source, 'utf8')

			it '--tabs', (done) ->
				safeps.spawn ['node', cliTest.bin, cliTest.source, '--tabs'], (err,stdout,stderr,code) ->
					expected = CSON.createCSONString(sourceData, {indent:'\t'})
					expect(err).to.equal(null)
					expect(stdout).to.equal(expected)
					expect(stderr).to.be.empty
					expect(code).to.equal(0)
					done()

			it '--2spaces', (done) ->
				safeps.spawn ['node', cliTest.bin, cliTest.source, '--2spaces'], (err,stdout,stderr,code) ->
					expected = CSON.createCSONString(sourceData, {indent:'  '})
					expect(err).to.equal(null)
					expect(stdout).to.equal(expected)
					expect(stderr).to.be.empty
					expect(code).to.equal(0)
					done()

			it '--4spaces', (done) ->
				safeps.spawn ['node', cliTest.bin, cliTest.source, '--4spaces'], (err,stdout,stderr,code) ->
					expected = CSON.createCSONString(sourceData, {indent:'    '})
					expect(err).to.equal(null)
					expect(stdout).to.equal(expected)
					expect(stderr).to.be.empty
					expect(code).to.equal(0)
					done()
