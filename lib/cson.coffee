# Requires
coffee = require 'coffee-script'
fs = require 'fs'


# Exports
module.exports = 


	# Parse a CSON file
	# next(err,obj)
	parseFile: (filePath,next) ->
		fs.readFile filePath, (err,data) =>
			if err then return next err
			@parse data.toString(), next
		
		# Done
		return

	# Parse a CSON file
	parseFileSync: (filePath) ->
		@parseSync fs.readFileSync(filePath).toString()

	# Parse a CSON string
	# next(err,obj)
	parse: (src,next) ->
		# Try parse JSON first
		try
			obj = JSON.parse src
		
		# Now try parse CSON
		catch err
			try
				json = coffee.compile 'return '+src
				obj = eval json
			
			# Parsing failed
			catch err
				next err
			
		# Parsing completed
		next false, obj
		
		# Done
		return

	# Parse a CSON string Synchronously
	parseSync: (src) ->
		try # Try parse JSON first
			JSON.parse src
		catch err # Now try parse CSON
			eval coffee.compile('return '+src)

	# Turn an object into JSON/CSON
	# next(err,str)
	stringify: (obj,next) ->
		# Try stringing
		try
			str = JSON.stringify obj
		
		# Stringing failed
		catch err
			next err
		
		# Stringing completed
		next false, str
		
		# Done
		return

	# Turn an object into JSON/CSON Synchronously
	stringifySync: (obj) ->
		JSON.stringify obj
