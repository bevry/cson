# Requires
util = require('util')
path = require('path')

CLI = require(path.join __dirname, '..', 'lib', 'cli')


# Declarations
__PROGRAM_NAME = 'cson2json'

output = (result) ->
	# After parsing a file or STDIN, this final step is the only 
	# runtime difference between cson2json and json2cson
	process.nextTick ->
		result = JSON.stringify(result)
		process.stdout.write(result)

# Parse command line
cli = new CLI(__PROGRAM_NAME)
cli.parse()
cli.run(output)
