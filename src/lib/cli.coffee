# =====================================
# Requires
#

# Standard Library
fs = require('fs')
path = require('path')
{EventEmitter} = require('events')

# Third Party
{docopt,DocoptLanguageError,DocoptExit} = require('docopt')

# Local
CSON = require(path.join __dirname, '..', 'lib', 'cson')


# -------------------------------------
# Helpers
#

###
# Template docstring.
###
doc = (__PROGRAM_NAME) ->
	# (Note: don't use tabs in this string; use 2-space indent)
	return """
Usage:
  #{__PROGRAM_NAME} -
  #{__PROGRAM_NAME} <file>
  #{__PROGRAM_NAME} --help

Options:
  -h, --help  Print this help


Use '-' to accept STDIN as input.

"""


###
# Helper. Determines whether to read from STDIN.
###
useSTDIN = (parsed_argv) ->
	return parsed_argv['-']      is true or \
	       parsed_argv['<file>'] is null


###
# Uses __PROGRAM_NAME to populate help string.
# Parses command line and returns results.
###
parse = (__PROGRAM_NAME) ->
	name = __PROGRAM_NAME
	doc = doc(name)
	return docopt(doc, {name:name, help:true})



# =====================================
# Main CLI class
#
class CLI extends EventEmitter
	
	constructor: (__PROGRAM_NAME) ->
		@name = __PROGRAM_NAME
		@_initEvents()
		@
	
	_initEvents: () ->
		@on 'file', (cb) ->
			FILE = @parsed_argv['<file>']
			if fs.existsSync(FILE)
				result = CSON.parseFileSync(FILE)
				cb(result)
			else
				err = new Error("#{ FILE } does not exist")
				throw err
		
			# Chain
			@
		
		@on 'stdin', (cb) ->
			data = []
			process.stdin.setEncoding('utf8')
			process.stdin
				.on 'error', (err) ->
					throw err
				.on 'readable', ->
					chunk = process.stdin.read()
					unless chunk is null
						data.push(chunk)
				.on 'end', ->
					data = data.join ''
					result = CSON.parseSync(data)
					cb(result)
		
			# Chain
			@
		
		# Chain
		@
	
	parse: () ->
		@parsed_argv = parse(@name)
		return @parsed_argv
	
	run: (cb) -> 
		if @useSTDIN(@parsed_argv)
			@emit('stdin', cb)
		else
			@emit('file', cb)
	
	useSTDIN: () ->
		return useSTDIN(@parsed_argv)

# Export CLI
module.exports = CLI
