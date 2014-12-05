# Requires
Parser = require('cson-safe')
fsUtil = require('fs')
pathUtil = require('path')
ambi = require('ambi')
{extractOpts} = require('extract-opts')
{requireFreshSafe} = require('requirefresh')
require('coffee-script/register')

# Awesomeness
wait = (delay,fn) -> setTimeout(fn, delay)

# Helpers
isJsOrCoffee = (filePath) -> /\.(js|coffee)$/.test(filePath)
isJsonOrCson = (filePath) -> /\.(json|cson)$/.test(filePath)

# Define
CSON =
	# Parse a CSON file
	# next(err, obj)
	parseFile: (filePath,opts,next) ->
		# Prepare
		[opts, next] = extractOpts(opts, next)

		# Resolve
		filePath = pathUtil.resolve(filePath)

		# Try require
		if isJsOrCoffee(filePath)
			requireFreshSafe(filePath, next)

		# Try read
		else if isJsonOrCson(filePath)
			fsUtil.readFile filePath, (err,data) =>
				# Check
				return next(err)  if err

				# Parse
				dataStr = data.toString()
				opts.filename = filePath
				@parse(dataStr, opts, next)

		# Unknown
		else
			err = new Error("CSON.parseFile: Unknown extension type for #{filePath}")
			next(err)

		# Chain
		@


	# Parse a CSON file
	parseFileSync: (filePath,opts) ->
		# Prepare
		opts or= {}

		# Resolve
		filePath = pathUtil.resolve(filePath)

		# Try require
		if isJsOrCoffee(filePath)
			try
				result = requireFreshSafe(filePath)
			catch err
				result = err

		# Try read
		else if isJsonOrCson(filePath)
			data = fsUtil.readFileSync(filePath)
			opts.filename = filePath

			# Check the result
			if data instanceof Error
				# An error occured
				result = data
			else
				# Parse the result
				dataStr = data.toString()
				result = @parseSync(dataStr, opts)

			# Return
			return result

		# Unknown
		else
			err = new Error("CSON.parseFileSync: Unknown extension type for #{filePath}")
			return err


	# Parse a CSON string
	# next(err,obj)
	parse: (src,opts,next) ->
		# Prepare
		[opts, next] = extractOpts(opts, next)

		# currently the parser only exists in a synchronous version
		# so we use an instant timeout to simulate async code without any overhead
		# we also use ambi to fire the synchronous function as an asychronous one
		wait 0, => ambi(@parseSync, src, opts, next)

		# Chain
		@


	# Parse a CSON string Synchronously
	parseSync: (src) ->
		# Try parse JSON
		try
			result = JSON.parse(src)

		# Try parse CSON
		catch err
			result =
				try
					# https://github.com/bevry/cson/blob/master/README.md#use-case
					Parser.parse src
				catch err
					err

		# Return
		return result


	# Turn an object into CSON
	# next(err,str)
	stringify: (obj,next) ->
		# currently the parser only exists in a synchronous version
		# so we use an instant timeout to simulate async code without any overhead
		# we also use ambi to fire the synchronous function as an asychronous one
		wait 0, => ambi(@stringifySync, obj, next)

		# Chain
		@


	# Turn an object into JSON/CSON Synchronously
	stringifySync: (obj) ->
		# Stringify
		result =
			try
				Parser.stringify obj, null, 2
			catch err
				err

		# Return
		return result


# Export
module.exports = CSON
