/**
* ## menu_coleccion
*/

env.colecciones.rs = [];
env.colecciones.traerDatos = function(href) {
	console.log('href colecciones ', href)
	var me = this;
	this.load(href)
		.then(function() {
			console.log('href: me.data', me.data)
			me.rs = me.data;
			env.coleccion_lista.trigger('render', { data: me.rs });
/*
			me.rs = me.data.items;
			env.main_grid_header.trigger('render', { data: me.rs });
			*/
	});
}
