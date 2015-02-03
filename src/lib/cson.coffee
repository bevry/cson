# Requires
fsUtil = require('safefs')
pathUtil = require('path')
ambi = require('ambi')
{extractOpts} = require('extract-opts')
{requireFreshSafe} = require('requirefresh')
require('coffee-script/register')

# Awesomeness
wait = (delay,fn) -> setTimeout(fn, delay)

# Define
CSON =
	# Helpers
	isJSON:   (filePath) -> /\.(json)$/.test(filePath)
	isCSON:   (filePath) -> /\.(cson)$/.test(filePath)
	isJS:     (filePath) -> /\.(js)$/.test(filePath)
	isCS:     (filePath) -> /\.(coffee)$/.test(filePath)
	isUnsafe: (filePath) -> /\.(js|coffee)$/.test(filePath)
	isSafe:   (filePath) -> /\.(json|cson)$/.test(filePath)


	# ====================================
	# Parsing Strings to Objects

	parseJSON: (data, opts) ->
		try
			return JSON.parse(data)
		catch err
			return err

	parseCSON: (data, opts) ->
		try
			return require('cson-safe').parse(data)
		catch err
			return err

	parseJS: (data, opts) ->
		# Prepare
		opts or= {}
		opts.sandbox ?= true
		opts.context ?= {}
		opts.filename ?= null

		# Parse
		try
			if opts.sandbox isnt false
				return require('vm').runInNewContext(data, opts.context, opts.filename)
			else
				return eval(data)
		catch err
			return err

	parseCS: (data, opts) ->
		# Prepare
		opts or= {}
		opts.sandbox ?= true

		# Parse
		try
			return require('coffee-script').eval(data, opts)
		catch err
			return err


	# ====================================
	# Creating Strings from Objects

	createJSON: (data, opts) ->
		# Prepare
		opts or= {}
		opts.visitor ?= null
		opts.indent ?= '  '

		# Stringify
		try
			return JSON.stringify(data, opts.visitor, opts.indent)
		catch err
			return err

	createCSON: (data, opts) ->
		# Prepare
		opts or= {}
		opts.visitor ?= null
		opts.indent ?= '\t'

		# Stringify
		try
			return require('cson-safe').parse(data, opts.visitor, opts.indent)
		catch err
			return err

	createCS: (data, opts) ->
		return new Error('CSON.createCS: Creating CoffeeScript code is not yet supported')

	createJS: (data, opts) ->
		return new Error('CSON.createJS: Creating JavaScript code is not yet supported')


	# ====================================
	# Parsing Files to Objects

	parseFile: (file, opts) ->
		if @isJS(file)
			if opts.safe is false
				return @parseFileJS(file, opts)
			else
				return new Error('CSON.parseFile: Can only parse JavaScript files in Unsafe Mode')

		else if @isCS(file)
			if opts.safe is false
				return @parseFileCS(file, opts)
			else
				return new Error('CSON.parseFile: Can only parse CoffeeScript files in Unsafe Mode')

		else if @isJSON(file)
			return @requireFileJSON(file, opts)

		else if @isCSON(file)
			return @requireFileCSON(file, opts)

		else
			return Error("CSON.parseFile: Unknown extension type for #{filePath}")

	parseJSONFile: (file, opts) ->
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			return result
		else
			return @parseJS(result, opts)

	parseCSONFile: (file, opts) ->
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			return result
		else
			return @parseCSON(result, opts)

	parseJSFile: (file, opts) ->
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			return result
		else
			return @parseJS(result, opts)

	parseCSFile: (file, opts) ->
		result = fsUtil.readFileSync(file)
		if result instanceof Error
			return result
		else
			return @parseCS(result, opts)



	# ====================================
	# Requiring Files to Objects

	requireFile: (file, opts) ->
		if @isJSON(file)
			return @requireFileJSON(file, opts)

		else if @isCSON(file)
			return @requireFileCSON(file, opts)

		else if @isJS(file)
			if opts.safe is false
				return @requireFileJS(file, opts)
			else
				return new Error('CSON.requireFile: Can only require JavaScript files in Unsafe Mode')

		else if @isCS(file)
			if opts.safe is false
				return @requireFileCS(file, opts)
			else
				return new Error('CSON.requireFile: Can only require CoffeeScript files in Unsafe Mode')

		else
			return Error("CSON.requireFile: Unknown extension type for #{filePath}")

	requireFileJSON: (file, opts) ->
		return @parseFileJSON(file, opts)

	requireFileCSON: (file, opts) ->
		return @parseFileCSON(file, opts)

	requireFileJS: (file, opts) ->
		try
			return requireFreshSafe(file)
		catch err
			return err

	requireFileCS: (file, opts) ->
		require('coffee-script/register')
		try
			return requireFreshSafe(file)
		catch err
			return err




# Export
module.exports = CSON