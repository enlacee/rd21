<coleccion-lista>
	<ul>
		<li each={ colecciones } riot-tag="coleccion-item"></li>
	</ul>
	<script>
		var me = this;
		me.colecciones = [];
		env.add('tag_coleccion_lista', me);

		env.tag_coleccion_lista.on('render', function(objecto) {
			me.colecciones = objecto.collections;
			me.update();
		});
	</script>
</coleccion-lista>





<!-- Tag_coleccion_item -->
<coleccion-item>
	<style scoped>
		.selected {
			font-weight:bold;
		}
	</style>

	<span onclick="{ goto }"class="{ selected: this.href == env.cur_coleccion.href }">
		{ name }
	</span>
	<ul>
		<li each={ children } riot-tag="coleccion-item"></li>
	</ul>

	<script>
		goto(event) {
			env.cur_coleccion.selectedMenu(event.item.href);
			env.cur_coleccion.traerDatos(event.item.href);
		}
	</script>
</coleccion-item>
