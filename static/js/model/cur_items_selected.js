/**
* ## cur_items_selected
*/
env.cur_items_selected.rs = [];

env.cur_items_selected.agregar = function(model) {
	this.rs.push(model);
	env.svg_ver_seleccion.trigger('mostrar', { data: this.rs });
}

env.cur_items_selected.remover = function(indice) {
	this.rs.splice(indice, 1);
	env.svg_ver_seleccion.trigger('mostrar', { data: this.rs });
}

/**
* Busca objeto por indice URL si lo encuentra lo devuelve
* @return object|boolean
*/
env.cur_items_selected.buscarItem = function(href) {
	var array = this.rs;
	for (var i = 0; i < array.length; i++) {
		if (array[i].href == href) {
			return {indice: i, data: array[i]}
		}
	}
	return false;
}
