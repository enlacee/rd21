/**
* # cur_coleccion.js
* carga de datos automatico por AjaxModel.js
*/

env.cur_coleccion.selectedItem = function(href) {
	this.href = href;
	env.tag_coleccion_lista.update();
}
