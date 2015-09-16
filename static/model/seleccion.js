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

	P.length = function() {
		return this.keys().length;
	}

	P.getItems = function() {
		return items;
	}

	P.clear = function() {
		items = {};
		this.trigger('updated');
	};

	P.each = function(iterador) {
		var indice = 0;
		for (var k in items) {
			iterador(indice, items[k]);
			indice++;
		}
	}

	// return
	env.add('seleccion', new Seleccion());
})();
