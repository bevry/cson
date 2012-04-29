# Requires
coffee = require('coffee-script')
js2coffee = require('js2coffee')
fs = require('fs')
_ = require 'underscore'

# Define
CSON = 
	# Parse a CSON file
	# next(err,obj)
	parseFile: (filePath,next) ->
		# Read the file
		fs.readFile filePath, (err,data) =>
			# Check
			return next(err)  if err

			# Parse
			dataStr = data.toString()
			@parse(dataStr,next)
		
		# Chain
		@


	# Parse a CSON file
	parseFileSync: (filePath) ->
		# Read the file
		data = fs.readFileSync(filePath)

		# Check the result
		if data instanceof Error
			# An error occured
			result = data
		else
			# Parse the result
			dataStr = data.toString()
			result = @parseSync(dataStr)

		# Return
		result


	# Parse a CSON string
	# next(err,obj)
	parse: (src,next) ->
		# Parse
		result = @parseSync(src)
		
		# Check for error
		if result instanceof Error
			# Error
			next(result)
		else
			# Success
			next(null,result)

		# Chain
		@


	# Parse a CSON string Synchronously
	parseSync: (src) ->
		# Try parse JSON first
		try
			result = JSON.parse(src)

		# Now try parse CSON
		catch err
			try
				# Grab the CSON and compile it into JavaScript. We'll also assume that
				# it's JSON.
				json = coffee.compile("return (#{src})")

				# Run the JavaScript, which supposedly holds our JSON object. `jsonObj`
				# should hold the value of what was expressed in the CSON file.
				jsonObj = eval json

				# Convert the JSON back into 
				objToJson = JSON.stringify jsonObj

				result = JSON.parse objToJson

				unless _.isEqual result, jsonObj
					throw new Error "The inputed CSON file has been determined as evil."
			catch err
				result = err

		# Return
		result


	# Turn an object into CSON
	# next(err,str)
	stringify: (obj,next) ->
		# Stringify
		result = @stringifySync(obj)
		
		# Check
		if result instanceof Error
			# Error
			next(result)
		else
			# Success
			next(null,result)
		
		# Chain
		@


	# Turn an object into JSON/CSON Synchronously
	stringifySync: (obj) ->
		# Stringify
		try
			src = "var result = #{JSON.stringify obj}"
			result = js2coffee.build(src).replace(/^result \=\n/,'{\n')+'\n}'
		catch err
			result = err

		# Return
		result


# Export
module.exports = CSON