/**
* ## cur_coleccion
*/
env.cur_coleccion.rs = [];
env.cur_coleccion.traerDatos = function(href) {
	console.log('href', href)
	var me = this;
	this.load(href)
		.then(function() {
			console.log('href: me.data', me.data)

			me.rs = me.data.items;
			env.main_grid_header.trigger('render', { data: me.rs });
	});
}
