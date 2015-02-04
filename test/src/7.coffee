if require?
	damages = [require('coffee-script'), require('cson-parser')]
	for damage in damages
		for own key,value of damage
			damage[key] = -> 'sucker'
{a:1}