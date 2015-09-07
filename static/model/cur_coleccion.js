/**
* # cur_coleccion.js
*/

env.cur_coleccion.selectedMenu = function(href) {
	this.href = href;
	env.tag_coleccion_lista.update();
}

env.cur_coleccion.traerDatos = function(href) {
	var me = this;
	this.load(href)
		.then(function() {
			env.tag_main_grid.trigger('render', me);
		});
}
