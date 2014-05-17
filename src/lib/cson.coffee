# Requires
coffee = require('coffee-script')
js2coffee = require('js2coffee')
fsUtil = require('fs')
pathUtil = require('path')
ambi = require('ambi')
{extractOpts} = require('extract-opts')
{requireFreshSafe} = require('requirefresh')
require('coffee-script/register')

# Awesomeness
wait = (delay,fn) -> setTimeout(fn, delay)

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
		if /\.(js|coffee)$/.test(filePath)
			requireFreshSafe(filePath, next)

		# Try read
		else if /\.(json|cson)$/.test(filePath)
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
		if /\.(js|coffee)$/.test(filePath)
			try
				result = requireFreshSafe(filePath)
			catch err
				result = err

		# Try read
		else if /\.(json|cson)$/.test(filePath)
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
	parseSync: (src,opts) ->
		# Prepare
		opts or= {}
		opts.sandbox ?= true
		# ^ wraps execution of the CSON code in a node virtual machine
		# http://nodejs.org/api/vm.html
		# hiding away external data like the file system from the executed code

		# Try parse JSON
		try
			result = JSON.parse(src)

		# Try parse CSON
		catch err
			try
				# https://github.com/bevry/cson/blob/master/README.md#use-case
				result = coffee.eval(src, opts)

			catch err
				result = err

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
		try
			# js2coffee is a static parser
			# The passed code is not execued, but simply converted
			# The wrapping of `var result` is to simplify the extraction of the result data
			src = "var result = #{JSON.stringify obj}"
			result = js2coffee.build(src)
			result = result.replace(/^\s*result\s*\=\s/,'')
			if typeof obj is 'object'
				unless Array.isArray(obj)
					result = '{\n'+result+'\n}'  unless result is '{}'
		catch err
			result = err

		# Return
		return result


# Export
module.exports = CSON
