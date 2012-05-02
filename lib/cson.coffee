# Requires
coffee = require('coffee-script')
js2coffee = require('js2coffee')
fs = require('fs')


# Define
CSON = 
	# Parse a CSON file
	# next(err,obj)
	parseFile: (filePath,next) ->
		# Read the file
		fs.readFile filePath, (err, data) =>
			# Check
			return next(err)  if err

			# Parse
			dataStr = data.toString()
			@parse(dataStr, next)
		
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
	# next(err, obj)
	parse: (src, next) ->
		setTimeout =>
			# Parse
			result = @parseSync(src)
			
			# Check for error
			if result instanceof Error
				# Error
				next(result)
			else
				# Success
				next(null, result)
		, 0

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
				json = coffee.compile("return (#{src})")
				result = eval(json)
			catch err
				result = err

		# Return
		result


	# Turn an object into CSON
	# next(err,str)
	stringify: (obj, next) ->
		setTimeout =>
			# Stringify
			result = @stringifySync(obj)
			
			# Check
			if result instanceof Error
				# Error
				next(result)
			else
				# Success
				next(null, result)
		, 0
		
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