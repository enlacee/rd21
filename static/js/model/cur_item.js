/**
* ## cur_item
*/
env.cur_item.rs = '';
env.cur_item.traerDatos = function(href) {
	var me = this;
	this.load(href)
		.then(function() {
			me.rs = me.data; //DATA
			env.inspector.trigger('mostrarItem', { data: me.rs });
	});
}
