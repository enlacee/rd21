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
	<span>{name}</span>
	<ul>
		<li each={ children } riot-tag="coleccion-item"></li>
	</ul>
	<script>

	</script>
</coleccion-item>
