<!--
v1.3.10 December 10, 2013
https://github.com/bevry/base
-->


# Contribute


## Resources

- [Coding Standards](http://bevry.me/bevry/coding-standards)
- [Documentation Guidelines](http://bevry.me/bevry/documentation-guidelines)
- [Support Guidelines](http://bevry.me/bevry/support-guidelines)


## Development

For developers and contributors

1. Fork project and clone your fork

2. Install global dependencies

	``` bash
	npm install -g coffee-script
	```

3. Install local dependencies

	``` bash
	cake install
	```

4. Compile project

	``` bash
	# Only once
	cake compile

	# On every change
	cake watch
	```

5. Run tests

	``` bash
	cake test
	```


## Publishing

For project maintainers

1. Update meta files with latest information

	``` bash
	cake prepublish
	```

2. Add a changelog entry to `HISTORY.md` with change information

	```
	v2.0.0 April 17, 2013
		- Something that changes
	```

3. Update `version` entry in `package.json` with new version number

4. Commit changes

	``` bash
	git commit -a -m "A message about what changed"
	```

5. Publish new version

	``` bash
	cake publish
	```
