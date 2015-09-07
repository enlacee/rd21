/**
* ## menu_coleccion
*/

env.colecciones.rs = [];
env.colecciones.traerDatos = function(href) {
	var me = this;
	this.load(href)
		.then(function() {
			me.rs = me.data;
			env.coleccion_lista.trigger('render', { data: me.rs });
	});
}
