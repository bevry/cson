# Imports
fsUtil = require('safefs')
pathUtil = require('path')
extractOptsAndCallback = require('extract-opts')
requireFresh = require('requirefresh')

# Public: The exported CSON singleton
class CSON
	# ====================================
	# Helpers

	# Internal: Ensure Error Type
	ensureErrorType: (err) ->
		if err instanceof Error
			return err
		else
			return @ensureErrorType(err)

	# Internal: Complete with callback if it exists
	complete: (result, next) ->
		# Complete
		if next
			if result instanceof Error
				next(result)
			else
				next(null, result)
			return @
		else
			return result

	# Internal: Fills in any missing options for use in our methods
	#
	# opts - {Object} The options to prepare
	#
	# Returns the same opts {Object} that we received
	getOptions: (opts={}) ->
		opts.format ?= null
		opts.filename ?= null
		if opts.filename
			opts.filename = pathUtil.resolve(opts.filename)
			opts.format ?= @getFormat(opts.filename)
		if opts.filename is null
			delete opts.filename

		opts.json ?= true
		opts.cson ?= true
		opts.javascript ?= false
		opts.coffeescript ?= false

		return opts

	# Internal: Gets the format for a file name or path
	#
	# file - {String} to get the format for
	#
	# Returns the determined format as a {String} ("json", "cson", "coffeescript", or "javascript", or null)
	getFormat: (file) ->
		return switch pathUtil.extname(file)
			when '.json'
				'json'
			when '.cson'
				'cson'
			when '.coffee'
				'coffeescript'
			when '.js'
				'javascript'
			else
				null

	# Internal: Helper for {::createString}, {::parseString}, {::parseFile}, {::requireFile}
	action: (args) ->
		# Prepare
		{action, prefix, suffix, data, opts, next} = args
		suffix ?= ''
		[opts, next] = extractOptsAndCallback(opts, next)

		# Prepare options
		switch action
			when 'requireFile', 'parseFile'
				opts.filename ?= data

		# Add defaults
		opts = @getOptions(opts)

		# Default: CSON
		if opts.format in [null, 'cson']
			if opts.cson is true
				result = @[prefix+'CSON'+suffix](data, opts)
			else
				result = new Error("CSON.#{action}: Desired format is CSON however CSON is disabled by an option")

		# JSON
		else if opts.format is 'json'
			if opts.json is true
				result = @[prefix+'JSON'+suffix](data, opts)
			else
				result = new Error("CSON.#{action}: Desired format is JSON however JSON is disabled by an option")

		# JavaScript
		else if opts.format is 'javascript'
			if opts.javascript is true
				result = @[prefix+'JS'+suffix](data, opts)
			else
				result = new Error("CSON.#{action}: Desired format is JavaScript however JavaScript is disabled by an option")

		# CoffeeScript
		else if opts.format is 'coffeescript'
			if opts.coffeescript is true
				result = @[prefix+'CS'+suffix](data, opts)
			else
				result = new Error("CSON.#{action}: Desired format is CoffeeScript however CoffeeScript is disabled by an option")

		else
			result = new Error("CSON.#{action}: Desired format is not supported")

		# Complete
		return @complete(result, next)



	# ====================================
	# Bundles

	# Public: {Delegates to: .createString}
	stringify: (data, replacer, indent) ->
		opts = {}
		opts.replacer = replacer
		opts.indent = indent
		return @createCSONString(data, opts)

	# Public: {Delegates to: .parseCSONString}
	parse: (data, opts, next) ->
		return @parseCSONString(data, opts, next)

	# Public: {Delegates to: .parseCSONFile}
	load: (data, opts, next) ->
		return @parseCSONFile(data, opts, next)

	# Public: Converts an {Object} into a {String} of the desired format
	#
	# If the format option is not specified, we default to CSON
	#
	# data - {Object} The data to convert
	# opts - {Object} The options (options may also be forwarded onto the parser library)
	#        :format - {String} The format to use: "cson" (default), "json", "coffeescript", or "javascript"
	#        :cson - {Boolean} Whether or not the CSON format should be allowed (defaults to `true`)
	#        :json - {Boolean} Whether or not the JSON format should be allowed (defaults to `true`)
	#
	# Returns {String} or {Error}
	createString: (data, opts, next) ->
		return @action({
			action: 'createString'
			prefix: 'create'
			suffix: 'String'
			data, opts, next
		})

	# Public: Converts a {String} of the desired format into an {Object}
	#
	# If the format option is not specified, we default to CSON
	#
	# data - {String} The string to parse
	# opts - {Object} The options (options may also be forwarded onto the parser library)
	#        :format - {String} The format to use: "cson" (default), "json", "coffeescript", or "javascript"
	#        :cson - {Boolean} Whether or not the CSON format should be allowed (defaults to `true`)
	#        :json - {Boolean} Whether or not the JSON format should be allowed (defaults to `true`)
	#        :coffeescript - {Boolean} Whether or not the CoffeeScript format should be allowed (defaults to `false`)
	#        :json - {Boolean} Whether or not the CoffeeScript format should be allowed (defaults to `json`)
	#
	# Returns {Object} or {Error}
	parseString: (data, opts, next) ->
		return @action({
			action: 'parseString'
			prefix: 'parse'
			suffix: 'String'
			data, opts, next
		})

	# Public: Parses a file path of the desired format into an {Object}
	#
	# If the format option is not specified, we use the filename to detect what it should be, otherwise we default to CSON
	#
	# data - {String} The file path to parse
	# opts - {Object} The options (options may also be forwarded onto the parser library)
	#        :format - {String} The format to use: "cson" (default), "json", "coffeescript", or "javascript"
	#        :cson - {Boolean} Whether or not the CSON format should be allowed (defaults to `true`)
	#        :json - {Boolean} Whether or not the JSON format should be allowed (defaults to `true`)
	#        :coffeescript - {Boolean} Whether or not the CoffeeScript format should be allowed (defaults to `false`)
	#        :json - {Boolean} Whether or not the CoffeeScript format should be allowed (defaults to `json`)
	#
	# Returns {Object} or {Error}
	parseFile: (data, opts, next) ->
		return @action({
			action: 'parseFile'
			prefix: 'parse'
			suffix: 'File'
			data, opts, next
		})

	# Public: Requires or parses a file path of the desired format into an {Object}
	#
	# If the format option is not specified, we use the filename to detect what it should be, otherwise we default to CSON
	#
	# data - {String} The file path to require or parse
	# opts - {Object} The options (options may also be forwarded onto the parser library)
	#        :format - {String} The format to use: "cson" (default), "json", "coffeescript", or "javascript"
	#        :cson - {Boolean} Whether or not the CSON format should be allowed (defaults to `true`)
	#        :json - {Boolean} Whether or not the JSON format should be allowed (defaults to `true`)
	#        :coffeescript - {Boolean} Whether or not the CoffeeScript format should be allowed (defaults to `false`)
	#        :json - {Boolean} Whether or not the CoffeeScript format should be allowed (defaults to `json`)
	#
	# Returns {Object} or {Error}
	requireFile: (data, opts, next) ->
		return @action({
			action: 'requireFile'
			prefix: 'require'
			suffix: 'File'
			data, opts, next
		})


	# ====================================
	# Creating Strings from Objects

	# Public: Converts an {Object} into a JSON {String}
	#
	# data - {Object} The data to convert
	# opts - {Object} The options (options may also be forwarded onto the parser library)
	#        :replacer - {Boolean} The replacer option for `JSON.stringify` (defaults to `null`)
	#        :indent - {Boolean} The indent option for `JSON.stringify` (defaults to two spaces `  `)
	#
	# Returns {String} or {Error}
	createJSONString: (data, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)
		opts = @getOptions(opts)
		opts.replacer ?= null
		opts.indent ?= '  '

		# Stringify
		try
			result = JSON.stringify(data, opts.replacer, opts.indent)
		catch err
			result = @ensureErrorType(err)

		# Complete
		return @complete(result, next)

	# Public: Converts an {Object} into a CSON {String}
	#
	# data - {Object} The data to convert
	# opts - {Object} The options (options may also be forwarded onto the parser library)
	#        :replacer - {Boolean} The replacer option for `require('cson-parser').stringify` (defaults to `null`)
	#        :indent - {Boolean} The indent option for `require('cson-parser').stringify` (defaults to a single tab `'\t'`)
	#
	# Returns {String} or {Error}
	createCSONString: (data, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)
		opts = @getOptions(opts)
		opts.replacer ?= null
		opts.indent ?= '\t'

		# Stringify
		try
			result = require('cson-parser').stringify(data, opts.replacer, opts.indent)
		catch err
			result = @ensureErrorType(err)

		# Complete
		return @complete(result, next)

	# Private: Not yet supported
	createCSString: (data, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)

		# Stringify
		result = new Error('CSON.createCS: Creating CoffeeScript code is not yet supported')

		# Complete
		return @complete(result, next)

		###
		Potentially we could use something like the following from CSON v1
		However the JSON.stringify gets rid of functions...
		which is the entire point of the coffeescript mode over the CSON mode...
		So until we figure out how to toString() an object and keep the functions intact,
		unsafe stringifying to CSON or CS or JS won't happen.

		Perhaps https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toSource
		will be of use one day

		src = "var result = #{JSON.stringify obj}"
		result = require('js2coffee').build(src, opts).code
		result = result.replace(/^\s*result\s*\=\s/, '')
		if /^\s/.test(result) is false
			result = result.trim()
		if typeof obj is 'object'
			unless Array.isArray(obj)
				result = '{'+result+'}'  unless result is '{}'
		return result
		###


	# Private: Not yet supported
	createJSString: (data, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)

		# Stringify
		result = new Error('CSON.createJS: Creating JavaScript code is not yet supported')

		# Complete
		return @complete(result, next)


	# ====================================
	# Parsing Strings to Objects

	# Public: Parses a JSON {String} into an {Object}
	#
	# data - The JSON {String} to parse
	# opts - {Object} The options, unused
	#
	# Returns {Object} or {Error}
	parseJSONString: (data, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)

		# Parse
		try
			result = JSON.parse(data)
		catch err
			result = @ensureErrorType(err)

		# Complete
		return @complete(result, next)

	# Public: Parses a CSON {String} into an {Object}
	#
	# data - The CSON {String} to parse
	# opts - {Object} The options, unused
	#
	# Returns {Object} or {Error}
	parseCSONString: (data, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)

		# Parse
		try
			result = require('cson-parser').parse(data)
		catch err
			result = @ensureErrorType(err)

		# Complete
		return @complete(result, next)

	# Public: Parses a JavaScript {String} into an {Object}
	#
	# data - The JavaScript {String} to parse
	# opts - {Object} The options (also passed to require('vm').runInNewContex)
	#        :context - {Object} The context option that is used in `require('vm').runInNewContext`, defaults to an empty object `{}`
	#
	# Returns {Object} or {Error}
	parseJSString: (data, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)
		opts = @getOptions(opts)
		opts.context ?= {}

		# Parse
		try
			result = require('vm').runInNewContext(data, opts.context, opts)
		catch err
			result = @ensureErrorType(err)

		# Complete
		return @complete(result, next)

	# Public: Parses a CoffeeScript {String} into an {Object}
	#
	# data - The CoffeeScript {String} to parse
	# opts - {Object} The options, forwarded onto `require('coffeescript').eval`
	#
	# Returns {Object} or {Error}
	parseCSString: (data, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)
		opts = @getOptions(opts)

		# Parse
		try
			result = require('coffeescript').eval(data, opts)
		catch err
			result = @ensureErrorType(err)

		# Complete
		return @complete(result, next)


	# ====================================
	# Parsing Files to Objects

	# Public: Parses a JSON file into an {Object}
	#
	# data - {String} The file path to parse
	# opts - {Object} The options, forwarded onto {::parseJSONString}
	#
	# Returns {Object} or {Error}
	parseJSONFile: (file, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)

		# Parse
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			result = result
		else
			result = @parseJSONString(result.toString(), opts)

		# Complete
		return @complete(result, next)

	# Public: Parses a CSON file into an {Object}
	#
	# data - {String} The file path to parse
	# opts - {Object} The options, forwarded onto {::parseCSONString}
	#
	# Returns {Object} or {Error}
	parseCSONFile: (file, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)

		# Parse
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			result = result
		else
			result = @parseCSONString(result.toString(), opts)

		# Complete
		return @complete(result, next)

	# Public: Parses a JAvaScript file into an {Object}
	#
	# data - {String} The file path to parse
	# opts - {Object} The options, forwarded onto {::parseJSString}
	#
	# Returns {Object} or {Error}
	parseJSFile: (file, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)

		# Parse
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			result = result
		else
			result = @parseJSString(result.toString(), opts)

		# Complete
		return @complete(result, next)

	# Public: Parses a CoffeeScript file into an {Object}
	#
	# data - {String} The file path to parse
	# opts - {Object} The options, forwarded onto {::parseCSString}
	#
	# Returns {Object} or {Error}
	parseCSFile: (file, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)

		# Parse
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			result = result
		else
			result = @parseCSString(result.toString(), opts)

		# Complete
		return @complete(result, next)



	# ====================================
	# Requiring Files to Objects

	# Public: {Delegates to: .parseJSONFile}
	requireJSONFile: (file, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)

		# Require
		result = @parseJSONFile(file, opts)

		# Complete
		return @complete(result, next)

	# Public: {Delegates to: .parseCSONFile}
	requireCSONFile: (file, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)

		# Require
		result = @parseCSONFile(file, opts)

		# Complete
		return @complete(result, next)

	# Public: Requires a JavaScript file and returns the result {Object}
	#
	# data - {String} The file path to require
	# opts - {Object} The options, unused
	#
	# Returns {Object} or {Error}
	requireJSFile: (file, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)

		# Require
		try
			result = requireFresh(file)
		catch err
			result = @ensureErrorType(err)

		# Complete
		return @complete(result, next)

	# Public: Requires a CoffeeScript file and returns the result {Object}
	#
	# data - {String} The file path to require
	# opts - {Object} The options, unused
	#
	# Returns {Object} or {Error}
	requireCSFile: (file, opts, next) ->
		# Prepare
		[opts, next] = extractOptsAndCallback(opts, next)

		# Require
		require('coffeescript/register')
		try
			result = requireFresh(file)
		catch err
			result = @ensureErrorType(err)

		# Complete
		return @complete(result, next)

# Export
module.exports = new CSON()
