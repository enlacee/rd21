/**
* ## cur_coleccion
*/
env.cur_coleccion.rs = [];
env.cur_coleccion.traerDatos = function(href) {
	var me = this;
	this.load(href)
		.then(function() {
			//me.rs = me.data.items;
			me.rs = me.data;
			env.main_grid_header.trigger('render', {data: me.data.items});
			env.main_grid.trigger('render', {data: me.rs});
	});
}
