if require?
	damages = [require('coffeescript'), require('cson-parser')]
	for damage in damages
		for own key,value of damage
			damage[key] = -> 'sucker'
{a:1}