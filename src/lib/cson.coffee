# Requires
coffee = require('coffee-script')
js2coffee = require('js2coffee')
fs = require('fs')

# Awesomeness
wait = (delay,fn) -> setTimeout(fn,delay)

# Define
CSON =
	# Parse a CSON file
	# next(err,obj)
	parseFile: (filePath,next) ->
		# Try require
		if /\.(js|coffee)$/.test(filePath)
			try
				result = require(filePath)
				next(null,result)
			catch err
				next(err,result)

		# Try read
		else if /\.(json|cson)$/.test(filePath)
			fs.readFile filePath, (err,data) =>
				# Check
				return next(err)  if err

				# Parse
				dataStr = data.toString()
				@parse(dataStr,next)

		# Unknown
		else
			err = new Error("CSON.parseFile: Unknown extension type for #{filePath}")
			next(err)

		# Chain
		@


	# Parse a CSON file
	parseFileSync: (filePath) ->
		# Try require
		if /\.(js|coffee)$/.test(filePath)
			try
				result = require(filePath)
				return result
			catch err
				return err

		# Try read
		else if /\.(json|cson)$/.test(filePath)
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
			return result

		# Unknown
		else
			err = new Error("CSON.parseFileSync: Unknown extension type for #{filePath}")
			return err


	# Parse a CSON string
	# next(err,obj)
	parse: (src,next) ->
		# currently the parser only exists in a synchronous version
		# so we use an instant timeout to simulate async code without any overhead
		wait 0, =>
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
		# Try parse JSON
		try
			result = JSON.parse(src)

		# Try parse CSON
		catch err
			try
				result = coffee.eval(src)
			catch err
				result = err

		# Return
		result


	# Turn an object into CSON
	# next(err,str)
	stringify: (obj,next) ->
		# currently the parser only exists in a synchronous version
		# so we use an instant timeout to simulate async code without any overhead
		wait 0, =>
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
			result = js2coffee.build(src)
			result = result.replace(/^\s*result\s*\=\s/,'')
			if typeof obj is 'object'
				unless obj instanceof Array
					result = '{\n'+result+'\n}'
		catch err
			result = err

		# Return
		result


# Export
module.exports = CSON