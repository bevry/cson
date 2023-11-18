# Requires
fs = require('fs')
CSON = require('./index.js')
{ stdin, stdout, stderr, argv, exit } = process

# Helpers
help = (message = '') ->
	stderr.write """
		CSON CLI

		USAGE

		cson [...options] <input> <output>

		# json to cson, to stdout
		cson in.json

		# json to cson, to file
		cson in.cson out.cson

		# cson to json, to stdout
		cson in.cson

		# cson to json, to file
		cson in.cson out.json

		# explicit conversion to support ambigious extension and stdin

		json2cson in.data out.data
		json2cson in.data > out.data
		cat in.data | json2cson --stdin out.data

		cson --json2cson in.data out.data
		cson --json2cson in.data > out.data
		cat in.data | cson --json2cson --stdin out.data

		cson --cson2json in.data out.data
		cson --cson2json in.data > out.data
		cat in.data | cson --cson2json --stdin out.data

		cson2json in.data out.data
		cson2json in.data > out.data
		cat in.data | cson2json --stdin out.data

		OPTIONS

		--help
		    Display this help.

		--tabs
		--2spaces
		--4spaces
		    Adjust output indentation.
		"""
	if message
		stderr.write "\n\nERROR:\n#{message}\n"
	exit(22)
invalidArg = (arg) ->
	help("Invalid argument: #{arg}")

# prepare
conversion = ''
input = ''
output = ''
opts = {}

# parse
node = argv.shift()
bin = argv.shift()
if bin.includes('json2cson')
	conversion = 'json2cson'
else if bin.includes('cson2json')
	conversion = 'cson2json'
while argv.length
	arg = argv.shift()
	switch arg
		when '--help' then help()
		when '--json2cson' then conversion = 'json2cson'
		when '--cson2json' then conversion = 'cson2json'
		when '--stdin' then input = '/dev/stdin'
		when '--tabs' then opts.indent = '\t'
		when '--2spaces' then opts.indent = '  '
		when '--4spaces' then opts.indent = '    '
		else
			if !input
				input = arg
			else if !output
				output = arg
			else
				return invalidArg(arg)

# determine conversion
if !conversion
	if input.endsWith('.json') || output.endsWith('.cson')
		conversion = 'json2cson'
	else if input.endsWith('.cson') || output.endsWith('.json')
		conversion = 'cson2json'
	else
		return help("Unable to determine conversion from input/output file extensions. You must provide either --json2cson or --cson2json.\n#{node} #{bin} #{input} #{output}}")

# convert input
if input and input isnt '/dev/stdin'
	# prepare file conversion
	if conversion is 'cson2json'
		parse = CSON.parseCSONFile.bind(CSON)
		create = CSON.createJSONString.bind(CSON)
	else
		parse = CSON.parseJSONFile.bind(CSON)
		create = CSON.createCSONString.bind(CSON)

	# convert
	result = parse(input)
	throw result  if result instanceof Error
	result = create(result, opts)
	throw result  if result instanceof Error

	# output
	if output
		fs.writeFileSync(output, result)
	else
		stdout.write(result)

else
	# convert stdin
	data = ''
	hasData = ->
		return data.replace(/\s+/, '').length isnt 0
	processData = ->
		# prepare string conversion
		if conversion is 'cson2json'
			parse = CSON.parseCSONString.bind(CSON)
			create = CSON.createJSONString.bind(CSON)
		else
			parse = CSON.parseJSONString.bind(CSON)
			create = CSON.createCSONString.bind(CSON)

		# convert
		result = parse(data)
		throw result  if result instanceof Error
		result = create(result, opts)
		throw result  if result instanceof Error

		# output
		if output
			fs.writeFileSync(output, result)
		else
			stdout.write(result)

	# timeout if we don't have stdin
	timeoutFunction = ->
		# clear timeout
		clearTimeout(timeout)
		timeout = null
		# if we didn't detect output, then fail
		if hasData() is false
			stdin.pause()
			help('No STDIN data received...')
	timeout = setTimeout(timeoutFunction, 1000)

	# read stdin
	stdin = stdin
	stdin.setEncoding('utf8')
	stdin.resume()  # node 0.8
	stdin.on 'data', (_data) ->
		data += _data.toString()
	stdin.on 'end', ->
		if timeout
			clearTimeout(timeout)
			timeout = null
		processData()
