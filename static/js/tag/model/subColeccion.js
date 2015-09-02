/**
* Subcoleccion: contenedor de items
*
* @example
* coleccion
*	subcoleccion
*		item1
*		item2
*/
var model_subColeccion = new AjaxModel();

model_subColeccion.on('updated', function() {
	if (model_subColeccion.items.length > 0) {
		for (var i = 0; i < model_subColeccion.items.length; i++) {
			env['tag-main-grid'].items.push(model_subColeccion.items[i]);
		}
	}
});
