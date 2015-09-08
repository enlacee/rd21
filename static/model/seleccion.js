/**
* ## seleccion
*/
env.seleccion.rs = [];

env.seleccion.agregar = function(model) {
	this.rs.push(model);
	env.seleccion.trigger('render', {data : this.rs });
}

env.seleccion.remover = function(indice) {
	this.rs.splice(indice, 1);
	env.seleccion.trigger('render', {data : this.rs });
}

/**
* Busca objeto por indice URL si lo encuentra lo devuelve
* @return object|boolean
*/
env.seleccion.buscarItem = function(href) {
	var array = this.rs;
	for (var i = 0; i < array.length; i++) {
		if (array[i].href == href) {
			return {indice: i, data: array[i]}
		}
	}
	return false;
}
