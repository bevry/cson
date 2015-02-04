# Requires
fsUtil = require('safefs')
pathUtil = require('path')
{requireFreshSafe} = require('requirefresh')

# Awesomeness
wait = (delay,fn) -> setTimeout(fn, delay)

# Define
CSON =
	# ====================================
	# Helpers

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


	# ====================================
	# Bundles

	stringify: (data, opts) ->
		opts = @getOptions(opts)
		return @createCSON(data, opts)

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

	create: (data, opts) ->
		return @action('create', 'create', '', data, opts)

	parse: (data, opts) ->
		return @action('parse', 'parse', '', data, opts)

	parseFile: (data, opts) ->
		return @action('parseFile', 'parse', 'File', data, opts)

	requireFile: (data, opts) ->
		return @action('requireFile', 'require', 'File', data, opts)

	# ====================================
	# Creating Strings from Objects

	createJSON: (data, opts) ->
		opts = @getOptions(opts)
		opts.visitor ?= null
		opts.indent ?= '  '

		# Stringify
		try
			return JSON.stringify(data, opts.visitor, opts.indent)
		catch err
			return new Error(err)

	createCSON: (data, opts) ->
		opts = @getOptions(opts)
		opts.visitor ?= null
		opts.indent ?= '\t'

		# Stringify
		try
			return require('cson-safe').stringify(data, opts.visitor, opts.indent)
		catch err
			return new Error(err)

	createCS: (data, opts) ->
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


	createJS: (data, opts) ->
		return new Error('CSON.createJS: Creating JavaScript code is not yet supported')


	# ====================================
	# Parsing Strings to Objects

	parseJSON: (data, opts) ->
		try
			return JSON.parse(data)
		catch err
			return new Error(err)

	parseCSON: (data, opts) ->
		try
			return require('cson-safe').parse(data)
		catch err
			return new Error(err)

	parseJS: (data, opts) ->
		opts = @getOptions(opts)
		opts.context ?= {}

		# Parse
		try
			return require('vm').runInNewContext(data, opts.context, opts.filename)
		catch err
			return new Error(err)

	parseCS: (data, opts) ->
		opts = @getOptions(opts)
		opts.sandbox ?= true

		# Parse
		try
			return require('coffee-script').eval(data, opts)
		catch err
			return new Error(err)


	# ====================================
	# Parsing Files to Objects

	parseJSONFile: (file, opts) ->
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			return result
		else
			return @parseJSON(result.toString(), opts)

	parseCSONFile: (file, opts) ->
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			return result
		else
			return @parseCSON(result.toString(), opts)

	parseJSFile: (file, opts) ->
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			return result
		else
			return @parseJS(result.toString(), opts)

	parseCSFile: (file, opts) ->
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			return result
		else
			return @parseCS(result.toString(), opts)



	# ====================================
	# Requiring Files to Objects

	requireJSONFile: (file, opts) ->
		return @parseJSONFile(file, opts)

	requireCSONFile: (file, opts) ->
		return @parseCSONFile(file, opts)

	requireJSFile: (file, opts) ->
		try
			return requireFreshSafe(file)
		catch err
			return err

	requireCSFile: (file, opts) ->
		require('coffee-script/register')
		try
			return requireFreshSafe(file)
		catch err
			return err


# Export
module.exports = CSON