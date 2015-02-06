# Imports
fsUtil = require('safefs')
pathUtil = require('path')
{requireFreshSafe} = require('requirefresh')

# Public: The exported CSON singleton
class CSON
	# ====================================
	# Helpers

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


	# ====================================
	# Bundles

	# Public: {Delegates to: .createString}
	stringify: (data, opts) ->
		return @createString(data, opts)

	# Public: {Delegates to: .parseString}
	parse: (data, opts) ->
		return @parseString(data, opts)

	# Public: {Delegates to: .parseFile}
	load: (data, opts) ->
		return @parseFile(data, opts)

	# Public: {Delegates to: .requireFile}
	require: (data, opts) ->
		return @requireFile(data, opts)

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
	createString: (data, opts) ->
		return @action('createString', 'create', 'String', data, opts)

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
	parseString: (data, opts) ->
		return @action('parseString', 'parse', 'String', data, opts)

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
	parseFile: (data, opts) ->
		return @action('parseFile', 'parse', 'File', data, opts)

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
	requireFile: (data, opts) ->
		return @action('requireFile', 'require', 'File', data, opts)

	# Internal: Helper for {::createString}, {::parseString}, {::parseFile}, {::requireFile}
	action: (action, prefix, suffix='', data, opts={}) ->
		# Prepare options
		switch action
			when 'requireFile', 'parseFile'
				opts.filename ?= data

		# Add defaults
		opts = @getOptions(opts)

		# Default: CSON
		if opts.format in [null, 'cson']
			if opts.cson is true
				return @[prefix+'CSON'+suffix](data, opts)
			else
				return new Error("CSON.#{action}: Desired format is CSON however CSON is disabled by an option")

		# JSON
		else if opts.format is 'json'
			if opts.json is true
				return @[prefix+'JSON'+suffix](data, opts)
			else
				return new Error("CSON.#{action}: Desired format is JSON however JSON is disabled by an option")

		# JavaScript
		else if opts.format is 'javascript'
			if opts.javascript is true
				return @[prefix+'JS'+suffix](data, opts)
			else
				return new Error("CSON.#{action}: Desired format is JavaScript however JavaScript is disabled by an option")

		# CoffeeScript
		else if opts.format is 'coffeescript'
			if opts.coffeescript is true
				return @[prefix+'CS'+suffix](data, opts)
			else
				return new Error("CSON.#{action}: Desired format is CoffeeScript however CoffeeScript is disabled by an option")

		else
			return new Error("CSON.#{action}: Desired format is not supported")

	# ====================================
	# Creating Strings from Objects

	# Public: Converts an {Object} into a JSON {String}
	#
	# data - {Object} The data to convert
	# opts - {Object} The options (options may also be forwarded onto the parser library)
	#        :visitor - {Boolean} The visitor option for `JSON.stringify` (defaults to `null`)
	#        :indent - {Boolean} The indent option for `JSON.stringify` (defaults to two spaces `  `)
	#
	# Returns {String} or {Error}
	createJSONString: (data, opts) ->
		opts = @getOptions(opts)
		opts.visitor ?= null
		opts.indent ?= '  '

		# Stringify
		try
			return JSON.stringify(data, opts.visitor, opts.indent)
		catch err
			return new Error(err)

	# Public: Converts an {Object} into a CSON {String}
	#
	# data - {Object} The data to convert
	# opts - {Object} The options (options may also be forwarded onto the parser library)
	#        :visitor - {Boolean} The visitor option for `require('cson-parser').stringify` (defaults to `null`)
	#        :indent - {Boolean} The indent option for `require('cson-parser').stringify` (defaults to a single tab `'\t'`)
	#
	# Returns {String} or {Error}
	createCSONString: (data, opts) ->
		opts = @getOptions(opts)
		opts.visitor ?= null
		opts.indent ?= '\t'

		# Stringify
		try
			return require('cson-parser').stringify(data, opts.visitor, opts.indent)
		catch err
			return new Error(err)

	# Private: Not yet supported
	createCSString: (data, opts) ->
		return new Error('CSON.createCS: Creating CoffeeScript code is not yet supported')
		###
		Potentially we could use something like the following from CSON v1
		However the JSON.stringify gets rid of functions...
		which is the entire point of the coffee-script mode over the CSON mode...
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
	createJSString: (data, opts) ->
		return new Error('CSON.createJS: Creating JavaScript code is not yet supported')


	# ====================================
	# Parsing Strings to Objects

	# Public: Parses a JSON {String} into an {Object}
	#
	# data - The JSON {String} to parse
	# opts - {Object} The options, unused
	#
	# Returns {Object} or {Error}
	parseJSONString: (data, opts) ->
		try
			return JSON.parse(data)
		catch err
			return new Error(err)

	# Public: Parses a CSON {String} into an {Object}
	#
	# data - The CSON {String} to parse
	# opts - {Object} The options, unused
	#
	# Returns {Object} or {Error}
	parseCSONString: (data, opts) ->
		try
			return require('cson-parser').parse(data)
		catch err
			return new Error(err)

	# Public: Parses a JavaScript {String} into an {Object}
	#
	# data - The JavaScript {String} to parse
	# opts - {Object} The options
	#        :content - {Object} The context option that is used in `require('vm').runInNewContext`, defaults to an empty object `{}`
	#        :filename - {Object} The filename option that is used in `require('vm').runInNewContext`, defaults to the filename if specified
	#
	# Returns {Object} or {Error}
	parseJSString: (data, opts) ->
		opts = @getOptions(opts)
		opts.context ?= {}

		# Parse
		try
			return require('vm').runInNewContext(data, opts.context, opts.filename)
		catch err
			return new Error(err)

	# Public: Parses a CoffeeScript {String} into an {Object}
	#
	# data - The CoffeeScript {String} to parse
	# opts - {Object} The options, forwarded onto `require('coffee-scriot').eval`
	#
	# Returns {Object} or {Error}
	parseCSString: (data, opts) ->
		opts = @getOptions(opts)
		opts.sandbox ?= {}

		# Parse
		try
			return require('coffee-script').eval(data, opts)
		catch err
			return new Error(err)


	# ====================================
	# Parsing Files to Objects

	# Public: Parses a JSON file into an {Object}
	#
	# data - {String} The file path to parse
	# opts - {Object} The options, forwarded onto {::parseJSONString}
	#
	# Returns {Object} or {Error}
	parseJSONFile: (file, opts) ->
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			return result
		else
			return @parseJSONString(result.toString(), opts)

	# Public: Parses a CSON file into an {Object}
	#
	# data - {String} The file path to parse
	# opts - {Object} The options, forwarded onto {::parseCSONString}
	#
	# Returns {Object} or {Error}
	parseCSONFile: (file, opts) ->
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			return result
		else
			return @parseCSONString(result.toString(), opts)

	# Public: Parses a JAvaScript file into an {Object}
	#
	# data - {String} The file path to parse
	# opts - {Object} The options, forwarded onto {::parseJSString}
	#
	# Returns {Object} or {Error}
	parseJSFile: (file, opts) ->
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			return result
		else
			return @parseJSString(result.toString(), opts)

	# Public: Parses a CoffeeScript file into an {Object}
	#
	# data - {String} The file path to parse
	# opts - {Object} The options, forwarded onto {::parseCSString}
	#
	# Returns {Object} or {Error}
	parseCSFile: (file, opts) ->
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			return result
		else
			return @parseCSString(result.toString(), opts)



	# ====================================
	# Requiring Files to Objects

	# Public: {Delegates to: .parseJSONFile}
	requireJSONFile: (file, opts) ->
		return @parseJSONFile(file, opts)

	# Public: {Delegates to: .parseCSONFile}
	requireCSONFile: (file, opts) ->
		return @parseCSONFile(file, opts)

	# Public: Requires a JavaScript file and returns the result {Object}
	#
	# data - {String} The file path to require
	# opts - {Object} The options, unused
	#
	# Returns {Object} or {Error}
	requireJSFile: (file, opts) ->
		try
			return requireFreshSafe(file)
		catch err
			return new Error(err)

	# Public: Requires a CoffeeScript file and returns the result {Object}
	#
	# data - {String} The file path to require
	# opts - {Object} The options, unused
	#
	# Returns {Object} or {Error}
	requireCSFile: (file, opts) ->
		require('coffee-script/register')
		try
			return requireFreshSafe(file)
		catch err
			return new Error(err)


# Export
module.exports = new CSON()