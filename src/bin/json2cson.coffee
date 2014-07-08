# Requires
util = require('util')
path = require('path')

CLI = require(path.join __dirname, '..', 'lib', 'cli')
CSON = require(path.join __dirname, '..', 'lib', 'cson')

# Declarations
__PROGRAM_NAME = 'json2cson'

output = (result) ->	
	# After parsing a file or STDIN, this final step is the only 
	# runtime difference between cson2json and json2cson
	process.nextTick ->
		result = CSON.stringifySync(result)
		process.stdout.write(result)
		
# Parse command line
cli = new CLI(__PROGRAM_NAME, outputCallback = output)
cli.parse()
cli.run(output)
