## History

- v1.1.2 June 22, 2011
	- We no longer have `require` cache our configuration files

- v1.1.1 June 21, 2011
	- Fixed main file location

- v1.1.0 June 21, 2011
	- Parsing file changes
		- If files have `js` or `coffee` extension, will try to require them
		- If files have `json` or `cson` extension, will try to read them
		- Otherwise will throw an unknown extension error
	- Unit tests now more explicit and written in [Joe](https://github.com/bevry/joe)

- v1.0.2 Friday 04, 2011
	- Fixed some CSON use cases and added more unit tests

- v1.0.1 Friday 04, 2011
	- Async calls now act asynchronously
		- Thanks to [Ryan LeFevre](https://github.com/meltingice) for [pull request #10](https://github.com/bevry/cson/pull/10) -

- v1.0.0 April 23, 2011
	- Updated tests
	- Updated `package.json` for latest npm
	- Cleaned up the code
	- CoffeeScript dependency is now local
	- Added synchronous API calls to the README
	- Stringify functions now output CSON strings, instead of JSON strings
		- Use `JSON.stringify` if you want JSON strings
	- Added `json2cson` and `cson2json` bin tools

- v0.2 August 10, 2011
	- Added synchronous interface thanks to [clyfe](https://github.com/clyfe) - closes issue [#1](https://github.com/balupton/cson.npm/issues/1) and [#3](https://github.com/balupton/cson.npm/pull/3)

- v0.1 June 2, 2011
	- Initial commit
