/**
* ## seleccion
*/
env.seleccion.items = [];

env.seleccion.add = function(model) {
	if (this.items.hasOwnProperty(model.key) == false) {
		this.items[model.key] = model;
	}
	env.seleccion.trigger('render', this.getDataObjectItems());
}

env.seleccion.del = function(indice) {
	delete this.items[indice];
	env.seleccion.trigger('render', this.getDataObjectItems());
}

/**
* convertir items 'HashTable' a array
* @return object
*/
env.seleccion.getDataObjectItems = function() {
	var objs = this.items;
	var result = { length: 0, items: objs, itemsArray: [] };

	for (var p in objs) {
		if (objs.hasOwnProperty(p)) {
			result.itemsArray.push(objs[p]);
			result.length++;
		}
	}

	return result;
}
