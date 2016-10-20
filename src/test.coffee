# Requires
joe = require('joe')
fsUtil = require('fs')
{resolve, join} = require('path')
safeps = require('safeps')
{equal, deepEqual, errorEqual, contains} = require('assert-helpers')
CSON = require('../')

# Configuraiton
rootPath = resolve(__dirname, '..')
binDirectoryPath = join(rootPath, 'bin')
testFixturesPath = join(rootPath, 'test-fixtures')
apiDirectoryPath = join(testFixturesPath, 'api')
srcDirectoryPath = join(testFixturesPath, 'src')
outDirectoryPath = join(testFixturesPath, 'out-expected')
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


# =====================================
# Tests

joe.suite 'cson', (suite,test) ->
	suite 'api', (suite, test) ->
		suite 'CSON', (suite, test) ->
			data = a:b:1
			strTabs = 'a:\n\tb: 1'
			strSpaces = 'a:\n  b: 1'

			test 'stringify', ->
				csonString = CSON.stringify(data)
				equal(csonString, strTabs)

			test 'stringify spaces', ->
				csonString = CSON.stringify(data, null, '  ')
				equal(csonString, strSpaces)

			test 'createCSONString', ->
				csonString = CSON.createCSONString(data)
				equal(csonString, strTabs)

			test 'createCSONString spaces', ->
				csonString = CSON.createCSONString(data, {indent:'  '})
				equal(csonString, strSpaces)

			test 'createCSONString callback', ->
				CSON.createCSONString data, (err, csonString) ->
					errorEqual(err, null)
					equal(csonString, strTabs)

			test 'createCSONString spaces callback', ->
				CSON.createCSONString data, {indent:'  '}, (err, csonString) ->
					errorEqual(err, null)
					equal(csonString, strSpaces)

			test 'parse', ->
				csonData = CSON.parse(strTabs)
				deepEqual(csonData, data)

			test 'parseCSONString', ->
				csonData = CSON.parseCSONString(strTabs)
				deepEqual(csonData, data)

			test 'parseCSONString callback', ->
				CSON.parseCSONString strTabs, (err, csonData) ->
					errorEqual(err, null)
					deepEqual(csonData, data)

			test 'load', ->
				csonData = CSON.load(apiDirectoryPath+'/cson-parse.cson')
				deepEqual(csonData, data)

			test 'load callback', ->
				CSON.load apiDirectoryPath+'/cson-parse.cson', (err, csonData) ->
					errorEqual(err, null)
					deepEqual(csonData, data)

			test 'parseCSONFile', ->
				csonData = CSON.parseCSONFile(apiDirectoryPath+'/cson-parse.cson')
				deepEqual(csonData, data)

			test 'parseCSONFile callback', ->
				CSON.parseCSONFile apiDirectoryPath+'/cson-parse.cson', (err, csonData) ->
					errorEqual(err, null)
					deepEqual(csonData, data)

			test 'requireCSONFile', ->
				csonData = CSON.requireCSONFile(apiDirectoryPath+'/cson-parse.cson')
				deepEqual(csonData, data)

			test 'requireCSONFile callback', ->
				CSON.requireCSONFile apiDirectoryPath+'/cson-parse.cson', (err, csonData) ->
					errorEqual(err, null)
					deepEqual(csonData, data)

		suite 'JSON', (suite, test) ->
			data = a:b:1
			strSpaces = '{\n  "a": {\n    "b": 1\n  }\n}'
			strTabs = '{\n\t"a": {\n\t\t"b": 1\n\t}\n}'

			test 'createJSONString', ->
				jsonString = CSON.createJSONString(data)
				equal(jsonString, strSpaces)

			test 'createJSONString tabs', ->
				jsonString = CSON.createJSONString(data, {indent:'\t'})
				equal(jsonString, strTabs)

			test 'createJSONString callback', ->
				CSON.createJSONString data, (err,jsonString) ->
					errorEqual(err, null)
					equal(jsonString, strSpaces)

			test 'createJSONString callback tabs', ->
				CSON.createJSONString data, {indent:'\t'}, (err, jsonString) ->
					errorEqual(err, null)
					equal(jsonString, strTabs)

			test 'parseJSONString', ->
				jsonData = CSON.parseJSONString(strSpaces)
				deepEqual(jsonData, data)

			test 'parseJSONString callback', ->
				CSON.parseJSONString strSpaces, (err, jsonData) ->
					errorEqual(err, null)
					deepEqual(jsonData, data)

			test 'parseJSONFile', ->
				jsonData = CSON.parseJSONFile(apiDirectoryPath+'/json-parse.json')
				deepEqual(jsonData, data)

			test 'parseJSONFile callback', ->
				CSON.parseJSONFile apiDirectoryPath+'/json-parse.json', (err, jsonData) ->
					errorEqual(err, null)
					deepEqual(jsonData, data)

			test 'requireJSONFile', ->
				jsonData = CSON.requireJSONFile(apiDirectoryPath+'/json-parse.json')
				deepEqual(jsonData, data)

			test 'requireJSONFile callback', ->
				CSON.requireJSONFile apiDirectoryPath+'/json-parse.json', (err, jsonData) ->
					errorEqual(err, null)
					deepEqual(jsonData, data)


		suite 'JS', (suite, test) ->
			data = 25
			str = '5*5'

			test 'parseJSString', ->
				jsData = CSON.parseJSString(str)
				equal(jsData, data)

			test 'parseJSString callback', ->
				CSON.parseJSString str, (err, jsData) ->
					errorEqual(err, null)
					equal(jsData, data)

			test 'parseJSFile', ->
				jsData = CSON.parseJSFile(apiDirectoryPath+'/js-parse.js')
				equal(jsData, data)

			test 'parseJSFile callback', ->
				CSON.parseJSFile apiDirectoryPath+'/js-parse.js', (err, jsData) ->
					errorEqual(err, null)
					equal(jsData, data)

			test 'requireJSFile', ->
				jsData = CSON.requireJSFile(apiDirectoryPath+'/js-require.js')
				equal(jsData, data)

			test 'requireJSFile callback', ->
				CSON.requireJSFile apiDirectoryPath+'/js-require.js', (err, jsData) ->
					errorEqual(err, null)
					equal(jsData, data)

		suite 'CS', (suite, test) ->
			data = 25
			str = '"#{5}"*5'

			test 'parseCSString', ->
				csData = CSON.parseCSString(str)
				equal(csData, data)

			test 'parseCSString callback', ->
				CSON.parseCSString str, (err, csData) ->
					errorEqual(err, null)
					equal(csData, data)

			test 'parseCSFile', ->
				csData = CSON.parseCSFile(apiDirectoryPath+'/cs-parse.coffee')
				equal(csData, data)

			test 'parseCSFile callback', ->
				CSON.parseCSFile apiDirectoryPath+'/cs-parse.coffee', (err, csData) ->
					errorEqual(err, null)
					equal(csData, data)

			test 'requireCSFile', ->
				csData = CSON.requireCSFile(apiDirectoryPath+'/cs-require.coffee')
				equal(csData, data)

			test 'requireCSFile callback', ->
				CSON.requireCSFile apiDirectoryPath+'/cs-require.coffee', (err, jsData) ->
					errorEqual(err, null)
					equal(jsData, data)

		suite 'createString', (suite, test) ->
			data = a:b:1
			csonString = 'a:\n\tb: 1'
			jsonString = '{\n  "a": {\n    "b": 1\n  }\n}'

			test 'CSON', ->
				CSON.createString data, (err, result) ->
					errorEqual(err, null)
					equal(result, csonString)

			test 'JSON', ->
				CSON.createString data, {format:'json'}, (err, result) ->
					errorEqual(err, null)
					equal(result, jsonString)

			test 'JS', ->
				CSON.createString data, {format:'javascript'}, (err, result) ->
					errorEqual(err, 'disabled')

			test 'JS', ->
				CSON.createString data, {format:'javascript', javascript:true}, (err, result) ->
					errorEqual(err, 'not yet supported')

			test 'CS', ->
				CSON.createString data, {format:'coffeescript'}, (err, result) ->
					errorEqual(err, 'disabled')

			test 'CS', ->
				CSON.createString data, {format:'coffeescript', coffeescript:true}, (err, result) ->
					errorEqual(err, 'not yet supported')

		suite 'parseString', (suite, test) ->
			data = a:b:1
			number = 25
			csonString = 'a:\n\tb: 1'
			jsonString = '{\n  "a": {\n    "b": 1\n  }\n}'
			jsString = '5*5'
			csString = '"#{5}"*5'

			test 'CSON', ->
				CSON.parseString csonString, (err, result) ->
					errorEqual(err, null)
					deepEqual(result, data)

			test 'JSON', ->
				CSON.parseString jsonString, {format:'json'}, (err, result) ->
					errorEqual(err, null)
					deepEqual(result, data)

			test 'JS', ->
				CSON.parseString jsString, {format:'javascript'}, (err, result) ->
					errorEqual(err, 'disabled')

			test 'JS', ->
				CSON.parseString jsString, {format:'javascript', javascript:true}, (err, result) ->
					errorEqual(err, null)
					equal(result, number)

			test 'CS', ->
				CSON.parseString csString, {format:'coffeescript'}, (err, result) ->
					errorEqual(err, 'disabled')

			test 'CS', ->
				CSON.parseString csString, {format:'coffeescript', coffeescript:true}, (err, result) ->
					errorEqual(err, null)
					equal(result, number)

		suite 'parseFile', (suite, test) ->
			data = a:b:1
			number = 25

			test 'CSON', ->
				CSON.parseFile apiDirectoryPath+'/cson-parse.cson', (err, result) ->
					errorEqual(err, null)
					deepEqual(result, data)

			test 'JSON', ->
				CSON.parseFile apiDirectoryPath+'/json-parse.json', {format:'json'}, (err, result) ->
					errorEqual(err, null)
					deepEqual(result, data)

			test 'JS', ->
				CSON.parseFile apiDirectoryPath+'/js-parse.js', {format:'javascript'}, (err, result) ->
					errorEqual(err, 'disabled')

			test 'JS', ->
				CSON.parseFile apiDirectoryPath+'/js-parse.js', {format:'javascript', javascript:true}, (err, result) ->
					errorEqual(err, null)
					equal(result, number)

			test 'CS', ->
				CSON.parseFile apiDirectoryPath+'/cs-parse.coffee', {format:'coffeescript'}, (err, result) ->
					errorEqual(err, 'disabled')

			test 'CS', ->
				CSON.parseFile apiDirectoryPath+'/cs-parse.coffee', {format:'coffeescript', coffeescript:true}, (err, result) ->
					errorEqual(err, null)
					equal(result, number)

		suite 'requireFile', (suite, test) ->
			data = a:b:1
			number = 25

			test 'CSON', ->
				CSON.requireFile apiDirectoryPath+'/cson-parse.cson', (err, result) ->
					errorEqual(err, null)
					deepEqual(result, data)

			test 'JSON', ->
				CSON.requireFile apiDirectoryPath+'/json-parse.json', {format:'json'}, (err, result) ->
					errorEqual(err, null)
					deepEqual(result, data)

			test 'JS', ->
				CSON.requireFile apiDirectoryPath+'/js-require.js', {format:'javascript'}, (err, result) ->
					errorEqual(err, 'disabled')

			test 'JS', ->
				CSON.requireFile apiDirectoryPath+'/js-require.js', {format:'javascript', javascript:true}, (err, result) ->
					errorEqual(err, null)
					equal(result, number)

			test 'CS', ->
				CSON.requireFile apiDirectoryPath+'/cs-require.coffee', {format:'coffeescript'}, (err, result) ->
					errorEqual(err, 'disabled')

			test 'CS', ->
				CSON.requireFile apiDirectoryPath+'/cs-require.coffee', {format:'coffeescript', coffeescript:true}, (err, result) ->
					errorEqual(err, null)
					equal(result, number)

		###
		@TODO Write some tests for createString, parseString, parseFile, and requireFile
		To make sure the permissions and multiple format parsing works
		###


	suite 'fixtures', (suite, test) ->
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
			suite srcFilename, (suite,test) ->
				test "parse source file", (done) ->
					format = CSON.getFormat(srcPath)

					if index is 7
						obj = CSON.parseCSFile(srcPath, {sandbox: {}})

					else if format in ['javascript', 'coffeescript']
						obj = CSON.requireFile(srcPath)
						contains(obj.message, 'disabled')
						obj = CSON.requireFile(srcPath, {javascript:true, coffeescript:true})
					else
						obj = CSON.requireFile(srcPath)

					if obj instanceof Error
						return done(obj)
					else
						return done()

				test "grab conversions", (done) ->
					actualJsonStr = JSON.stringify(obj, null, '  ')
					actualCsonStr = CSON.stringify(obj, null, '\t')

					if actualCsonStr instanceof Error
						return done(actualCsonStr)
					else
						return done()

				test "read expectations", ->
					expectedJsonStr = fsUtil.readFileSync(expectedJsonPath).toString()
					expectedCsonStr = fsUtil.readFileSync(expectedCsonPath).toString()

				test "compare json", ->
					equal(actualJsonStr, expectedJsonStr)
				test "compare cson", ->
					equal(actualCsonStr, expectedCsonStr)

		# Create Tests
		for testExtension,i in testExtensions
			createTest(testExtension,i)

	suite 'cli', (suite, test) ->
		cliTests = [
				name: 'json2cson'
				bin: join(binDirectoryPath, 'json2cson')
				sourcePath: join(outDirectoryPath, '1.json')
				sourceData: fsUtil.readFileSync(join(outDirectoryPath, '1.json'), 'utf8')
				expectedData: fsUtil.readFileSync(join(outDirectoryPath, '1.cson'), 'utf8')
			,
				name: 'cson2json'
				bin: join(binDirectoryPath, 'cson2json')
				sourcePath: join(outDirectoryPath, '1.cson')
				sourceData: fsUtil.readFileSync(join(outDirectoryPath, '1.cson'), 'utf8')
				expectedData: fsUtil.readFileSync(join(outDirectoryPath, '1.json'), 'utf8')
		]

		cliTests.forEach (cliTest) ->
			suite cliTest.name, (suite, test) ->
				test 'args', (done) ->
					safeps.spawn ['node', cliTest.bin, cliTest.sourcePath], (err,stdout,stderr,code) ->
						equal(err, null, "error to be empty")
						equal(stdout.toString(), cliTest.expectedData, "stdout to be as expected")
						equal(stderr?.toString() or null, null, "stderr to be empty")
						equal(code, 0, "exit code to be 0")
						done()

				test 'stdin', (done) ->
					safeps.spawn ['node', cliTest.bin], {stdin:cliTest.sourceData}, (err,stdout,stderr,code) ->
						equal(err, null, "error to be empty")
						equal(stdout.toString(), cliTest.expectedData, "stdout to be as expected")
						equal(stderr?.toString() or null, null, "stderr to be empty")
						equal(code, 0, "exit code to be 0")
						done()

		suite 'json2cson options', (suite,test) ->
			cliTest = cliTests[0]
			sourceData = JSON.parse cliTest.sourceData

			test '--tabs', (done) ->
				safeps.spawn ['node', cliTest.bin, cliTest.sourcePath, '--tabs'], (err,stdout,stderr,code) ->
					expected = CSON.createCSONString(sourceData, {indent:'\t'})
					equal(err, null, "error to be empty")
					equal(stdout.toString(), expected, "stdout to be as expected")
					equal(stderr?.toString() or null, null, "stderr to be empty")
					equal(code, 0, "exit code to be 0")
					done()

			test '--2spaces', (done) ->
				safeps.spawn ['node', cliTest.bin, cliTest.sourcePath, '--2spaces'], (err,stdout,stderr,code) ->
					expected = CSON.createCSONString(sourceData, {indent:'  '})
					equal(err, null, "error to be empty")
					equal(stdout.toString(), expected, "stdout to be as expected")
					equal(stderr?.toString() or null, null, "stderr to be empty")
					equal(code, 0, "exit code to be 0")
					done()

			test '--4spaces', (done) ->
				safeps.spawn ['node', cliTest.bin, cliTest.sourcePath, '--4spaces'], (err,stdout,stderr,code) ->
					expected = CSON.createCSONString(sourceData, {indent:'    '})
					equal(err, null, "error to be empty")
					equal(stdout.toString(), expected, "stdout to be as expected")
					equal(stderr?.toString() or null, null, "stderr to be empty")
					equal(code, 0, "exit code to be 0")
					done()
