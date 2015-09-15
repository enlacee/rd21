/**
* ## seleccion
*/
var seleccion = (function() {
	var items = {};

	var Seleccion = function() {
		riot.observable(this);
	}

	var P = Seleccion.prototype;

	P.add = function(key, value) {
		items[key] = value;
		this.trigger('updated');
	}

	P.del = function(key) {
		delete items[key];
		this.trigger('updated');
	}

	P.keys = function() {
		return Object.keys(items)
	}

	P.size = function() {
		return this.keys().length;
	}

	P.getItems = function() {
		return items;
	}

	P.each = function(iterador) {
		var indice = 0;
		for (var k in items) {
			iterador(indice, items[k], items);
			indice = indice + 1;
		}
	}

	// return
	env.add('seleccion', new Seleccion());
})();
